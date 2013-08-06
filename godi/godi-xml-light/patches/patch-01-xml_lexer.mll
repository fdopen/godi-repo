--- xml_lexer.mll.orig	2005-11-06 20:05:55.000000000 -0500
+++ xml_lexer.mll	2005-11-06 20:07:37.000000000 -0500
@@ -124,6 +124,12 @@
 			last_pos := lexeme_end lexbuf;
 			token lexbuf
 		}
+	| "<![CDATA["
+		{
+			last_pos := lexeme_start lexbuf;
+			Buffer.reset tmp;
+			PCData (cdata lexbuf)
+		}
 	| "<!DOCTYPE"
 		{
 			last_pos := lexeme_start lexbuf;
@@ -210,6 +216,15 @@
 	| _
 		{ comment lexbuf }
 
+and cdata = parse
+	| "]]>"
+		{ Buffer.contents tmp }
+	| _
+		{
+			Buffer.add_string tmp (lexeme lexbuf);
+			cdata lexbuf
+		}
+
 and header = parse
     | newline
 		{
