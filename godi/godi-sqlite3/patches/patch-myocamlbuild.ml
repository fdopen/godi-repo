--- myocamlbuild.ml~	2013-12-16 21:25:06.000000000 +0000
+++ myocamlbuild.ml	2014-01-08 20:03:21.701600000 +0000
@@ -608,6 +608,23 @@
 # 609 "myocamlbuild.ml"
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
