(* external (^$) : ('a -> 'b) -> 'a -> 'b = "%apply"
external (|>) : 'a -> ('a -> 'b) -> 'b = "%revapply" *)

let environment_with_removed_values names =
  let names = Array.of_list names in

  let env = Unix.environment ()
  and names_len = Array.map String.length names
  and n_names = Array.length names
  and accu = ref []  in

  for i = Array.length env - 1 downto 0 do
    let cur = env.(i) in
    let cur_len = String.length cur
    and remove = ref false  in

    for j = n_names - 1 downto 0 do
      let name_len = names_len.(j) in
      if cur_len > name_len && cur.[name_len] = '=' then
        let j = ref (pred name_len )
        and further = ref true
        and name = names.(j) in
        while !j >= 0 && !further = true do
          if cur.[!j] != name.[!j] then
            further:=false
          else
            decr j
        done;
        if  !j = (-1) then
          remove:=true ;
    done;
    if !remove = false then (
      accu := cur::!accu
    )
  done;
  Array.of_list !accu

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

let is_space = function
|' ' |'\t' | '\n' | '\x0B' | '\x0C' | '\r' -> true
| _ -> false


let remove_spaces_begin_end str =
  let rec iter_end str i =
    if i < 0 then
      0
    else if is_space @@ String.unsafe_get str i then
      iter_end str (pred i)
    else
      succ i
  in
  let rec iter_start str i = (* be careful, don't call me on strings that only contains space *)
    if is_space @@ String.get str i then
      iter_start str (succ i)
    else
      i
  in
  let olen = String.length str in
  let nlen = iter_end str (pred olen) in
  if nlen = 0 then
    ""
  else
    let str_start = iter_start str 0 in
    if str_start = 0 && olen = nlen then
      str
    else
      String.sub str str_start (nlen-str_start)


type split =
| Nosplit
| First_last of string * string


let split_one str char =
  try
    let i = String.index str char in
    let key = String.sub str 0 i
    and value = String.sub str (succ i) (String.length str - i - 1 ) in
    First_last(key,value)
  with
  | Not_found -> Nosplit

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


let split str chr = List.rev @@ split_rev str chr



let rec add_unique htl acc = function
  | [] -> List.rev acc
  | hd :: tl when not (Hashtbl.mem htl hd) ->
      Hashtbl.add htl hd ();
      add_unique htl (hd :: acc) tl
  | _ :: tl ->
      add_unique htl acc tl

let list_unique l =
  let h = Hashtbl.create @@ List.length l in
  add_unique h [] l

let (/) = Filename.concat


let godi_root = Filename.dirname @@ Filename.dirname Sys.executable_name
let cygwin_root = Filename.dirname @@ Filename.dirname godi_root

let env_file_add = godi_root / "etc" / "env_add"
let env_file_ignore = godi_root / "etc" / "env_ignore"

let prepend_to_path = [  ]
let append_to_path = [ godi_root / "bin" ; godi_root / "sbin" ]


let test_dir name =
  let d = cygwin_root / "home" / name in
  try
    if Sys.is_directory d then
      d
    else
      raise Not_found
  with
  | Sys_error _ -> raise Not_found


let default_dir () =
  try
    Sys.getenv "USER" |> test_dir
  with
  | Not_found ->
    try
      Sys.getenv "USERNAME" |> test_dir
    with
    | Not_found ->
      Sys.getcwd  ()

(*
(* temporary disabled due of sh.exe bug *)
let default_home () =
  let win =
    try
      let d = Sys.getenv "HOME" in
      if Sys.is_directory d then
        Some d
      else
        raise Not_found
    with
    | Not_found ->
      try
        Some( Sys.getenv "USER" |> test_dir )
      with
      | Not_found ->
        try
          Some( Sys.getenv "USERNAME" |> test_dir )
        with
        | Not_found -> None
  in
  (match win with
  | None -> ()
  | Some x ->
    for i = 0 to String.length x - 1 do
      match x.[i] with
      | '\\' -> x.[i] <- '/'
      | _ -> ()
    done;
  );
  win
*)

let read_special f file =
  if Sys.file_exists file then  (
    let ch = open_in file in
    try_finally ( fun ch ->
      try
        while true do
          match input_line ch |> remove_spaces_begin_end with
          | "" -> ()
          | str when str.[0] = '#' -> ()
          | str -> f str
        done;
      with
      | End_of_file -> ()
    ) ch ( fun ch -> close_in_noerr ch ) ch
  )

let get_path () =
  try
    Some(Unix.getenv "PATH")
  with
  | Not_found ->
    try
      Some(Unix.getenv "Path")
    with
    | Not_found -> None

let windir =
  try
    Sys.getenv "WINDIR"
  with
  | Not_found ->
    try
      Sys.getenv "WinDir"
    with
    | Not_found -> "C:\\Windows"


let is_prefix ~pref str =
  let len_pref = String.length pref
  and len_str = String.length str in
  if len_pref > len_str then
    false
  else
    let rec iter s1 s2 i =
      if i < 0 then
        true
      else if s1.[i] <> s2.[i] then
        false
      else
        iter s1 s2 (pred i)
    in
    iter pref str (pred len_pref)


let rec remove_other_installations accu = function
| [] -> List.rev accu
| hd::tl ->
  (* is prefix: simplistic checks, we don't remove something important *)
  if hd = "" || hd.[0] = '.' || is_prefix ~pref:windir hd then
    remove_other_installations (hd::accu) tl
  else
    (* now remove concurrent installations of cygwin/ocaml *)
    let ocaml = Filename.concat hd "ocaml.exe"
    and ocamlc = Filename.concat hd "ocamlc.exe"
    and cygpath = Filename.concat hd "cygpath.exe"
    and dash = Filename.concat hd "dash.exe"
    and ocamlfind = Filename.concat hd "ocamlfind.exe" in
    try
      if Sys.file_exists ocaml || Sys.file_exists ocamlc ||
        Sys.file_exists cygpath || Sys.file_exists ocamlfind ||
        Sys.file_exists dash
      then
        remove_other_installations accu tl
      else
        remove_other_installations (hd::accu) tl
    with
    | Sys_error _ -> remove_other_installations (hd::accu) tl


let get_env exe add_paths add_cygwin =
  let dirs_from_exe = match exe with
  | None -> []
  | Some x ->
    let d = Filename.dirname x in
    if Filename.is_relative d then
      []
    else
      [d]
  in
  let htl_add =
    let htl = Hashtbl.create 10 in
    let f str =
      match split_one str '|' with
      | Nosplit -> ()
      | First_last(key,value) ->
        Hashtbl.replace htl key value
    in
    read_special f env_file_add;
    htl
  in
  let ignore_keys =
    let htl_ignore =
      let htl = Hashtbl.create 10 in
      let f str =
        Hashtbl.replace htl str ()
      in
      read_special f env_file_ignore;
      htl
    and f k _v a = k::a in
    Hashtbl.fold f htl_add [ "PATH" ; "Path" (*; "HOME" *) ] |>
        Hashtbl.fold f htl_ignore |> list_unique
  and new_path =
    let append_to_path =
      if add_paths then
        if add_cygwin = true then
          append_to_path  @ [ cygwin_root / "bin" ]
        else
          append_to_path
      else
        []
    and prepend_to_path = if add_paths then prepend_to_path else [] in
    match get_path () with
    | None ->   String.concat ";" (prepend_to_path@append_to_path)
    | Some x ->
      let x = split x ';' |> remove_other_installations [] in
      let l = list_unique (dirs_from_exe @ prepend_to_path @ x @ append_to_path) in
      String.concat ";" l
  in
  let to_add =
    let f k v a = (k ^ "=" ^ v)::a in
    Hashtbl.fold f htl_add [ "PATH=" ^ new_path ]
  and env = environment_with_removed_values ignore_keys in
  List.sort compare @@ to_add @ (Array.to_list env)
(*  let to_add = match default_home () with
  | None ->  to_add
  | Some x -> ( "HOME=" ^ x )::to_add
  in
  to_add @ ( Array.to_list env ) *)




(*
microsoft code:
https://blogs.msdn.com/b/twistylittlepassagesallalike/archive/2011/04/23/everyone-quotes-arguments-the-wrong-way.aspx?Redirected=true
*)
let maybe_quote = function
| "" -> "\"\"" (* empty strings require quotation marks, that doesn't seem
                 to be mentioned in the blogpost and it links *)
| arg ->
  let rec quote_needed str i =
    if i < 0 then false
    else
      match str.[i] with
      | '"'| ' '| '\t' | '\n'| '\x0B' (*vercial tab*)
        -> true
      | _ -> quote_needed str (pred i)
  in
  let len = String.length arg in
  match quote_needed arg (pred len) with
  | false -> arg
  | true ->
    let buf = Buffer.create (len + 10 ) in
    Buffer.add_char buf '"';
    let i = ref 0
    and nbs = ref 0 in
    while !i < len do
      nbs := 0 ;
      while !i < len && arg.[!i] = '\\' do
        incr i;
        incr nbs;
      done;
      if !i = len then (
        (* Escape all backslashes, but let the terminating
           double quotation mark we add below be interpreted
           as a metacharacter. *)
        for _i = 1 to 2 * !nbs do
          Buffer.add_char buf '\\';
        done
      )
      else
        let cur = arg.[!i] in
        if cur = '"' then (
        (* Escape all backslashes and the following
           double quotation mark. *)
        for _i = 0 to 2 * !nbs do
          Buffer.add_char buf '\\';
        done ;
        Buffer.add_char buf '"'
        )
        else (
          (* Backslashes aren't special here. *)
          for _i = 1 to !nbs do
            Buffer.add_char buf '\\';
          done;
          Buffer.add_char buf cur;
        ) ;
        incr i
    done;
    Buffer.add_char buf '"';
    Buffer.contents buf


external run_process : cmdline:string -> env:string -> dir:string -> bool = "win_ex_create_process"

let uniform_sep str =
  let str = String.copy str in
  for i = 0 to String.length str - 1 do
    if str.[i] = '\\' then
       str.[i] <- '/' ;
  done;
  str


let generic_quote quotequote s =
  let l = String.length s in
  let b = Buffer.create (l + 20) in
  Buffer.add_char b '\'';
  for i = 0 to l - 1 do
    if s.[i] = '\''
    then Buffer.add_string b quotequote
    else Buffer.add_char b  s.[i]
  done;
  Buffer.add_char b '\'';
  Buffer.contents b

let unixquote = generic_quote "'\\''"


let () =
  if Array.length Sys.argv < 1 then (
    exit 2
  ) ;
  let add_paths = ref true
  and first_arg = ref None
  and do_wait = ref false
  and add_cygwin = ref true in
  let cmdline =
    let args = ref []
    and i = ref 1
    (* there are two kind of command line options:
     * - options for this program (at the beginning)
     * - options for the program, that should be called (at the end)
     * they are seperated by "--"
     *)
    and own_opts = ref true
    and use_mintty = ref false
    and use_bash = ref false
    and add_bin_path = ref true
    and bash_strings = ref []
    and mintty_title = ref None
    and max = Array.length Sys.argv in
    while !i < max do
      let cur = Sys.argv.(!i) in
      incr i;
      match !own_opts with
      | false ->
        if !add_bin_path && !first_arg = None then
          first_arg := Some cur ;
        begin match !use_bash with
        | false -> args := cur::!args
        | true ->
          match !bash_strings with
          | [] ->
            let bash = cygwin_root / "bin" / "bash.exe" in
            args := "-c"::"-l"::bash::!args;
            bash_strings := [ uniform_sep cur ]
          | _  -> bash_strings := cur::!bash_strings
        end
      | true ->
        match cur with
        | "--wait" ->
          do_wait:= true;
        | "--no-exe-path" ->
          add_bin_path := false
        | "--no-cygwin" ->
          add_cygwin := false;
        | "--with-bash" ->
          use_bash := true ;
          (* paths are already added by bash *)
          add_paths := false
        | "--with-mintty" -> use_mintty := true
        | "--mintty-title" ->
          mintty_title := Some(Sys.argv.(!i));
          incr i
        | "--no-paths" -> add_paths := false
        | "--" ->
          own_opts := false ;
          if !use_mintty then (
            let mintty = cygwin_root / "bin" / "mintty.exe" in
            args := mintty::!args;
            begin match !mintty_title with
            | None -> ()
            | Some x -> args := x :: "--title" :: !args
            end;
            args :="-e"::!args;
          )
        | _ -> ()
    done;
    if !use_bash then (
      let narg = List.rev_map unixquote !bash_strings |> String.concat " " in
      args := narg :: !args
    );
    List.rev_map maybe_quote !args |> String.concat " "
  in
  let env = get_env !first_arg !add_paths !add_cygwin in
  let env =String.concat "\000" env ^ "\000"
  and dir = default_dir () in
  match run_process ~env ~cmdline ~dir with
  | true ->
    (* I couldn't find anything like this in run2.
     * However, it sometimes fails without Unix.sleep
     * With Unix.sleep, the windows are not activated.
     *)
    if !do_wait then
      Unix.sleep 15 ;
    exit(0)
  | false -> exit(127)
