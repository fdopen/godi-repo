--- runtime/comintf.c.orig	2004-07-08 11:49:37.000000000 +0200
+++ runtime/comintf.c	2006-01-20 19:31:17.186116279 +0100
@@ -26,6 +26,19 @@
 
 int camlidl_num_components = 0;
 
+#ifndef _WIN32
+IID IID_IUnknown;
+
+static void init_IID_IUnknown (void) {
+    IID_IUnknown.Data1 = -1;
+    IID_IUnknown.Data2 = -1;
+    IID_IUnknown.Data3 = -1;
+    memcpy(IID_IUnknown.Data4, 
+	   "\377\377\377\377\377\377\377\377",
+	   sizeof(IID_IUnknown.Data4));
+}
+#endif
+
 static void camlidl_finalize_interface(value intf)
 {
   interface IUnknown * i = (interface IUnknown *) Field(intf, 1);
@@ -84,6 +97,9 @@
 {
   struct camlidl_component * comp = this->comp;
   int i;
+#ifndef _WIN32
+  init_IID_IUnknown();
+#endif
   for (i = 0; i < comp->numintfs; i++) {
     if (comp->intf[i].iid != NULL && IsEqualIID(iid, comp->intf[i].iid)) {
       *object = (void *) &(comp->intf[i]);
