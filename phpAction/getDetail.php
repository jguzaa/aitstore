<?php
include "db.php";
session_start();
// get the q parameter from URL
$catId = $_REQUEST["q"];


$cat_sql = "SELECT * FROM product INNER JOIN productdetail ON product.productId = productdetail.productId WHERE product.productId =".$catId;
$results = mysqli_query($connection,$cat_sql);

if(mysqli_num_rows($results)>0){

    while ($row = mysqli_fetch_array($results)){
        
        $detail = array();

        $x = 1;
        while ($x < 10 && $row["detail".$x] != ''){
            array_push($detail, $row["detail".$x]);
            $x++;
        }


        $arrlength = count($detail);
        
        for($x = 0; $x < $arrlength; $x++) {
            echo $detail[$x];
            echo "<br><br>";
        }
    }
}
mysqli_close($connection);
?>