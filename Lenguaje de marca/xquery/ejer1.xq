"OBTENER TODOS LOS NOMBRES DE LOS BEATLES",
for $b in doc("beatles.xml") //beatle
return concat($b/name/firstname, ' ', $b/name/lastname),
"OBTENER ENLACES DE TODOS LOS BEATLES",
for $b in doc("beatles.xml") //beatle
return $b/@link,
"CONTAR EL NUMERO DE BEATLES",
count(/beatles/beatle),
"OBTENER NOMBRE Y ENLACE DEL BEATLE CON EL PRIMER NOMBRE PAUL",
for $b in doc("beatles.xml")//beatle[name/firstname ="Paul"]
return concat ($b/name/firstname, ' '  ,$b/name/lastname, ' ' ,$b/@link),
"LISTAR TODOS LOS BEATLES CUYO ENLACE CONTIENE WEB",
for $b in //beatle[contains(@link, 'web')]
return concat($b/name/firstname, ' ', $b/name/lastname, ': ', $b/@link),
"OBTENER TODOS LOS APELLIDOS DE LOS BEATLES",
for $b in //beatle/name
return $b/lastname/text(),

"OBTENER EL BEATLE CON EL APELLIDO STARR ",
for $b in doc("beatles.xml")//beatle[name/lastname="Starr"]
return concat ($b/name/firstname, ' ' ,$b/name/lastname),

"LISTAR TODOS LOS BEATLES QUE TIENEN ATRIBUTO REAL",
for $b in //beatle[@real]
return concat ($b/name/firstname,' ' ,$b/name/lastname)
