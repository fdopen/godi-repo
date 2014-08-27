let system_trust = `File (
  try
    let fln = Sys.getenv "GNUTLS_SYSTEM_TRUST_FILE" in
    if Sys.file_exists fln then
      fln
    else
      raise Not_found
  with
  | Not_found ->
    let (//) = Filename.concat in
    let exec_dir = (Filename.dirname Sys.executable_name) in
    try
      let fln = 
        exec_dir // ".." // "etc" // "cacert.pem"
      in
      if Sys.file_exists fln then
        fln
      else
        raise Not_found
    with
    | Not_found -> exec_dir // "cacert.pem" )
