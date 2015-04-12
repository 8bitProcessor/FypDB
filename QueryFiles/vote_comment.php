<?php
  header('Content-type: application/json');
  require("config.inc.php");
  $jsonString = file_get_contents('php://input');
	$jsonObj = json_decode($jsonString, true);
  $username = $jsonObj['username'];
  $password = $jsonObj['password'];
  $commentID = $jsonObj['commentID'];
  $voteType = $jsonObj['vote_type'];

  $check_details ="SELECT userID, username, passwd FROM userAcc WHERE username='$username'";
	try{
			$queryDetails = $dbhandle->query($check_details);
	}catch(PDOException $e){
		echo $e->getMessage();
		die();
	}
	$details_correct = false;
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
      die();
		}
	}
  if($details_correct){
      $checkIfScored = "SELECT * FROM commentVote WHERE userID=$user_id AND commentID=$commentID";
      try{
        $score_result = $dbhandle->query($checkIfScored);
      }catch(PDOException $e){
        echo $e->getMessage();
      }
  if($score_result->rowCount()>0)    {
      $response['success']=0;
      $response['message']="You have score that comment already";
      echo json_encode($response);
      die();
  }
  else if($voteType==1){
    $upvoteComment ="UPDATE comments SET score=score+1 WHERE commentID=$commentID;";
    $insertVote ="INSERT INTO commentVote (commentID, userID, scored) VALUES ($commentID,$user_id,$voteType);";
    try{
    $dbhandle->query($insertVote);
    }catch(PDOException $e){
      echo $e->getMessage();
    }
    try{
      $dbhandle->query($upvoteComment);
    }catch(PDOException $e){
      $e->getMessage();
    }
    $response['success']=1;
    $response['message']="You have upvoted this comment!";
    echo json_encode($response);
    die();
    }
    else if($voteType==0){
      $downvoteComment= "UPDATE comments SET score=score-1 WHERE commentID=$commentID;";
      $insertVote = "INSERT into commentVote (commentID, userID, scored) VALUES ($commentID,$user_id, $voteType);";
      try{
        $dbhandle->query($downvoteComment);
      }catch(PDOException $e){
        echo $e->getMessage();
      }
      try{
        $dbhandle->query($insertVote);
      }catch(PDOException $e){
        echo $e->getMessage();
      }
      $response['success']=1;
      $response['message']="You have downvoted this comment!";
      echo json_encode($response);
      die();
    }
  }
?>
