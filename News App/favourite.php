<?php
   
 require_once 'conn.php';
   $title=$_POST['title'];
   $url=$_POST['url'];
   $fvrt_query=("INSERT INTO `favourite`(`id`, `title`, `url`) VALUES (NULL,'".$title."','".$url."')");
if(mysqli_query($conn,$fvrt_query)){

		 // On query success it will print below message.
	    
		$MSG = 'Data Successfully Submitted at ' ;
		 
		// Converting the message into JSON format.
		// Echo the message.
	    echo ($MSG);
	 }
	 else{
	 	echo "not inserted";
	 }


   ?>