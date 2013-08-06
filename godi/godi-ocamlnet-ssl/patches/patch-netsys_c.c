--- src/netsys/netsys_c.c.orig	2012-07-19 23:25:25.000000000 +0000
+++ src/netsys/netsys_c.c	2012-08-31 15:33:19.080000000 +0000
@@ -75,6 +75,8 @@
 CAMLprim value netsys_sysconf_open_max (value unit) {
 #ifdef HAVE_SYSCONF
     return Val_long(sysconf(_SC_OPEN_MAX));
+#elif _WIN32
+    return Val_long(_getmaxstdio () );
 #else
     invalid_argument("Netsys.sysconf_open_max not available");
 #endif
