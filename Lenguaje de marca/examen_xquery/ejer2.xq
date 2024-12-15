'Ejercicio2',
<html>
  <head>
    <title>Beatles y Web</title>
  </head>
  <body>
    {
     
      for $b in doc("beatles.xml")//beatle
      return
      <spam>{concat("El beatle ", $b/name/firstname, "",$b/name/lastname, " tiene una web llamada ", $b/@link/string())}</spam>
    }
  </body>
</html>