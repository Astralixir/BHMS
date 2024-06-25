<?php

try{
	$conn = new PDO('mysql:dbname=dbbhms;host=localhost','root','');
	$conn->

	setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
	$conn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
	echo "Connection failed: " .$e->getMessage();
}


?>