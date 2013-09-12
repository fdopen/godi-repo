--- setup.ml.orig	2012-07-16 15:43:00.000000000 +0000
+++ setup.ml	2012-08-30 20:29:41.691000000 +0000
@@ -6033,6 +6033,8 @@
   in
   loop search_paths
 
+let search_iconv () = try Sys.getenv "GODI_PREFIX" with | Not_found -> search_iconv ()
+
 let iconv_prefix =
   BaseEnv.var_define
     ~short_desc:(fun () -> "iconv installation prefix")
@@ -6124,6 +6126,8 @@
     exit 1
   end
 
+let check_iconv () = "true"
+
 (* Define the need_liconv variable *)
 let need_liconv =
   BaseEnv.var_define
