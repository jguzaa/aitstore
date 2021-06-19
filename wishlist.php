<?php
session_start();
?>


<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Whish List</title>
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
            
            function loadWishList(){

                var xhttp;
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("tableData").innerHTML = this.responseText;
                    }
                };
                xhttp.open("GET", "phpAction/DisplayWList.php", true);
                xhttp.send();   
            }
            
            function addToWList(pid){

                $.get( "phpAction/addItemWList.php?pid="+pid, {} )
                    .done(function( data ) {
                    
                    var res = data;
                    
                    if(res == 'duplicate'){
                       alert('The product has been added already!');
                    }
                    
                    loadWishList();
                });

            }

            function delFromWList(pid){

                $.get( "phpAction/DeleteItemWList.php?pid="+pid, {} )
                    .done(function( data ) {
                    if(data){
                        loadWishList();
                    }
                });

            }
            
            function addToCart(pid){
                
                delFromWList(pid);
                window.location.href = "cart.php?pid="+pid+"&qty=1";

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
            <li class="active">Wish List</li>     
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
                                
                                echo '
                                <script>addToWList('.$pid.');</script>
                                ';
                                
                            }

                            echo '
                                <script>loadWishList();</script>
                                ';

                        } else {
                            echo '<h1>Please log in to see item in your wish list</h1>';
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
