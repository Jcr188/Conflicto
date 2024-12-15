"A. Obtener el número de alumnos de la clase (número).",
(:Ejercicio4.a:)
count(//alumno),


"B. Obtener el número de módulos que se imparten (número).",
(:Ejercicio4.b:)
count(//asignatura),

"C. Obtener el nombre y apellidos de todos los alumnos matriculados en algún
módulo, es decir que tenga alguna nota (elemento). Usa el operador unión.",
(:Ejercicio4.c:)
for $clase in doc ("ejercicio_4_clase.xml")//alumno
return $clase/apenom,


"D. Obtener las calificaciones del alumno de código n43483437 en cada uno de sus módulos. Para ello genera el siguiente XML:",
(:Ejercicio4.d:)
let $codi := "n43483437"
let $alum := <alumno cod="n43483437">

  {
    for $nota in doc("ejercicio_4_clase.xml")//nota[@alum = $codi]
    return
    <modulo>\n
      <nombre_modulo>{/clase/asignaturas/asignatura[@cod = $nota/@asig]/@nombre}</nombre_modulo>\n
      <nota>{$nota/@calificacion}</nota>\n
    </modulo>
  }
</alumno>
return $alum,


"E. Obtener los nombres de los alumnos matriculados en LMSGI y sus notas. El
resultado estará ordenado por notas de forma descendente. Para ello genera el
siguiente XML:",
(:Ejercicio4.e:)
let $codi := "a4"
let $alum := 
  for $nota in doc("ejercicio_4_clase.xml")//nota[@asig = $codi]
  let $alum := //alumnos/alumno[@cod = $nota/@alum]
  order by $alum/apenom/text() descending
  return
    <alumno>\n
      <nombre>{$alum/apenom/text()}</nombre>\n
      <nota>{$nota/@calificacion}</nota>\n
    </alumno>
return
<lmsgi>
  {$alum}
</lmsgi>,

"F.Repite el ejercicio anterior, pero muestra solo los alumnos que hayan aprobado.",
(:Ejercicio4.f:)
let $codi := "a4"
let $alum := 
  for $nota in doc("ejercicio_4_clase.xml")//nota[@asig = $codi and @calificacion > 5]
  let $alum := //alumnos/alumno[@cod = $nota/@alum]
    order by $alum/apenom/text() descending
  return
    <alumno>\n
      <nombre>{$alum/apenom/text()}</nombre>\n
      <nota>{$nota/@calificacion}</nota>\n
    </alumno>
return
<lmsgi>
 {$alum}
</lmsgi>