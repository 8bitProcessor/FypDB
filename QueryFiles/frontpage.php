<?php
	require('conn.php');
	$query  ="SELECT name, description FROM category"; 	
	$result =mysqli_query($conn, $query); 

	while($row =mysqli_fetch_assoc($result)){ 
		$output[] =$row; 
	}
	print(json_encode($output)); 




?>
