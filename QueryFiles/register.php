<?php
header('Content-type: application/json');
require("config.inc.php");
  $jsonString = file_get_contents('php://input');
  $jsonObj = json_decode($jsonString, true);
  $username = $jsonObj['username'];
  $password = $jsonObj['password'];

  if ($username=="" || $password=="") {
    $response["success"] =0;
    $response["message"]="Please enter both your username and password";
    echo json_encode($response);
    die();
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
          $response["message"]="This username is taken!";
          die(json_encode($response));
      }
      $queryTwo ="INSERT into userAcc (username, passwd) VALUES ('$username', '$password')";
      try{
          $insertResult =$dbhandle->query($queryTwo);
      }catch(PDOException $e){
          $e->getMessage();
          die();
      }
      if($insertResult){
      $response["success"]=1;
      $response["message"]="Your account has been created!";
      echo json_encode($response);
    }

?>
