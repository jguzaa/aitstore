<?php
$servername ="localhost";
$username ="root";
$password ="";
$database ="eStore";   

$connection =mysqli_connect($servername,$username,$password,$database);
if(!$connection){
    die("connection error : ".mysqli_connect_error());
}
?>