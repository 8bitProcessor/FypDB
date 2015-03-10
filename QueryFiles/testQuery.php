<?php
        require("conn.php");
        $username =$_POST['username'];
        $passwd =$_POST['username'];

        $query = "INSERT INTO userAcc(username, passwd) VALUES ($username, $passwd)";
        $result = mysqli_query($conn, $query);
        $response["success"]=1;
        $response["message"]="User created ";
        echo(json_encode($response));

 ?>

