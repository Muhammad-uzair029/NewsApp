<?php
   
 require_once 'conn.php';


$noti_query=$conn->query("SELECT * FROM favourite") ;
$noti_data=array();	

while($row=$noti_query->fetch_assoc())
{
	$noti_data[]=$row;
}


echo json_encode($noti_data);






?>