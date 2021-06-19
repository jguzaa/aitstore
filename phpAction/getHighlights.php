<?php
include "db.php";
session_start();
// get the q parameter from URL
$catId = $_REQUEST["q"];


$cat_sql = "SELECT * FROM product INNER JOIN productdetail ON product.productId = productdetail.productId WHERE product.productId =".$catId;
$results = mysqli_query($connection,$cat_sql);

if(mysqli_num_rows($results)>0){

    while ($row = mysqli_fetch_array($results)){
        
        $highlight = array();

        $x = 1;
        while ($x < 6 && $row["hl".$x] != ''){
            array_push($highlight, $row["hl".$x]);
            $x++;
        }


        $arrlength = count($highlight);
        
        for($x = 0; $x < $arrlength; $x++) {
            echo "
            
            <li>$highlight[$x]</li>
            
            ";
            
        }
    }
}
mysqli_close($connection);
?>