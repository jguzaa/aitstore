<?php
include "db.php";

// get the id parameter from URL
$pId = $_REQUEST["id"];

$sql = "SELECT * FROM product 
        INNER JOIN category ON product.catagoryId=category.categoryId
        WHERE product.productId = ".$pId;

$results = mysqli_query($connection,$sql);

if(mysqli_num_rows($results)>0){

    $row = mysqli_fetch_array($results);

    $catId = $row["categoryId"];
    $catName = $row["cName"];
    $pName = $row["pName"];


    if ($row["catagoryId"] != 8) { //not in accessories catagory

        echo '

            <li><a href="index.php">Home</a></li>
            <li><a href="productsView.php">Products</a></li>
            <li><a href="productsView.php?id='.$catId.'">'.$catName.'</a></li>
            <li class="active">'.$pName.'</li>   

        ';

    } else { //load sub catagory

        $sql = "SELECT * FROM product 
                INNER JOIN category ON product.catagoryId=category.categoryId
                INNER JOIN accessory_product ON product.productId=accessory_product.productId
                INNER JOIN accessory ON accessory.accId=accessory_product.accId
                WHERE product.productId = ".$pId;

        $results = mysqli_query($connection,$sql);
        if(mysqli_num_rows($results)>0){
            $row = mysqli_fetch_array($results);

            $catId = $row["categoryId"];
            $catName = $row["cName"];
            $pName = $row["pName"];
            $accType = $row["accType"];
            $accId = $row["accId"];
            
            echo '

                <li><a href="index.php">Home</a></li>
                <li><a href="productsView.php">Products</a></li>
                <li><a href="productsView.php?id='.$catId.'">'.$catName.'</a></li>
                <li><a href="productsView.php?aid='.$accId.'">'.$accType.'</a></li>
                <li class="active">'.$pName.'</li>   

            ';
        }
    }


}

mysqli_close($connection);
?>