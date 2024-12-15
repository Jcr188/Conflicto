for $b in doc("beatles.xml")//beatle
return $b/name,

for $b in doc("beatles.xml")//beatle/name
return $b/firstname
