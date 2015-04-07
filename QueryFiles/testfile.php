<?php
header('Content-type: application/json');
	require("config.inc.php");
	$jsonString = file_get_contents('php://input');
	require("config.inc.php");
	$jsonObj = json_decode($jsonString, true);
	$username = $jsonObj['username'];
	$password = $jsonObj['password'];

	if(empty($_POST['username']) || empty($_POST['password'])){
			$response["success"]=0;
			$response["message"]="Please enter both your username and password";
			echo json_encode($response);

		}
		$query ="SELECT userID, username, passwd FROM userAcc WHERE username='$username'";
		try{
				$queryLogin = $dbhandle->query($query);
		}catch(PDOException $e){
			echo $e->getMessage();

		}
		$login_ok =false;
		if($queryLogin->rowCount()>0){
			$row=$queryLogin->fetch(PDO::FETCH_OBJ);
			if($password==$row->passwd){
				$login_ok=true;
			}
		}
		if($login_ok){
			$response["success"]=1;
			$response["message"]="Login Successful!";
			echo json_encode($response);

		}else{
			$response["success"]=0;
			$response["message"]="Username or Password was incorrect";
			echo json_encode($response);

		}
?>
