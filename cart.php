<?php
session_start();
?>


<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Shopping Cart</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Mobile E-Commerce website for AIT Project.">
        <meta name="keywords" content="Academy of information and technologies, E-Commerce, Buy mobile phone, Mobile phone, phone">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <script> 
            

            function loadcart(){

                var xhttp;
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("tableData").innerHTML = this.responseText;
                    }
                };
                xhttp.open("GET", "phpAction/DisplayCart.php", true);
                xhttp.send();   
            }

            function delFromCart(pid){

                $.get( "phpAction/DeleteItem.php?pid="+pid, {} )
                    .done(function( data ) {
                    if(data){
                        loadcart();
                    }
                });

            }
            
            function addCart(pid, qty){

                $.get( "phpAction/AddToCart.php?pid="+pid+"&qty="+qty, {} )
                    .done(function( data ) {
                    if(data){
                        loadcart();
                    }
                });

            }
            
            function calPrice(pid){
                var qty = $("#qtyOf"+pid).val();
                
                $.get( "phpAction/updateCart.php?pid="+pid+"&qty="+qty, {} )
                    .done(function( data ) {
                    if(data){
                        loadcart();
                    }
                });
            }
            
            function checkout(){
                
                $.get( "phpAction/checkout.php", {} )
                    .done(function( data ) {
                    if(data){
                        alert("Thank you for purchase");
                        window.location.href = "index.php";
                    }
                });
            }

        </script> 

        <link rel="stylesheet" type="text/css" href="css/navbarStyle.css">
        <link rel="stylesheet" type="text/css" href="css/mainStyle.css">

    </head>

    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

        <?php
        include "navbar.php";
        ?>


        <ol class="breadcrumb">
            <li><a href="index.php">Home</a></li>
            <li class="active">Cart</li>     
        </ol>

        <!========================== cart table =======================

        <div class="container">
            <div class="row">
                <div class="table-responsive" style="max-width: 1000px; margin: auto">
                    <table class="table table-striped" id="tableData">

                        <?php

                        if(isset($_SESSION['cid'])){


                            if(isset($_REQUEST['pid'])){
                                $pid = $_REQUEST['pid'];
                                $qty = $_REQUEST['qty'];
                                
                                echo '
                                <script>addCart('.$pid.','.$qty.');</script>
                                ';
                                
                            }

                            echo '
                                <script>loadcart();</script>
                                ';

                        } else {
                            echo '<h1>Please log in to add the product to cart</h1>';
                        }

                        ?>

                    </table>
                </div>

            </div>

        </div>


        <?php
        include "footer.html";
        ?>


    </body>
</html>
