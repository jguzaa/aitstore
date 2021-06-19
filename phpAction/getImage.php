<?php
include "db.php";

// get the q parameter from URL
$pid = $_REQUEST["q"];


$sql = "SELECT * FROM product INNER JOIN pictures ON product.productId=pictures.productId WHERE product.productId = ".$pid;
$results = mysqli_query($connection,$sql);

if(mysqli_num_rows($results)>0){

    while ($row = mysqli_fetch_array($results)){

        $pictures = array();
        
        
        $x = 1;
        while ($x < 9 && $row["link".$x] != ''){
            array_push($pictures, $row["link".$x]);
            $x++;
            
        }


        $arrlength = count($pictures);

        for($j = 0; $j < $arrlength; $j++) {
            
            if($j == 0){
                echo '
                <div class="item active">
                    <div class="ImageContainer"><img src="'.$pictures[$j].'" 
                    id="zoomImage"
                    alt="Pic'.$j.'" ></div>
                </div>
                
            ';
            } else {
                echo '
                <div class="item">
                    <div class="ImageContainer"><img src="'.$pictures[$j].'" alt="Pic'.$j.'" id="zoomImage" ></div>
                </div>
                
            ';
            }
            
            
            
        }

    }
}
mysqli_close($connection);
?>