--- xml_lexer.mll.orig	2005-11-20 23:51:34.000000000 -0500
+++ xml_lexer.mll	2005-11-20 23:51:38.000000000 -0500
@@ -109,7 +109,7 @@
 let newline = ['\n']
 let break = ['\r']
 let space = [' ' '\t']
-let identchar =  ['A'-'Z' 'a'-'z' '_' '0'-'9' ':' '-']
+let identchar =  ['A'-'Z' 'a'-'z' '_' '0'-'9' ':' '-' '.']
 let entitychar = ['A'-'Z' 'a'-'z']
 let pcchar = [^ '\r' '\n' '<' '>' '&']
 
