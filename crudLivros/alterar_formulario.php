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
	?>


	<h1>Alterar</h1>
	<form method="post" action="alterar_update.php">
	
		<?php
			try {
				$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				$stmt = $dbh->prepare('SELECT id,titulo,autor from livros where id = ?');
				$stmt->bindParam(1, $id);
				$id = $_GET["id"];
				$stmt->execute();
				$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
				$dbh = null;

				?>
				<br> Id:
				<input type='text' id="id" name='id' value='<?php echo $result[0]["id"];?>' readonly>
    			
				<br>livros:
				<input type='text' id="titulo" name='titulo' value='<?php echo $result[0]["titulo"];?>'>
    			
				<br>Autor:
				<input type="text" id="autor" name="autor" value='<?php echo $result[0]["autor"];?>'>
    			
				<?php

			} catch (PDOException $e) {
				print "Error!: " . $e->getMessage() . "<br/><br><a href='index.php'>voltar</a>";
				die();
			}
		?>

	
	<br><input type="submit" name="alterar" value="Alterar">
	</form>

	<br><br><a href="index.php" >voltar</a>

</div> 

<?php include("footer.php"); ?>
</body>
</html>
