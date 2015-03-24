<?php
    require("config.inc.php");
      if(!empty($_POST)){
      $username =$_POST['username'];
      $password =$_POST['password'];
        if(empty($_POST['username']) || empty($_POST['password'])){
          $response["success"]=0;
          $response["message"]="Please enter your username and password";
          die(json_encode($response));
        }
        $query = "SELECT username FROM userAcc WHERE username='$username'";
        try{
            $result =$dbhandle->query($query);
        }catch(PDOException $e){
          $e->getMessage();
          die();
        }
      if($result->rowCount()>0){
          $response["success"] =0;
          $response["message"]="This username is taken";
          die(json_encode($response));
      }
      $queryTwo ="INSERT into userAcc (username, passwd) VALUES ('$username', '$password')";
      try{
          $insertResult =$dbhandle->query($queryTwo);
      }catch(PDOException $e){
          $e->getMessage();
          die();
      }
      // $insertQuery =mysqli_query($conn, $queryTwo) or die("error in connection");
      if($insertResult){
      $response["success"]=1;
      $response["message"]="Username successfull added";
      echo json_encode($response);
    }
  }
?>
