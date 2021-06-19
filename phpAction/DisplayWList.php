<?php
include "db.php";
session_start();


$cid = $_SESSION['cid'];


$wlist_sql = "SELECT * FROM product INNER JOIN wishlist ON wishlist.productId = product.productId INNER JOIN pictures ON product.productId = pictures.productId WHERE wishlist.customerId = ".$cid ;

$results = mysqli_query($connection,$wlist_sql);

if(mysqli_num_rows($results)>0){


    echo '

            <thead>
                <tr>
                    <th scope="col"></th>
                    <th scope="col">Product</th>
                    <th></th>
                    <th scope="col" class="text-right">Price</th>
                    <th></th>
                </tr>
            </thead>

            <tbody>

            ';

    while ($wlistRow = mysqli_fetch_array($results)){

        $pid = $wlistRow["productId"];
        $prod_name = $wlistRow["pName"];
        $prod_price = $wlistRow["price"];
        $prod_pic = $wlistRow["link1"];

        echo '


                <tr>
                    <td><img src="'.$prod_pic.'" class="img-responsive" style="width:50px" alt="Image"></td>
                    <td>'.$prod_name.'</td>
                    <td></td>
                    <td class="text-right">'.$prod_price.' $</td>
                    <td class="text-right">
                        <button class="btn btn-sm btn-success" onclick="addToCart('.$pid.')"><i class="glyphicon glyphicon-shopping-cart"></i>  </button> 
                        <button class="btn btn-sm btn-danger" onclick="delFromWList('.$pid.')"><i class="glyphicon glyphicon-remove"></i>  </button> 
                    </td>
                </tr>

                </tbody>

                ';
    }

    
}

mysqli_close($connection);

?>






