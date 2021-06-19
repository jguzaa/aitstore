<?php
include "db.php";

$cat_sql = "SELECT * FROM category";
$results = mysqli_query($connection,$cat_sql);

if(mysqli_num_rows($results)>0){

    echo '<a class="list-group-item list-group-item-action active" href="#!" role="tab" aria-controls="Catagories">Catagories</a>';

    while ($row = mysqli_fetch_array($results)){
        $cat_id = $row["categoryId"];
        $cat_name = $row["cName"];

        if ($cat_name != 'Accessory'){
            echo '<a class="list-group-item list-group-item-action"  href="#!" role="tab" aria-controls='.$cat_name.'  onclick="loadCat('.$cat_id.'); loadBreadCrumCat('.$cat_id.')">'.$cat_name.'</a>';
        } else {
            echo '
                <a href="#SubMenu" class="list-group-item" data-toggle="collapse" data-parent="#SubMenu" onclick="loadCat('.$cat_id.'); loadBreadCrumCat('.$cat_id.')"> '.$cat_name.' </a>

                <div class="collapse list-group-submenu" id="SubMenu">';

            //load accessory list
            $acc_sql = "SELECT * FROM accessory";
            $accResults = mysqli_query($connection,$acc_sql);

            if(mysqli_num_rows($accResults)>0){
                while ($AccRow = mysqli_fetch_array($accResults)){
                    $acc_id = $AccRow["accId"];
                    $acc_type = $AccRow["accType"];
                    
                    echo '
                        <a href="#!" class="list-group-item list-group-item-action" data-parent="#SubMenu" role="tab" aria-controls='.$acc_type.'  onclick="loadAcc('.$acc_id.'); loadBreadCrumAcc('.$acc_id.')">'.$acc_type.'</a>
                    ';
                }
            }
            
            echo '</div>';

        }




    }
}
mysqli_close($connection);
?>