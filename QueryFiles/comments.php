<?php
  header('Content-type: application/json');
  require("config.inc.php");
  $jsonString = file_get_contents('php://input');
  $jsonObj = json_decode($jsonString, true);
  $threadID = $jsonObj['threadID'];

  $getComments = "SELECT userAcc.username, comments.comment, comments.commentID, comments.score
  FROM comments INNER JOIN userAcc
  ON comments.userID=userAcc.userID WHERE threadID=$threadID ORDER BY SCORE DESC;";

  try{
    $comments = $dbhandle->query($getComments);
  }catch(PDOException $e){
      $e->getMessage();
      die();
  }
  $response ["comments"]= array();
  while($row=$comments->fetch()){
      $encode = array();
      $encode['commentID'] =$row['commentID'];
      $encode['username'] = $row['username'];
      $encode['comment'] =$row['comment'];
      $encode['score'] = $row['score'];

      array_push($response["comments"],$encode);
  }
  echo json_encode($response);





?>
