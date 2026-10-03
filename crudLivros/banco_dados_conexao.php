<?php
try {
	// //pgsql
	//$host='localhost';
	//$db = 'crud';
	//$username = 'postgres';
	//$password = 'postgres';
	//$dsn = "pgsql:host=$host;port=5432;dbname=$db;user=$username;password=$password";
	//$dbh = new PDO($dsn);

	// //mysql
	$host='localhost';
	$db = 'crudlivro';
	$username = 'root';
	$password = '';
	$dbh = new PDO('mysql:host='.$host.';dbname='.$db.'', $username, $password);
} catch (PDOException $e) {
	print "Error!: " . $e->getMessage() . "<br/><br><a href='index.php'>voltar</a>";
	die();
}

	
?>

