<?php
include "db.php";

session_start();

// get the id parameter from URL
$pid = $_REQUEST["pid"];
$cid = $_SESSION["cid"];
     
$query= 'DELETE FROM cart WHERE productId = '.$pid.' AND customerId = '.$cid;

$results = mysqli_query($connection,$query);

if($results){
    echo 'true';
} 

mysqli_close($connection);

?>


     
