
(*
   param: file name
   file_error: true if an error occured when reading the file
*)
val create: string -> < file_error : bool; get : string -> string option >
