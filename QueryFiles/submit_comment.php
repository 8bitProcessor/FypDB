<?php
  header('Content-type: application/json');
  require("config.inc.php");
  $jsonString = file_get_contents('php://input');
  $jsonObj = json_decode($jsonString, true);
  $threadID = $jsonObj['threadID'];
  $username = $jsonObj['username'];
  $password = $jsonObj['password'];
  $comment = $jsonObj['commentText'];


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
      echo json_encode($response);
    }
  }
  if($details_correct){
    $insertComment = "INSERT INTO comments (threadID, userID, score, comment) VALUES ($threadID, $user_id, 1, '$comment');";
    $result = $dbhandle->query($insertComment);
    if($result){
      $response["success"]=1;
      $message["message"]="Your comment was posted";
    }





  }







  ?>
