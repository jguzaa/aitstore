<?php
include "db.php";
session_start();

// get the id parameter from URL
$cid = $_SESSION['cid'];
$pid = $_REQUEST['pid'];
$qty = $_REQUEST['qty'];


//check data from cart prevent duplicated adding
$cart_sql = "SELECT * FROM cart WHERE customerId = ".$cid." AND productId = ".$pid;

$results = mysqli_query($connection,$cart_sql);

//if data is exit, update qty
if(mysqli_num_rows($results) > 0){
    
    $row = mysqli_fetch_array($results);
    $qtyAdd = $row["QTY"];
    $qty += $qtyAdd;
    
    $update_sql = 'UPDATE cart SET QTY = '.$qty.' WHERE customerId = '.$cid.' AND productId = '.$pid;
    
    $results = mysqli_query($connection,$update_sql);
    
    if(mysqli_num_rows($results) > 0){
        echo 'success';
    }
}
//else add new row in db
else
{
    $add_sql = 'INSERT INTO cart (customerId, productId, QTY) VALUES ('.$cid.', '.$pid.', '.$qty.')';
    
    $results = mysqli_query($connection,$add_sql);
    
    if(mysqli_num_rows($results) > 0){
        echo 'success';
    }
}


mysqli_close($connection);

?>