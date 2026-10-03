<!DOCTYPE html>
<html lang="en">
<head>
<title>CRUD</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<?php include("menu.php"); ?>


<h1>Cadastro</h1>



<form method="post" action="cadastro_insert.php">
	<br>	
	Titulo:
	<input type="text" class="form-control" id="titulo" name="titulo">
    
	<br>
	Autor:
	<input type="text" class="form-control" id="autor" name="autor">
	<br>	

    <button type="submit">Cadastrar</button>
  </form>

	<br><br><a href="index.php">voltar</a>



<?php include("footer.php"); ?>
</body>
</html>