<!DOCTYPE html>
<html lang="en">
<head>
<title>CRUD</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


</head>
<body>

<?php include("menu.php"); ?>



<?php
	include("banco_dados_conexao.php");	
	
	try {
	
		$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

		$stmt = $dbh->prepare("update livros set titulo=?,autor=? where id=?");
		$stmt->bindParam(1, $titulo);
		$stmt->bindParam(2, $autor);
		$stmt->bindParam(3, $id);

		$titulo = $_POST["titulo"];
		$autor = $_POST["autor"];
		$id = $_POST["id"];

		if($stmt->execute())
		echo "
		<br><br>
		Alteração realizada com sucesso!
		";

	} catch (PDOException $e) {
		print "Error!: " . $e->getMessage() . "<br/><br><a href='index.php'>voltar</a>";
		die();
	}
?>

<br><br><a href="index.php">voltar</a>

</div>

<?php include("footer.php"); ?>
</body>
</html>
