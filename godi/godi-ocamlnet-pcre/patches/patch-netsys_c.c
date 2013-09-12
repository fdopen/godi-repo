--- src/netsys/netsys_c.c.orig	2013-07-21 13:06:08.000000000 +0000
+++ src/netsys/netsys_c.c	2013-08-09 09:57:34.942000000 +0000
@@ -75,6 +75,8 @@
 CAMLprim value netsys_sysconf_open_max (value unit) {
 #ifdef HAVE_SYSCONF
     return Val_long(sysconf(_SC_OPEN_MAX));
+#elif _WIN32
+    return Val_long(_getmaxstdio () );
 #else
     invalid_argument("Netsys.sysconf_open_max not available");
 #endif
