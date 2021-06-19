<?php
include "db.php";

// get the q parameter from URL
$pId = $_REQUEST["q"];


$cat_sql = "SELECT * FROM product WHERE productId = ".$pId;
$results = mysqli_query($connection,$cat_sql);

if(mysqli_num_rows($results)>0){

    while ($row = mysqli_fetch_array($results)){
        $prod_Name = $row["pName"];
    

        echo '<h2>'.$prod_Name.'</h2><br>';
    }
}
mysqli_close($connection);
?>