<?php
try{
  $dbhandle = new PDO('mysql:host=127.0.0.1;dbname=FypDB','root','@isling1966');
  $dbhandle->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}catch(PDOException $e){
    echo $e->getMessage();
    die();
}
?>
