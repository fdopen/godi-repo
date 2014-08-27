external (^$) : ('a -> 'b) -> 'a -> 'b = "%apply"
external (|>) : 'a -> ('a -> 'b) -> 'b = "%revapply"

let try_finally f p g o =
  let module T = struct
    type 'a t =
    | Ok of 'a
    | Err of exn
  end in
  let erg = try T.Ok ( f p ) with x -> T.Err x in
  g o;
  match erg with
  | T.Ok x -> x
  | T.Err x -> raise x


type pipe_state =
| Open
| Closed
| Uninit

type pipe_with_status =
  {
    mutable state: pipe_state;
    mutable fd: Unix.file_descr
 }

let pipe a b =
  let tmp1,tmp2 = Unix.pipe () in
  a.state <- Open;
  a.fd <- tmp1;
  b.state <- Open;
  b.fd <- tmp2

let new_pipe () =
  {state = Uninit;
   fd = Unix.stderr}

let close_pipe a =
  match a.state with
  | Closed
  | Uninit -> ()
  | Open ->
    a.state <- Closed ;
    let rec close fd =
      let closed =
        try
          Unix.close fd;
          true
        with
        | Unix.Unix_error(Unix.EINTR,_,_) -> false
      in
      match closed with
      | true -> ()
      | false -> close fd
    in
    close a.fd

let split_rev str chr =
  let len = String.length str
  and ret = ref []
  and i = ref 0 in
  try
    while !i < len do
      let npos = String.index_from str !i chr in
      let nelem = String.sub str !i (npos - !i) in
      ret := nelem :: !ret ;
      i:= succ npos ;
    done;
    !ret
  with
    | Not_found ->
      let last = String.sub str !i (len - !i) in
      last::!ret

let split str chr = List.rev ^$ split_rev str chr

let rec read fd str start len =
  let n = try Unix.read fd str start len with Unix.Unix_error(Unix.EINTR,_,_) -> min_int in
  if n = min_int then read fd str start len else n

let rec waitpid pid =
  let t =
    try
      Some ( Unix.waitpid [] pid )
    with
    | Unix.Unix_error(Unix.EINTR,_,_) -> None
  in
  match t with
  | Some x -> x
  | None -> waitpid pid


let rec write_real = function
| "" -> ()
| str ->
  let len = String.length str in
  let n = try Unix.write Unix.stdout str 0 len with Unix.Unix_error(Unix.EINTR,_,_) -> min_int in
  if n = min_int || n <= 0 then
    write_real str
  else if n < len then
    String.sub str n (len - n) |> write_real
  else
    ()

let write_stdout str =
  write_real (str ^ "\n")

let create_argv () =
  let dir = Filename.dirname Sys.executable_name in
  let real = Filename.concat dir "pkg-config_real.exe" in
  match Sys.argv with
  | [| |] -> [| real |]
  | _ ->
    let n = Array.copy Sys.argv in
    n.(0) <- real;
    n

let cygwin_root_rex =
  try
    let p_stdout_read = new_pipe ()
    and p_stdout_write = new_pipe () in
    try_finally ( fun () ->
      let shell =
        try
          let exe_dir = Filename.dirname Sys.executable_name in
          let s = Filename.concat exe_dir "..\\..\\..\\bin\\dash.exe" in
          if Sys.file_exists s then
            s
          else
            let s = Filename.concat exe_dir "..\\..\\..\\bin\\bash.exe" in
            if Sys.file_exists s then
              s
            else
              "bash.exe"
        with
        | _ -> "bash.exe"
      in
      let argv = 
        [|
          shell ;
          "-c";
          "/bin/cygpath -m \"$(/bin/readlink -f /)\"";
        |]
      in
      pipe p_stdout_read p_stdout_write;
      let pid = Unix.create_process argv.(0) argv Unix.stdin p_stdout_write.fd Unix.stderr in
      close_pipe p_stdout_write;
      let buf_len = 128 in
      let buf = Buffer.create buf_len
      and buf_str = String.create buf_len
      and x = ref 1 in
      while !x > 0 do
        x := (try read p_stdout_read.fd buf_str 0 buf_len with | _ -> -1) ;
        if !x > 0 then
          Buffer.add_substring buf buf_str 0 !x;
      done;
      close_pipe p_stdout_read;
      let pid', process_status = waitpid pid in
      assert (pid = pid');
      match process_status with
      | Unix.WEXITED 0 -> 
        let len = Buffer.length buf in
        let buf2 = Buffer.create len
        and i = ref 0 in
        while !i < len ; do
          match Buffer.nth buf !i with
          | '\r' | '\n' -> i:= len;
          | x -> Buffer.add_char buf2  x; incr i
        done;
        (match Buffer.contents buf2 with
        | "" -> None
        | x -> 
          if Sys.is_directory x then
            Some (Str.quote x |> Str.regexp)
          else
            None
        )
      | Unix.WEXITED _ 
      | Unix.WSIGNALED _   (* like OCaml's uncaught exceptions *)
      | Unix.WSTOPPED _ ->  None
      (* only possible if the call was done using WUNTRACED
         or when the child is being traced *)
    ) () ( fun () -> close_pipe p_stdout_write; close_pipe p_stdout_read ) ()
  with
  | _ -> None

let output_line = function
| "" -> write_stdout ""
| str ->
  (* 
     Remove windows paths:
     '-L/opt/godi', instead of '-LC:/cygwin/opt/godi'
     This way, linker flags are relocatable,...
  *)
  let str = match cygwin_root_rex with
  | None -> str
  | Some r -> Str.global_replace r "" str 
  in
  let len = String.length str in
  if len = 0 then
    write_stdout ""
  else
    match str.[len-1] with
    | '\r' -> String.sub str 0 (len-1) |> write_stdout
    | _    -> write_stdout str

let rec output_without_last = function
| [] -> assert false
| hd::[] -> hd
| hd::tl -> output_line hd ; output_without_last tl

  
let run () : int =
  let p_stdout_read = new_pipe ()
  and p_stdout_write = new_pipe () in
  try_finally ( fun () ->
    pipe p_stdout_read p_stdout_write;
    let argv = create_argv () in
    let pid = Unix.create_process argv.(0) argv Unix.stdin p_stdout_write.fd Unix.stderr in
    close_pipe p_stdout_write;
    let x = ref 1
    and buf = Buffer.create 4096
    and buf_str = String.create 4096
    and empty = ref false in
    while !x > 0 do
      x := (try read p_stdout_read.fd buf_str 0 4096 with | _ -> -1) ;
      if !x > 0 then (
        Buffer.add_substring buf buf_str 0 !x;
        let str = Buffer.contents buf in
        let last = split str '\n' |> output_without_last in
        Buffer.clear buf;
        match str.[!x-1] with
        | '\n' -> output_line last ; empty:= true;
        | _    -> Buffer.add_string buf last ; empty:=false;
      )
    done;
    close_pipe p_stdout_read;
    if !empty = false then
      write_real (Buffer.contents buf);
    let pid', process_status = waitpid pid in
    assert (pid = pid');
    match process_status with
    | Unix.WEXITED n -> n
    | Unix.WSIGNALED _ -> 2 (* like OCaml's uncaught exceptions *)
    | Unix.WSTOPPED _ ->  3
    (* only possible if the call was done using WUNTRACED
       or when the child is being traced *)
  ) () ( fun () -> close_pipe p_stdout_write; close_pipe p_stdout_read ) ()

let () =
  (*Printf.printf "%S" cygwin_root*)
  let ret = run () in
  exit ret
