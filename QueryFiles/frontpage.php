<?php
	header('Content-type: application/json');
	require('config.inc.php');
	$getFrontPage = "SELECT userAcc.username, threadsAll.userID, threadsAll.title, threadsAll.infoOrL FROM userAcc, threadsAll WHERE threadsAll.userID=userAcc.userID";
		try{
			$result = $dbhandle->query($getFrontPage);
		}catch(PDOException $e){
				$e->getMessage();
				die();
		}
		$response["frontpage"]= array();
		while($row=$result->fetch()){
				$encode = array();
				$encode["title"]=$row["title"];
				$encode["username"]=$row["username"];
				// $encode["infoOrL"]=$row["infoOrL"];

				array_push($response["frontpage"],$encode);
		}
		echo json_encode($response);
?>
