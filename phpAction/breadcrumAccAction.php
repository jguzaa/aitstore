<?php
include "db.php";

// get the id parameter from URL
$accId = $_REQUEST["id"];


$acc_sql = "SELECT * FROM accessory 
            WHERE accId = $accId
            LIMIT 1";


$results = mysqli_query($connection,$acc_sql);

if(mysqli_num_rows($results)>0){

    while ($row = mysqli_fetch_array($results)){
        $acc_name = $row["accType"];

        echo '

            <li><a href="index.php">Home</a></li>
            <li><a href="productsView.php">Products</a></li>
            <li><a href="productsView.php?id=8">Accessories</a></li>
            <li class="active">'.$acc_name.'</li>   

        ';
    }

}

mysqli_close($connection);


?>