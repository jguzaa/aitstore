<?php
include "db.php";

// get the id parameter from URL
$catId = $_REQUEST["id"];

if ($catId != 0){

    $cat_sql = "SELECT * FROM product 
                INNER JOIN category ON product.catagoryId=category.categoryId
                WHERE catagoryId = $catId
                LIMIT 1";


    $results = mysqli_query($connection,$cat_sql);

    if(mysqli_num_rows($results)>0){

        while ($row = mysqli_fetch_array($results)){
            $cat_name = $row["cName"];

            echo '

            <li><a href="index.php">Home</a></li>
            <li><a href="productsView.php">Products</a></li>
            <li class="active">'.$cat_name.'</li>   

        ';
        }

    }
} else {
    
    echo '

            <li><a href="index.php">Home</a></li>
            <li class="active">Products</li>

        ';
}

mysqli_close($connection);
?>