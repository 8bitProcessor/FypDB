<?php
	header('Content-type: application/json');
	require("config.inc.php");
	$jsonString = file_get_contents('php://input');
	$jsonObj = json_decode($jsonString, true);
	$username = $jsonObj['username'];
	$password = $jsonObj['password'];
	$title = $jsonObj['title'];
	$category =$jsonObj['category'];
	$type = $jsonObj['type'];
	$info = $jsonObj['info'];

	// $response["success"] =0;
	// $response["message"]="Thread received Received";
	// echo json_encode($response);
	$query ="SELECT userID, username, passwd FROM userAcc WHERE username='$username'";
	try{
			$queryDetails = $dbhandle->query($query);
	}catch(PDOException $e){
		echo $e->getMessage();
		die();
	}
	$details_correct =false;
	if($queryDetails->rowCount()>0){
		$row=$queryDetails->fetch(PDO::FETCH_OBJ);
		if($password==$row->passwd){
			$details_correct=true;
			$user_id=$row->userID;
		}
		else{
			$response["success"]=0;
			$response["message"]="User details were incorrect";
			$echo json_encode($response);
		}
	}
	if($details_correct){
		$catQuery = "SELECT catID FROM category WHERE name='$category'";
		try{
			$exCat = $dbhandle->query($catQuery);
		}catch(PDOException $e){
			echo $e->getMessage();
		}
		$row = $exCat->fetch(PDO::FETCH_OBJ);
		$categoryID = $row->catID;
		if($type=="Link"){
			$typeOf=1;
		}
		else{
			$typeOf=0;
		}
		$insertThread = "INSERT INTO threadsAll  (typeNo, userID, title, infoOrL, score, categoryID) VALUES ($typeOf, '$user_id', '$title', '$info', 1, '$categoryID');";
		try{
			$insertQuery = $dbhandle->query($insertThread);
		}catch(PDOException $e){
			echo $e->getMessage();
		}
		if($insertQuery){
			$response["success"]=1;
			$response["message"]="Your thread was posted!";
			echo json_encode($response);
			die();
		}
		else{
			$response["success"]=0;
			$response["message"]="There was an error in posting your thread please try again";
			echo json_encode($response);
			die();
		}
	}
?>
