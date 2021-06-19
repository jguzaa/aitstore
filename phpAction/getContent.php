<?php
include "db.php";
session_start();
// get the q parameter from URL
$catId = $_REQUEST["q"];


$cat_sql = "SELECT * FROM product WHERE productId = ".$catId;
$results = mysqli_query($connection,$cat_sql);

if(mysqli_num_rows($results)>0){

    while ($row = mysqli_fetch_array($results)){
        $prod_Des = $row["ProductDescription"];
        $_SESSION['Description'] = $prod_Des;

        echo $prod_Des;
    }
}
mysqli_close($connection);
?>