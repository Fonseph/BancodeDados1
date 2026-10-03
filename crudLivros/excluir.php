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

		$stmt = $dbh->prepare("delete from livros where id = ?;");
		$stmt->bindParam(1, $id);

		$id = $_GET["id"];

		if($stmt->execute())
		echo "
		<br>
		<br>
		Excluído com sucesso!
		";

	} catch (PDOException $e) {
		print "Error!: " . $e->getMessage() . "<br/><br><a href='index.php'>voltar</a>";
		die();
	}
?>

<br><br><a href="index.php">voltar</a>


<?php include("footer.php"); ?>
</body>
</html>
