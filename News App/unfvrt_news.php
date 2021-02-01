<?php
   
 require_once 'conn.php';
     $title=$_POST['title'];
   $url=$_POST['url'];
$query=("DELETE FROM `favourite` WHERE `url` ='".$url."'");

	if (mysqli_query($conn, $query)) {
      print("Record deleted successfully");
   } else {
      echo "Error deleting record: " . mysqli_error($conn);
   }


   ?>