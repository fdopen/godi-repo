type split =
  | Nosplit of string
  | First_last of string * string

let split_one str char =
  try
    let i = String.index str char in
    let key = String.sub str 0 i
    and value = String.sub str (succ i) (String.length str - i - 1 ) in
    First_last(key,value)
  with
  | Not_found -> Nosplit str

let is_space = function
|' ' |'\t' | '\n' | '\x0B' | '\x0C' | '\r' -> true
| _ -> false

let remove_spaces_begin_end str =
  let rec iter_end str i =
    if i < 0 then
      0
    else if is_space ( String.unsafe_get str i) then
      iter_end str (pred i)
    else
      succ i
  in
  let rec iter_start str i = (* be careful, don't call me on strings that only contains space *)
    if is_space (String.get str i) then
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

let strip_quotes valu =
  let slenm1 = String.length valu - 1 in
  if slenm1 < 1 then
    valu
  else if (valu.[0] = '\'' && valu.[slenm1] = '\'') ||
          (valu.[0] = '"' && valu.[slenm1] = '"')  then
    String.sub valu 1 (pred slenm1)
  else
    valu

let report_error fln s =
  Printf.eprintf "invalid line in file '%s' ('%s')\n%!" fln s

let create fln =
  let htl = Hashtbl.create 3
  and error = ref false in
  begin try
    let ch = open_in fln in
    (try
       while true do
         let s = match split_one (input_line ch) '#' with
         | Nosplit s
         | First_last(s,_) -> s
         in
         match remove_spaces_begin_end s with
         | "" -> ()
         | s  ->
           match split_one s '=' with
           | Nosplit s -> report_error fln s
           | First_last(key,valu) ->
             match String.lowercase (remove_spaces_begin_end key) with
             | "" -> report_error fln s
             | key ->
               let valu = strip_quotes (remove_spaces_begin_end valu) in
               Hashtbl.replace htl key valu
       done;
     with
     | End_of_file ->  close_in ch )
    with
    | Sys_error _ -> error := true
  end;
  (object
    val er = !error
    method file_error = er
    method get s = try Some( Hashtbl.find htl (String.lowercase s) ) with Not_found -> None
   end )


(*
let first_line str =
  try
    let i = String.index str '\n' in
    let i = if i > 0  && str.[i-1] = '\r' then i - 1 else i in
    String.sub str 0 i
  with
  | Not_found -> str
*)
