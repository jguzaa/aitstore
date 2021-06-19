<?php
include "db.php";

session_start();

// get the id parameter from URL
$catId = $_REQUEST["id"];


if ($catId != 0){
    $cat_sql = "SELECT * FROM product INNER JOIN pictures ON product.productId=pictures.productId WHERE catagoryId = ".$catId;
} else {
    $cat_sql = "SELECT * FROM product INNER JOIN pictures ON product.productId=pictures.productId ORDER BY RAND() LIMIT 0,9";
}

//save for sorting
$_SESSION['sqlLine'] = $cat_sql;


$results = mysqli_query($connection,$cat_sql);

if(mysqli_num_rows($results)>0){

    while ($row = mysqli_fetch_array($results)){
        $pid = $row["productId"];
        $prod_name = $row["pName"];
        $prod_price = $row["price"];
        $prod_pic = $row["link1"];

        echo '

            <div class="col-sm-4">

                <div class="panel panel-primary">
                        <div class="panel-heading">'.$prod_name.'</div>
                        <div class="panel-body"><a href="productDetails.php?pid='.$pid.'"><img src="'.$prod_pic.'" class="img-responsive" style="width:100%" alt="Image" ></a></div>
                        <div class="panel-footer">price : '.$prod_price.'</div>
                </div>

            </div>

        ';
    }
}
mysqli_close($connection);
?>