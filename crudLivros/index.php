<!DOCTYPE html>
<html lang="en">
<head>
	<title>CRUD</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<?php include("menu.php"); ?>


<h1>Biblioteca</h1>

     
	<?php
	
	include("banco_dados_conexao.php");
	
	try {
	
		
		$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$sth = $dbh->prepare('SELECT * from livros');
		$sth->execute();
		$result = $sth->fetchAll(PDO::FETCH_ASSOC);
		
		// escrevendo cabeçalho a partir dos índices do vetor FETCH_ASSOC


   		echo '<table>';
		echo "<tr>";
        
		foreach($result[0] as $index=>$values) {
			echo "<th>$index</th>";
		}
		echo "<th></th>";
		echo "</tr>";
		echo "</th>";
		
		// escrevendo resultado do SELECT
		foreach($result as $row) {
			echo "<tr>";
			foreach($row as $value){
				echo "<td>$value</td>";
			}
			echo "<td>";
			echo "<a href='excluir.php?id=".$row["id"]."'>";
			echo 'Excluir';
			echo "</a>";
			echo "&nbsp;&nbsp;&nbsp;";
			echo "<a href='alterar_formulario.php?id=".$row["id"]."'>";
			echo 'Alterar';
			echo "</a>";
			echo "</td>";
			echo "</tr>";
		}

		echo '</table>';

		$dbh = null;
	} catch (PDOException $e) {
		print "Error!: " . $e->getMessage() . "<br/><br><a href='index.php'>voltar</a>";
		die();
	}

	
	?>

<?php include("footer.php"); ?>
</body>
</html>


