for $b in doc ("records.xml")//recordsrecord/country
order by $b
group by $b
return
<spam>{concat($b,' ' ,count(doc)//records/record[country=$b])}</spam>
for $b in doc("records.xml")//record
where $b/country/text()