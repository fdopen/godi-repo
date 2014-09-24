--- reloc.ml.orig	2012-03-27 09:38:20.000000000 +0200
+++ reloc.ml	2012-09-02 19:35:56.690353436 +0200
@@ -16,6 +16,8 @@
 let search_path = ref []
 let default_libs = ref []
 
+let creader = Config_reader.create (Filename.concat (Filename.dirname Sys.executable_name) "../etc/flexdll.conf")
+
 let gcc = ref "gcc"
 let objdump = ref "objdump"
 
@@ -29,7 +31,7 @@
     let s = Sys.getenv "FLEXDIR" in
     if s = "" then raise Not_found else s
   with Not_found ->
-    Filename.dirname Sys.executable_name
+    Filename.concat (Filename.dirname Sys.executable_name) "../lib/flexdll"
 
 (* Temporary files *)
 
@@ -84,6 +86,12 @@
 let get_output1 ?use_bash cmd =
   List.hd (get_output ?use_bash cmd)
 
+(* the user can still pass the according directory with FLEXLINKFLAGS *)
+let get_output1o ?use_bash cmd =
+  try
+    Some (get_output1 ?use_bash cmd)
+  with
+  | Failure _ -> None
 
 (* Preparing command line *)
 
@@ -971,14 +979,29 @@
 
 let setup_toolchain () =
   let mingw_libs pre =
-    gcc := pre ^ "-gcc";
-    objdump := pre ^ "-objdump";
-    search_path :=
-      !dirs @
-      [
-       Filename.dirname (get_output1 (!gcc ^ " -print-libgcc-file-name"));
-       get_output1 (!gcc ^ " -print-sysroot") ^ "/mingw/lib";
-      ];
+    gcc := ( match creader#get "gcc" with
+    | Some x -> x
+    | None -> pre ^ "-gcc");
+    objdump := ( match creader#get "objdump" with
+    | Some x -> x
+    | None -> pre ^ "-objdump");
+    search_path := !dirs
+    @
+      ( match creader#get "gcc_file_path" with
+      | Some x -> [x]
+      | None ->
+        match get_output1o (!gcc ^ " -print-libgcc-file-name") with
+        | Some x -> [ Filename.dirname  x]
+        | None -> []
+      )
+    @
+      ( match creader#get "gcc_lib_path" with
+      | Some x -> [x]
+      | None ->
+        match get_output1o (!gcc ^ " -print-sysroot") with
+        | Some x -> [ x ^ "/mingw/lib" ]
+        | None ->  []
+      );
     default_libs :=
       ["-lmingw32"; "-lgcc"; "-lmoldname"; "-lmingwex"; "-lmsvcrt";
        "-luser32"; "-lkernel32"; "-ladvapi32"; "-lshell32" ];
@@ -991,15 +1014,24 @@
       add_flexdll_obj := false;
       noentry := true
   | `CYGWIN ->
-      gcc := "gcc";
-      objdump := "objdump";
+    gcc := (match creader#get "gcc" with
+    | Some x -> x
+    | None -> "gcc");
+    objdump := (match creader#get "objdump" with
+    | Some x -> x
+    | None -> "objdump");
       search_path :=
 	!dirs @
 	  [
            "/lib";
-	   "/lib/w32api";
-           Filename.dirname (get_output1 ~use_bash:true "gcc -print-libgcc-file-name");
-	  ];
+	"/lib/w32api"
+      ] @
+      ( match creader#get "gcc_file_path" with
+      | Some x -> [x]
+      | None ->
+        match get_output1o ~use_bash:true "gcc -print-libgcc-file-name" with
+        | Some x -> [ Filename.dirname x];
+        | None -> [] ) ;
       default_libs := ["-lkernel32"; "-luser32"; "-ladvapi32";
 		       "-lshell32"; "-lcygwin"; "-lgcc"]
   | `MSVC | `MSVC64 ->
@@ -1086,7 +1118,10 @@
 
   use_cygpath :=
     begin
-      match !toolchain, !cygpath_arg with
+      match creader#get "use_cygpath" with
+      | None
+      | Some "" ->
+        (match !toolchain, !cygpath_arg with
       | _, `Yes -> true
       | _, `No -> false
       | (`MINGW|`MINGW64|`CYGWIN), `None ->
@@ -1097,10 +1132,10 @@
               Sys.command "cygpath -S 2>NUL >NUL" = 0
           | _ -> assert false
           end
-      | (`MSVC|`MSVC64|`LIGHTLD), `None -> false
+        | (`MSVC|`MSVC64|`LIGHTLD), `None -> false)
+      | Some x -> bool_of_string (String.lowercase x)
     end;
 
-
   if !verbose >= 2 then (
     Printf.printf "** Use cygpath: %b\n" !use_cygpath;
     Printf.printf "** Search path:\n";
