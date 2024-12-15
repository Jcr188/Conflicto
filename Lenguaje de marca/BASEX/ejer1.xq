'A.Consigue el nombre de los módulos que se imparten en el instituto (elemento).',
(:Ejercicio1.a:)
/ies/modulos/modulo/nombre,

'B.Muestra el nombre de los módulos del ciclo ASIR (contenido).',
(:Ejercicio1.b:)
for $nombre in doc("ejercicio_1_modulos_informatica.xml")/ies/modulos/modulo[ciclo="ASIR"]
return $nombre/ciclo/text(),

'C.Devuelve el nombre de los módulos que se imparten en el segundo curso de
cualquier ciclo (elemento).',
(:Ejercicio1.c:)
for $nombre in doc("ejercicio_1_modulos_informatica.xml")/ies/modulos/modulo[curso= 2]
return $nombre/nombre/text(),

'D.Devuelve el nombre de los módulos que se imparten en el primer curso de ASIR
(elemento) y ordénalos alfabéticamente.',
(:Ejercicio1.d:)
for $nombre in doc("ejercicio_1_modulos_informatica.xml")/ies/modulos/modulo[curso=1 and ciclo="ASIR"]
order by $nombre/nombre
return $nombre/nombre,

'E.Obtén el nombre de los módulos con menos de 5 horas semanales (contenido).',
(:Ejercicio1.e:)
for $nombre in doc("ejercicio_1_modulos_informatica.xml")/ies/modulos/modulo[horasSemanales<5]
return $nombre/horasSemanales/text(),

'F.Devuelve el número de módulos que se imparten en el primer curso de ASIR
(número).',
(:Ejercicio1.f:)
count(//modulo[curso=1 and ciclo="ASIR"]),

'G.Muestra las horas semanales de los módulos con más de 3 horas semanales
(contenido).',
(:Ejercicio1.g:)
for $nombre in doc("ejercicio_1_modulos_informatica.xml")/ies/modulos/modulo[horasSemanales>3]
return $nombre/horasSemanales/text()