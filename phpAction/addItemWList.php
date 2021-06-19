<?php
include "db.php";
session_start();

// get the id parameter from URL
$cid = $_SESSION['cid'];
$pid = $_REQUEST['pid'];


//check data from cart prevent duplicated adding
$wishlist_sql = "SELECT * FROM wishlist WHERE customerId = ".$cid." AND productId = ".$pid;

$results = mysqli_query($connection,$wishlist_sql);

//if data is exit, alert user
if(mysqli_num_rows($results) > 0){
    
    echo 'duplicate';
    
}
//else add new row in db
else
{
    $add_sql = 'INSERT INTO wishlist (customerId, productId) VALUES ('.$cid.', '.$pid.')';
    
    $results = mysqli_query($connection,$add_sql);
    
    if(mysqli_num_rows($results) > 0){
        echo 'success';
    }
}


mysqli_close($connection);

?>