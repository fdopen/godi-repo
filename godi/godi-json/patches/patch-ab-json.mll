--- src/json.mll.orig	2006-03-15 18:36:17.000000000 +0100
+++ src/json.mll	2006-03-15 18:59:47.000000000 +0100
@@ -156,27 +156,15 @@
 ;;
 
 
-let saved_token = Stack.create ();;	(* token stack *)
-
-let get_token lexbuf =
-  if Stack.is_empty saved_token
-  then
-    token lexbuf
-  else
-    Stack.pop saved_token
-;;
-
-let save_token tok =
-  Stack.push tok saved_token 
-;;
-
 (** [deserialize] does all the hard work of deserializing a JSON
   * string into an equivalent JSON type. *)
 let deserialize str = 
-  let lexbuf = Lexing.from_string str
-  in
-  let rec deserialize_rec lexbuf =
-    let tok = get_token lexbuf
+  let lexbuf = Lexing.from_string str in
+  let stream = Stream.from
+                 (fun _ -> 
+		    match token lexbuf with EOF -> None | tok -> Some tok) in
+  let rec deserialize_rec () =
+    let tok = Stream.next stream
     in
       match tok with
 	  TRUE -> (Bool true)
@@ -186,16 +174,16 @@
 	| STRING x -> (String x)
 	| OBRACE ->
 	    (* decode a JSON object -- actually returns a list of pairs *)
-	    let rec object_decode lexbuf =
-	      let key = deserialize_rec lexbuf
+	    let rec object_decode () =
+	      let key = deserialize_rec ()
 	      in
-	      let colon = get_token lexbuf
+	      let colon = Stream.next stream
 	      in
-	      let value = deserialize_rec lexbuf
+	      let value = deserialize_rec ()
 	      in
-	      let comma = get_token lexbuf
+	      let comma = Stream.next stream
 	      in
-	      let next = get_token lexbuf (* slight lookahead *)
+	      let next = Stream.peek stream (* slight lookahead *)
 	      in
 		match key with
 		    String k ->
@@ -205,13 +193,14 @@
 			  begin
 			    match comma with
 				COMMA ->
-				  if next == CBRACE
-				  then
+				  if next = Some CBRACE
+				  then (
+				    ignore(Stream.next stream);
 				    [(k,value)]
+				  )
 				  else
 				    begin
-				      save_token next ;
-				      (k,value)::object_decode lexbuf
+				      (k,value)::object_decode ()
 				    end
 			      | CBRACE -> [(k,value)]
 			      | _ -> raise (Invalid_argument "illegal character found")
@@ -223,33 +212,48 @@
 	    in
 	    let obj = Hashtbl.create 16
 	    in
+	    if Stream.peek stream = Some CBRACE then
+	      ignore(Stream.next stream)
+	    else
 	      List.iter (fun (key,value) -> Hashtbl.add obj key value)
-		(object_decode lexbuf) ; (Object obj)
+		(object_decode ()) ; 
+	    (Object obj)
 	| OBRACK ->
-	    let rec array_decode lexbuf =
-	      let value = deserialize_rec lexbuf
+	    let rec array_decode () =
+	      let value = deserialize_rec ()
 	      in
-	      let comma = get_token lexbuf
+	      let comma = Stream.next stream
 	      in
-	      let next = get_token lexbuf
+	      let next = Stream.peek stream
 	      in
 		match comma with
 		    COMMA ->
-		      if next == CBRACK
-		      then
-			[value]
+		      if next = Some CBRACK
+		      then (
+			ignore(Stream.next stream);
+			[value] 
+		      )
 		      else
 			begin
-			  save_token next ;
-			  value :: array_decode lexbuf
+			  value :: array_decode ()
 			end
 		  | CBRACK -> [value]
 		  | _ -> raise (Invalid_argument "illegal character found")
 	    in
-	      Array (Array.of_list (array_decode lexbuf))
+	    if Stream.peek stream = Some CBRACK then
+	      (ignore(Stream.next stream); Array [| |])
+	    else
+	      Array (Array.of_list (array_decode ()))
 	| NULL -> Null
 	| _ -> raise (Invalid_argument "illegal token found")
   in
-    deserialize_rec lexbuf
+  try
+    let r =
+      deserialize_rec () in
+    Stream.empty stream;
+    r
+  with
+    | Stream.Failure ->
+	raise (Invalid_argument "illegal token found")
 ;;
 }
