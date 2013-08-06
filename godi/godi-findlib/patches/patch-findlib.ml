--- src/findlib/findlib.ml.orig	2013-06-11 07:27:39.000000000 +0000
+++ src/findlib/findlib.ml	2013-06-21 10:12:47.063600000 +0000
@@ -22,15 +22,20 @@
 let conf_ldconf = ref "";;
 let conf_ignore_dups_in = ref (None : string option);;
 
-let ocamlc_default = "ocamlc";;
-let ocamlopt_default = "ocamlopt";;
-let ocamlcp_default = "ocamlcp";;
-let ocamloptp_default = "ocamloptp";;
-let ocamlmklib_default = "ocamlmklib";;
-let ocamlmktop_default = "ocamlmktop";;
-let ocamldep_default = "ocamldep";;
-let ocamlbrowser_default = "ocamlbrowser";;
-let ocamldoc_default = "ocamldoc";;
+let add_exec str =
+  match Findlib_config.exec_suffix with
+  | "" -> str
+  | a  -> str ^ a ;;
+let ocamlc_default = add_exec "ocamlc";;
+let ocamlopt_default = add_exec "ocamlopt";;
+let ocamlcp_default = add_exec "ocamlcp";;
+let ocamloptp_default = add_exec "ocamloptp";;
+let ocamlmklib_default = add_exec "ocamlmklib";;
+let ocamlmktop_default = add_exec "ocamlmktop";;
+let ocamldep_default = add_exec "ocamldep";;
+let ocamlbrowser_default = add_exec "ocamlbrowser";;
+let ocamldoc_default = add_exec "ocamldoc";;
+
 
 
 let init_manually 
