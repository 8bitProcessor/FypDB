<?php
        $servername = "localhost";
        $username = "root";
        $password ='Pa$$w0rd';
        $dbname ="FypDB";
        $conn = mysqli_connect($servername, $username, $password, $dbname);
	$query = "SELECT * FROM userAcc WHERE username='8bit'"; 
	$result = mysqli_query($conn, $query); 


	while($row = mysqli_fetch_assoc($result)){
		echo "Derp";
		 $encode[] = $row; 
	}
	
	echo json_encode($encode); 


?>

