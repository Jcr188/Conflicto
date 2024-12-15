"OBTENER TODOS LOS NOMBRES",
for $b in //record
return $b/name/text(),


"FILTRAR REGISTROS POR PAIS EJEMPLO CANADA",
for $b in //record[country="Canada"]
return $b/name,

"CONTAR CUANTOS REGISTROS HAY POR PAIS",
for $country in distinct-values(doc("records")/records/record/country)
return
    <recuento>
          <pais>{$country}</pais>
          <total>{count(doc("records")/records/record[country = $country])}</total>
    </recuento>,
    
    "LISTAR REGISTROS DE MAS DE 50$",
for $t in /records/record
where xs:decimal(substring-after($t/currency, "$")) > 65
return $t,

"OBTENER TODAS LAS URLs DE ESPANA",
for $b in //record[country="Spain"]
return $b/url,

"ENCONTRAR LA DIRECCION URL DE GRIFFITH RANDALL",
for $b in //record[name="Griffith Randall"]
return $b/url,

"OBTENER SUMA TOTAL DE LAS CANTITADES CURRENCY EN $",
let $t := sum(
    for $x in /records/record/currency
    return xs:decimal(substring-after($x, "$")))
return $t

