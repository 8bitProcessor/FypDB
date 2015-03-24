<?php
	require("config.inc.php");
	//default categories
	try{
	$getCat = $dbhandle->query("SELECT name, description FROM category WHERE defaultCat='1'");
	}catch(PDOException $e){
		$e->getMessage();
		die();
	}
	while($row =$getCat->fetch(PDO::FETCH_ASSOC)){
			$encode['Default Categories'][] =$row;
	}
	echo json_encode($encode);
?>
