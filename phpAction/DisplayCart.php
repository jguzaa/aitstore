<?php
include "db.php";
session_start();


$cid = $_SESSION['cid'];


$cart_sql = "SELECT * FROM product INNER JOIN cart ON cart.productId = product.productId INNER JOIN pictures ON product.productId = pictures.productId WHERE cart.customerId = ".$cid ;

$results = mysqli_query($connection,$cart_sql);

if(mysqli_num_rows($results)>0){

    $totalPrice = 0.0;

    echo '

            <thead>
                <tr>
                    <th scope="col"> </th>
                    <th scope="col">Product</th>
                    <th scope="col" class="text-center">Quantity</th>
                    <th scope="col" class="text-right">Price</th>
                    <th> </th>
                </tr>
            </thead>

            <tbody>

            ';

    while ($CartRow = mysqli_fetch_array($results)){

        $pid = $CartRow["productId"];
        $prod_name = $CartRow["pName"];
        $prod_price = $CartRow["price"];
        $prod_pic = $CartRow["link1"];
        $prod_qty = $CartRow["QTY"];

        $totalPrice += ($prod_price * $prod_qty);

        echo '


                <tr>
                    <td><img src="'.$prod_pic.'" class="img-responsive" style="width:50px" alt="Image"></td>
                    <td>'.$prod_name.'</td>
                    <td><input class="form-control text-center" id="qtyOf'.$pid.'" type="text" value="'.$prod_qty.'" /></td>
                    <td class="text-right">'.$prod_price * $prod_qty.' $</td>
                    <td class="text-right">
                        <button class="btn btn-sm btn-success" onclick="calPrice('.$pid.')"><i class="glyphicon glyphicon-refresh"></i>  </button> 
                        <button class="btn btn-sm btn-danger" onclick="delFromCart('.$pid.')"><i class="glyphicon glyphicon-remove"></i>  </button> 
                    </td>
                </tr>

                </tbody>

                ';
    }

    echo '


    <tr>

        <td></td>
        <td></td>
        <td><h2>Total Price : '.$totalPrice.' $</h2></td>
        <td></td>

        <td><button class="btn btn-lg btn-block btn-success text-uppercase" style="width: auto; margin : 30px auto" onclick="checkout()">Checkout</button></td>


    </tr>


    ';
}

mysqli_close($connection);

?>






