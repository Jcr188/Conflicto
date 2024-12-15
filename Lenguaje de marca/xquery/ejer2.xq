"OBTENER TODOS LOS TITULOS DE LOS LIBROS",
for $b in doc("books.xml")//catalog/book
return $b/title/text(),

"OBTENER AUTORES Y RESPECTIVOS TITULOS",
for $b in doc("books.xml")//book
return concat ($b/author, ':' ,$b/title),

"LISTAR TODOS LOS LIBROS DE UN GENERO (FANTASY)",
for $b in doc("books.xml")//book[genre="Fantasy"]
return $b/title,

"OBTENER EL NUMERO TOTAL DE LIBROS",
count(//book),

"OBTENER SUMA DE PRECIO DE TODOS LOS LIBROS",
sum(//book/price),

"OBTENER PRECIO MEDIO DE LOS LIBROS",
let $libros:=count(//book)
let $suma :=sum(//book/price)
return $suma div $libros,

"LISTAR LIBROS PUBLICADOS DESPUES DE UNA FECHA",
for $b in //book[publish_date > "2001-03-10"]
return $b/title,

"OBTENER TODOS LOS LIBROS CON UN PRECIO MENOR A 15",
for $b in //book[price < 15]
return $b/title,

"OBTENER EL LIBRO CON EL ID=BK105",
for $b in //book[@id="bk105"]
return $b/title