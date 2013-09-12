--- myocamlbuild.ml.orig	2012-07-16 14:41:22.000000000 +0000
+++ myocamlbuild.ml	2012-08-16 13:47:17.734000000 +0000
@@ -534,6 +534,23 @@
 # 535 "myocamlbuild.ml"
 (* OASIS_STOP *)
 
+
+(* input_line doesn't strip trailings '\r' on windows ..... *)
+let input_line_win ic =
+  let str = input_line ic in
+  let pred_len = String.length str - 1 in
+  if pred_len < 0 then
+    str
+  else
+   match str.[pred_len] with
+   | '\r' ->  String.sub str 0 pred_len
+   | _ -> str
+
+let input_line = match Sys.os_type with
+| "Win32" -> input_line_win
+| _ -> input_line
+
+
 let read_lines_from_cmd ~max_lines cmd =
   let ic = Unix.open_process_in cmd in
   let lines_ref = ref [] in
