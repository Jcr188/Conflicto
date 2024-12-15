'A. Muestra los títulos de todos los libros (contenido).',
(:Ejercicio3.a:)
for $libros in doc("ejercicio_3_libros.xml")//libro/titulo/text()
return $libros,

'B. Devuelve todos los títulos de los libros del año 2000. (elemento).',
(:Ejercicio3.b:)
for $libros in doc("ejercicio_3_libros.xml")//libro
where $libros/@year=2000
return $libros/titulo,

'C. Devuelve todos los títulos de los libros entre el año 1995 y 2000. Ambos incluidos.
(elemento).',
(:Ejercicio3.c:)
for $libros in doc("ejercicio_3_libros.xml")//libro
where $libros/@year >=1995 and $libros/@year<=2000
return $libros/titulo,

'D. Obtén todos los títulos de los libros que tengan algún autor de apellido ‘Stevens’
(contenido).',
(:Ejercicio3.d:)
for $libros in doc("ejercicio_3_libros.xml")//libro
where $libros/autor[apellido="Stevens"]
return /$libros/titulo/text(),

'E. Muestra los títulos de todos los libros almacenados de la editorial "Addison-
Wesley", primero con una cláusula "for" y, a continuación, con una cláusula "let"
(elemento).',
(:Ejercicio2.e:)
for $libros in doc("ejercicio_3_libros.xml")//libro
where $libros[editorial="Addison-Wesley"]
return /$libros/titulo,

'Ejercicio e con clausula let',
(:Ejercicio3.e:)
let $libros :=doc("ejercicio_3_libros.xml")//libro[editorial="Addison-Wesley"]
return $libros/titulo,

"F.Consigue todos los títulos de los libros que tengan un solo autor ordenados por
precio (elemento).",
(:Ejercicio2.f:)
for $libros in doc("ejercicio_3_libros.xml")//libro
let $autor := count($libros/autor)
where $autor = 1
order by $libros/precio
return $libros/titulo, 

"G.Devuelve todos los títulos de los libros que tengan más de dos autores ordenados
por su título (elemento)",
(:Ejercicio3.g:)
for $libros in doc("ejercicio_3_libros.xml")//libro
let $autor := count($libros/autor)
where $autor > 2
order by $libros/titulo
return $libros/titulo,

"H.Devuelve el título y el año de cada uno de los libros junto con el número de
autores de cada libro (elemento). ¿Puedes hacerlo directamente?",
(:Ejercicio3.h:)
for $libros in doc("ejercicio_3_libros.xml")//libro
order by $libros/@year
return ($libros/titulo,$libros/@year,$libros/count($libros/autor)),

" I.Repite el apartado generando el siguiente fichero XML:",
(:Ejercicio2.i:)

for $libros in doc("ejercicio_3_libros.xml")//libro
order by $libros/@year
return

<resumen_bib>
  <libro>
<titulo>{$libros/titulo/text()}</titulo>
<anio>{$libros/@year}</anio>
<num_autores>{count($libros/autor)}</num_autores>
  </libro>
</resumen_bib>,

"J.Devuelve los títulos de todos los libros y los apellidos de sus dos primeros autores.
En el caso de que existan más de dos autores para un libro, se añade un tercer autor et al. Para ello genera el siguiente XML:",
(:Ejercicio3.j:)
for $libros in doc("ejercicio_3_libros.xml")//libro
return

<resumen_bib>
  <libro>\n
<titulo>{$libros/titulo}</titulo>\n
<autores>\n
    <apellido>{$libros/autor/apellido}</apellido>\n
    </autores>\n
  </libro>\n
  <libro>\n
<titulo>{$libros/titulo}</titulo>\n
<autores>\n
    <apellido>{$libros/autor/apellido}</apellido>\n
        <apellido>{$libros/autor/apellido}</apellido>\n
        <apellido>{$libros/apellido}</apellido>\n
</autores>\n
  </libro>\n
</resumen_bib>,

"k. Devuelve los títulos de todos los libros, su editorial y los comentarios del mismo, si
es que tiene algún comentario. Si no tiene, usarás la etiqueta <sin_comentario/>.
Para ello genera el siguiente XML:",
(:Ejercicio3.k:)
let $libros := doc("ejercicio_3_libros.xml")
let $comentarios := doc("ejercicio_3_libros_comentarios.xml")
return
<resumen_bib_com>\n
    {
for $libro in $libros//bib/libro
return
<libro>\n
<titulo>{ $libro/titulo/text() }</titulo>\n
<editorial>{ $libro/editorial/text() }</editorial>\n
       {
let $tituloLibro := normalize-space($libro/titulo/text())let $comentario := $comentarios//entrada[titulo = $tituloLibro]/comentario
return
if (empty($comentario)) 
then <sin_comentario/> 
else <comentario>{ normalize-space($comentario/text()) }</comentario>
       }
</libro>
    }
</resumen_bib_com>,



"L.Consigue los títulos de todos los libros en los que al menos uno de sus autores es
'Stevens' (elemento). Usa 'some'. Este cuantificador existencial permite definir
consultas que devuelvan algún elemento que satisfaga la condición.",
(:Ejercicio3.l:)
for $libro in doc("ejercicio_3_libros.xml")//libro
let $ape := $libro/autor/apellido
where some $ape in $libro satisfies $ape/autor/apellido = "Stevens"
return $libro/titulo,



(:Ejercicio3.m:)
"M. Devuelve todos los títulos de los libros en los que todos los autores sean 'Stevens'(elemento). Usa every. Este cuantificador existencial permite devolver los elementos en los que todos sus nodos satisfagan la condición.",
for $libro in doc("ejercicio_3_libros.xml")//libro
let $ape := $libro/autor/apellido
where every $ape in $libro/autor satisfies contains($ape/autor, "Stevens")
return $libro/titulo,

"N. Devuelve todos los apellidos distintos de los autores (elemento). Usa distinct-values(). Esta función extrae los valores de una secuencia de nodos y crea una nueva secuencia con valores únicos eliminando los nodos duplicados.",
(:Ejercicio3.n:)
for $autor in doc("ejercicio_3_libros.xml")//libro/autor
let $ape := distinct-values($autor/apellido)
return $ape,

"O. Usa empty() y exists() en dos consultas distintas inventadas por ti. La función empty() devuelve cierto cuando la expresión entre paréntesis está vacía. La función opuesta a empty() es exists(), la cual devuelve cierto cuando una secuencia contiene, al menos, un elemento.",
for $libro in doc("ejercicio_3_libros.xml")//libro
let $titulo := empty(($libro/titulo))return true(),
for $libro in doc("ejercicio_3_libros.xml")//bib/libro
let $editorial := exists($libro/editor) return ($editorial)

