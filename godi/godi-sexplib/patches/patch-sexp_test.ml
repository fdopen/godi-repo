--- lib_test/sexp_test.ml.orig	2012-05-15 19:04:11.000000000 +0000
+++ lib_test/sexp_test.ml	2012-08-28 20:51:59.727200000 +0000
@@ -16,7 +16,7 @@
 let () =
   let orig_sexps = input_sexps stdin in
 
-  let hum_file = "/tmp/__hum.sexp" in
+  let hum_file = Filename.temp_file "__hum" ".sexp" in
   let hum_oc = open_out hum_file in
   let hum_ppf = formatter_of_out_channel hum_oc in
   List.iter
@@ -25,7 +25,7 @@
   pp_print_flush hum_ppf ();
   close_out hum_oc;
 
-  let mach_file = "/tmp/__mach.sexp" in
+  let mach_file = Filename.temp_file "__mach" ".sexp" in
   let mach_oc = open_out mach_file in
   List.iter
     (fun sexp -> Printf.fprintf mach_oc "%a\n" Sexp.output_mach sexp)
