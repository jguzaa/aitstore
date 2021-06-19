<?php
include "db.php";
session_start();

// get the id parameter from URL
$cid = $_SESSION['cid'];
$pid = $_REQUEST['pid'];
$qty = $_REQUEST['qty'];


$update_sql = 'UPDATE cart SET QTY = '.$qty.' WHERE customerId = '.$cid.' AND productId = '.$pid;

$results = mysqli_query($connection,$update_sql);

if(mysqli_num_rows($results) > 0){
    echo 'success';
}




mysqli_close($connection);

?>