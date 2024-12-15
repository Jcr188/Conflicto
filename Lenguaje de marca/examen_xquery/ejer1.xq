'Usando XPath y/o XQuery y usando la base de datos generada por books.xml que se adjunta junto al documento devuelve el título en formato texto de aquellos libros que no su género (genre) no sea Computers y el precio sea inferior a 5.',
for $b in doc("books.xml")//book[genre !="Computer" and price/number() < 5]
return $b/title/text(),

'A continuación devuelve en número entero cuántos son estos libros. Se recomienda XPath a secas y son dos consultas distintas aunque se muestren seguidas.',
count(//book/price)

