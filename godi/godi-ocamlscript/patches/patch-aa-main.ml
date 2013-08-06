--- main.ml.orig	2012-02-04 01:24:21.000000000 +0000
+++ main.ml	2013-04-21 19:27:57.266400000 +0000
@@ -482,7 +482,7 @@
     match Array.to_list Sys.argv with
 	ocamlscript :: (arg1 :: other_args as l) -> 
 	  (match guess_arg1 arg1 with
-	       `Script_name -> (`File (absolute arg1), l)
+	       `Script_name -> (`File (absolute (CygwinPath.to_native arg1)), l)
 	     | `Ocamlscript_args (opt1, stopped, hardcoded_script_args) ->
 		 let command_line_script_args = 
 		   let continued_args =
@@ -513,6 +513,7 @@
 			     (`Stdin,
 			      "" :: hardcoded_script_args)
 			 | script_name :: l -> 
+                           let script_name = CygwinPath.to_native script_name in
 			     Opt.set "source" Opt.from (`File script_name);
 			     (`File (absolute script_name), 
 			      script_name :: (hardcoded_script_args @ l)))
