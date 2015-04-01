<?php
header('Content-type: application/json');
    // $data["username"] = $_POST["username"];
    // $data["password"] = $_POST["password"];
    // file_put_contents("test.txt", serialize($data));


    $values["success"]= 1;
    $values["message"]= "Message";
    echo json_encode($values);
    // array_push($response["Response"], $values);
    // echo json_encode($response);
 ?>
