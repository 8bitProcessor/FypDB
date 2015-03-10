<?php 
	require('conn.php');
        $query = "SELECT  name, description FROM  category"; 
        $result = mysqli_query($conn, $query);
      

        while($row=mysqli_fetch_assoc($result)){
            $encode[]= $row; 
        }

      echo json_encode($encode);



?> 
