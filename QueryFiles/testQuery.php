<?php
        $servername = "localhost";
        $username = "root";
        $password ="@isling1966";
        $dbname ="FypDB";
        $conn = mysqli_connect($servername, $username, $password, $dbname);
	$query = "SELECT * FROM userAcc'"; 
	$result = mysqli_query($conn, $query); 


	while($row = mysqli_fetch_assoc($result)){
		echo "Derp";
		 $encode[] = $row; 
	}
	
	echo json_encode($encode); 


?>

