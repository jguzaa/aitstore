<?php
include "db.php";
session_start();

$pid = $_REQUEST['pid'];

$sql = "SELECT * FROM rating WHERE productId = ".$pid ;

$results = mysqli_query($connection,$sql);

if(mysqli_num_rows($results)>0){

    $totalRated = mysqli_num_rows($results);
    $avgRating = 0;

    while ($Row = mysqli_fetch_array($results)){

        $rating = $Row["rating"];

        $avgRating += $rating;

    }
    
    echo 'Rating '. $avgRating / $totalRated .' out of 5 stars';

}

else {
    echo "This product hasn't rate yet";
}

mysqli_close($connection);

?>






