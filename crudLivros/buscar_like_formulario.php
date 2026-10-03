<!DOCTYPE html>
<html lang="en">
<head>
<title>CRUD</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


</head>
<body>

<?php include("menu.php"); ?>


	<h1>Buscar</h1>
	<form method="post" action="buscar_like_resultado.php">
	
		Nome:
		<input type="text" id="titulo" name="titulo">
    
	<br><input type="submit" name="buscar" value="Buscar">
	</form>
	<br><br><a href="index.php" >voltar</a>


<?php include("footer.php"); ?>
</body>
</html>