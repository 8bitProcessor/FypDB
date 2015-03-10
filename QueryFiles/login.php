<?php
	require("config.inc.php");

	if(!empty($_POST)){
		$username = $_POST['username'];
		$password = $_POST['password'];

	if(empty($_POST['username']) || empty($_POST['password'])){
			$response["success"]=0;
			$response["message"]="Please enter your username and password";
			die(json_encode($response));
		}

		$query ="SELECT userID, username, passwd FROM userAcc WHERE username='$username'";
		$queryDB = mysqli_query($conn, $query) or die("Error in MySQL connection");
		$login_ok =false;
		if($queryDB){
			$row=mysqli_fetch_array($queryDB);
			if($password==$row['passwd']){
				$login_ok=true;
			}
		}
		if($login_ok){
			$response["success"]=1;
			$response["message"]="Login Successful!";
			die(json_encode($response));
		}else{
			$response["success"]=0;
			$response["message"]="Username or Password was incorrect";
			die(json_encode($response));
		}
	}else {
?>
		<h1>Login</h1>
		<form action="login.php" method="post">
		    Username:<br />
		    <input type="text" name="username" placeholder="username" />
		    <br /><br />
		    Password:<br />
		    <input type="password" name="password" placeholder="password" value="" />
		    <br /><br />
		    <input type="submit" value="Login" />
		</form>
		<a href="register.php">Register</a>
	<?php
}

?>
