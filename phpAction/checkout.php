<?php
include "db.php";

session_start();

$cid = $_SESSION["cid"];
     
$query= 'DELETE FROM cart WHERE customerId = '.$cid;

$results = mysqli_query($connection,$query);

if($results){
    echo 'true';
} 

mysqli_close($connection);

?>


     
