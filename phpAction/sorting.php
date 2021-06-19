<?php
include "db.php";

session_start();

if (isset($_SESSION["sqlLine"])){

    //check sql command prevent double order query
    $pos = strpos($_SESSION["sqlLine"], 'ORDER');

    if($pos === false){

        $sortBy = $_REQUEST["key"];
        if($sortBy == 'name'){


            $sort_sql = $_SESSION["sqlLine"] . ' ORDER BY pName';


            //save for ordering
            $_SESSION['sqlSort'] = $sort_sql;

            $results = mysqli_query($connection,$sort_sql);

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
        }
        
        if($sortBy == 'price'){


            $sort_sql = $_SESSION["sqlLine"] . ' ORDER BY price';


            //save for ordering
            $_SESSION['sqlSort'] = $sort_sql;

            $results = mysqli_query($connection,$sort_sql);

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
        }

    }


}
mysqli_close($connection);
?>