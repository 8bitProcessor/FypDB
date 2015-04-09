<?php
  header('Content-type: application/json');
  require("config.inc.php");
  $jsonString = file_get_contents('php://input');
	$jsonObj = json_decode($jsonString, true);
  $username = $jsonObj['username'];
	$password = $jsonObj['password'];
  $threadID = $jsonObj['threadID'];
  $voteType = $jsonObj['voteType'];
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
      //Check if they have upvoted or downvoted the thread before
      $checkifScored = "SELECT * FROM voted WHERE userID=$user_id AND threadID=$threadID;";
      try{
        $checkScore = $dbhandle->query($checkifScored);
      }catch(PDOException $e){
        echo $e->getMessage();
      }
      if($checkScore->rowCount()>0){
        $response['success']=0;
        $response['message']="You have already scored that thread";
        echo json_encode($response);
        die();
      }
      else if($voteType==1){
          $upvoteThread = "UPDATE threadsAll SET score=score+1 WHERE threadID=$threadID";
          try{
            $dbhandle->query($upvoteThread);
          }catch(PDOException $e){
            echo $e->getMessage();
          }
          $insertUserID = "INSERT into voted (threadID, userID, scored) VALUES ($threadID, $user_id, $voteType);";
          try{
            $dbhandle->query($insertUserID);
          }catch(PDOException $e){
            echo $e->getMessage();
          }
          $response['success']=1;
          $response['message']="You have upvoted this thread";
          echo json_encode($response);
          die();
      }
      else if($voteType==0){
        $downVoteThread = "UPDATE threadsAll SET score=score-1 WHERE threadID=$threadID";
        try{
          $dbhandle->query($downVoteThread);
        }catch(PDOException $e){
          echo $e->getMessage();
        }
        $insertUserID = "INSERT into voted (threadID, userID, scored) VALUES ($threadID, $user_id, $voteType);";
        try{
          $dbhandle->query($insertUserID);
        }catch(PDOException $e){
          echo $e->getMessage();
        }
        $response['success']=1;
        $response['message']="You have downvoted this thread";
        echo json_encode($response);
        die();
      }


  }
?>
