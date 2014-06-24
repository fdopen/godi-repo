val write_cyg17_symlink : string -> string -> unit
val read_symlink : string -> (string * string) option

type mount_flags = {
  mount_binary : bool;
  mount_exec : bool;
  mount_cygdrive : bool;
  mount_cygwin_exec : bool;
  mount_notexec : bool;
  mount_acl : bool;
  mount_bind : bool;
  mount_dos : bool;
  mount_ihash : bool;
  mount_user : bool;
  mount_posix : bool;
}
type mount_entry = {
  me_posix : string list;
  me_win32 : string option;
  me_flags : mount_flags;
}
type mount_table = {
  mt_entries : mount_entry list;
  mt_cygdrive_prefix : string;
  mt_cygdrive_flags : mount_flags;
  mt_posix_root_win32 : string;
  mt_posix_root_me_flags : mount_flags;
}

val slashify : string -> string
val backslashify : string -> string

val mount_data : string option ref
val get_mount_table : unit -> mount_table

type split_filename =
    [ `Error
    | `POSIX_absolute of string list
    | `Relative of string list
    | `WIN32_drive of string * string list
    | `WIN32_remote of string * string list ]

val pathsep_re : Str.regexp

val get_splitname : string -> split_filename

val translate_to_posix :
  mount_table -> split_filename -> (string list * mount_flags) option

val enable_caching : unit -> unit

val disable_caching : unit -> unit

val translate_to_win32 :
  mount_table -> split_filename -> bool -> string * mount_flags option
