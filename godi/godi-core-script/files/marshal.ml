let get_marshal_value fln =
  let ch = open_in_bin fln in
  let v = input_value ch in
  close_in ch;
  Marshal.to_string v []


let () =
  let dir = Sys.argv.(1) in
  let ch = open_out Sys.argv.(2) in
  let files = Sys.readdir dir in
  let f str =
    if String.length str > 6 then
      let len = String.length str in
      match String.sub str (len-6) 6 with
      | ".netdb" ->
        let mv =  get_marshal_value (Filename.concat dir str)
        and name = String.sub str 0 (len-6) in
        Printf.fprintf ch "  Netdb.set_db \"%s\" \"%s\" ;\n"
          (String.escaped name)
          (String.escaped mv) ;
      | _ -> ()
  in
  output_string ch "let init_netdb () = \n";
  Array.iter f files ;
  output_string ch "  Netdb.disable_file_db ()\n";
  close_out ch
