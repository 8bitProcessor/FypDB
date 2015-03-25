<?php
	require("config.inc.php");

	if(!empty($_POST)){
		$username = $_POST['username'];
		$password = $_POST['password'];

	if(empty($_POST['username']) || empty($_POST['password'])){
			header('Content-type: application/json');
			$response["success"]=0;
			$response["message"]="Please enter your username and password";
			die(json_encode($response));
		}

		$query ="SELECT userID, username, passwd FROM userAcc WHERE username='$username'";
		try{
				$queryLogin = $dbhandle->query($query);
		}catch(PDOException $e){
			echo $e->getMessage();
	    die();
		}
	//	$queryDB = mysqli_query($conn, $query) or die("Error in MySQL connection");
		$login_ok =false;
		if($queryLogin->rowCount()>0){
			$row=$queryLogin->fetch(PDO::FETCH_OBJ);
			if($password==$row->passwd){
				$login_ok=true;
			}
		}
		if($login_ok){
			header('Content-type: application/json');
			$response["success"]=1;
			$response["message"]="Login Successful!";
			die(json_encode($response));
		}else{
			header('Content-type: application/json');			
			$response["success"]=0;
			$response["message"]="Username or Password was incorrect";
			die(json_encode($response));
		}
	}
?>
