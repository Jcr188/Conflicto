'A.Muestra el nombre de todos los bailes (contenido).',
(:Ejercicio2.a:)
for $baile in doc ("bailes.xml")//baile/nombre/text()
return $baile,

'B.Consigue el nombre de todos los bailes que se realizan en la sala número uno
(elemento).',
(:Ejercicio2.b:)
for $baile in doc ("bailes.xml")/bailes/baile[sala=1]
return $baile,

'C.Muestra todos los bailes con toda su información que se imparten en la sala
número dos y cuyo precio sea menor que 35,00 EUROS (elemento).',
(:Ejercicio2.c:)
for $baile in doc ("bailes.xml")/bailes/baile[sala=2 and precio<35]
return $baile,

'D.Obtén el nombre de todos los profesores que dan clase con cuotas mensuales
(contenido).',
(:Ejercicio2.d:)
for $baile in doc ("bailes.xml")/bailes/baile
where $baile/precio/@cuota="mensual"
return $baile/profesor/text(),

'E.Genera un nuevo documento XML que almacena la información de los bailes que
imparte el profesor "Jesús Lozano" con la siguiente estructura:',
(:Ejercicio2.e:)
for $baile at $i in doc("/home/javi/Documentos/Javi/1DAM/LENGUAJE DE MARCA/BASEX/bailes.xml")/bailes/baile
where $baile/profesor ="Jesús Lozano"

return 

<bailes_lozano profesor="Jesús Lozano">
  <baile num="{$i}">
    <nombre>{$baile/nombre/text()}</nombre>
    <plazas>{$baile/plazas/text()}</plazas>
    <duracion>{$baile/comienzo/text()} A {$baile/fin/text()}</duracion>
  </baile>
</bailes_lozano>,

'Genera un documento HTML con una tabla HTML que muestre el nombre del
baile, el profesor que lo imparte y el número de plazas ofertadas, pero
estableciendo la condición de ser bailes con cuota trimestral. Además, se
ordenarán de menor a mayor los bailes según el número de plazas disponibles.',
(:Ejercicio2.f:)

<html>
  <head>
    <tittle>Bailes con cuota Trimestral</tittle>
  </head>  
  <body>
      <table border = "3">
        <tr>
          <th>Nombre del Baile</th>
          <th>Profesor</th>
          <th>Número de Plazas</th>
        </tr>
        {
          for $baile in doc ("/home/javi/Documentos/Javi/1DAM/LENGUAJE DE MARCA/BASEX/bailes.xml")//bailes/baile
          where $baile/precio/@cuota="trimestral"
          order by $baile/plazas
          return <tr>    
                    <td>{$baile/nombre/text()}</td>
                    <td>{$baile/profesor/text()}</td>
                    <td>{$baile/plazas/text()}</td>
                 </tr>
        }
     </table>
  </body>
</html>