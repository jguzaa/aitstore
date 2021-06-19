<?php
include "db.php";

// get the q parameter from URL
$pid = $_REQUEST["q"];
$sql = "SELECT * FROM accessorysupport
    INNER JOIN product
    on accessorysupport.productId=product.productId
    INNER JOIN pictures
    ON pictures.productId=accessorysupport.productId
    where supportedPID='.$pid.'
    limit 2";
$results = mysqli_query($connection,$sql);

if(mysqli_num_rows($results)>0){

    while ($row = mysqli_fetch_array($results)){
        $prod_name = $row["pName"];
        $prod_pic1 = $row["link1"];
        $prod_Pri = $row["price"];
        $productid=$row["productId"];
        echo '

                <div class="panel panel-primary">
                        <div class="panel-heading">'.$prod_name.'</div>
                        <div class="panel-body"><a href="productDetails.php?pid='.$productid.'"><img src="'.$prod_pic1.'" class="img-responsive" style="width:100%" alt="Image" ></a></div>
                        <div class="panel-footer">price : '.$prod_Pri.'</div>
                </div>

            ';
    }

} else { //Show only powerbank which supported every products
    $sql = "
    SELECT * FROM product
    INNER JOIN pictures ON product.productId=pictures.productId
    INNER JOIN accessory_product ON product.productId=accessory_product.productId 
    WHERE accId = 1
    ORDER BY RAND() LIMIT 0,2";
    
    $results = mysqli_query($connection,$sql);

    if(mysqli_num_rows($results)>0){

        while ($row = mysqli_fetch_array($results)){
            $prod_name = $row["pName"];
            $prod_pic1 = $row["link1"];
            $prod_Pri = $row["price"];
            $productid=$row["productId"];
            echo '

                    <div class="panel panel-primary">
                            <div class="panel-heading">'.$prod_name.'</div>
                            <div class="panel-body"><a href="productDetails.php?pid='.$productid.'"><img src="'.$prod_pic1.'" class="img-responsive" style="width:100%" alt="Image" ></a></div>
                            <div class="panel-footer">price : '.$prod_Pri.'</div>
                    </div>

                ';
        }

    }
}
mysqli_close($connection);
?>