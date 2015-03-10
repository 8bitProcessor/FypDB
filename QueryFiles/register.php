<?php
    require("config.inc.php");
      if(!empty($_POST)){
      $username =$_POST['username'];
      $password =$_POST['password'];
        if(empty($_POST['username']) || empty($_POST['password'])){
          $response["success"]=0;
          $response["message"]="We need both username and password";
          die(json_encode($response));
        }
        $query = "SELECT * FROM userAcc WHERE username='$username'";
        $checkingForUser = mysqli_query($conn, $query) or die("Error in sql");
      if(mysqli_num_rows($checkingForUser)>0){
          $response["success"] =0;
          $response["message"]="This username is taken";
          die(json_encode($response));
        }

      $queryTwo ="INSERT into userAcc (username, passwd) VALUES ('$username', '$password')";
      $insertQuery =mysqli_query($conn, $queryTwo) or die("error in connection");
      if($insertQuery){
      $response["success"]=1;
      $response["message"]="Username successfull added";
      echo json_encode($response);
    }
  }
?>
  
