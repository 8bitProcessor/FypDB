<?php
	header('Content-type: application/json');
	require('config.inc.php');
	$getFrontPage = "SELECT
	threadsAll.title,
	userAcc.username,
	threadsAll.threadID,
	threadsAll.infoOrL,
	category.name,
	threadsAll.score
	FROM threadsAll
	INNER JOIN userAcc
	ON threadsAll.userID = userAcc.userID
	INNER JOIN category
	ON category.catID=threadsAll.categoryID
	ORDER BY SCORE DESC;";
		try{
			$result = $dbhandle->query($getFrontPage);
		}catch(PDOException $e){
				$e->getMessage();
				die();
		}
		$response["frontpage"]= array();
		while($row=$result->fetch()){
				$encode = array();
				$encode['threadID']=$row['threadID'];
				$encode["title"]=$row["title"];
				$encode["score"]=$row["score"];
				$encode["link"]=$row["infoOrL"];
				$encode["category"]=$row["name"];
				$encode["username"]=$row["username"];
				// $encode["infoOrL"]=$row["infoOrL"];

				array_push($response["frontpage"],$encode);
		}
		echo json_encode($response);
?>
