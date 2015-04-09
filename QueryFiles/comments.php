<?php
  header('Content-type: application/json');
  require("config.inc.php");
  $jsonString = file_get_contents('php://input');
  $jsonObj = json_decode($jsonString, true);

?>
