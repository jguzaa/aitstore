<?php
session_start();
?>


<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Homepage</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Mobile E-Commerce website for AIT Project.">
        <meta name="keywords" content="Academy of information and technologies, E-Commerce, Buy mobile phone, Mobile phone, phone">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/navbarStyle.css">
        <link rel="stylesheet" type="text/css" href="css/mainStyle.css">

    </head>

    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

        <?php
        include "navbar.php";
        ?>

        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="Pictures/promotion1.jpg" alt="New York">
                    <div class="carousel-caption">
                        <h3>Promotion1</h3>
                    </div>
                </div>

                <div class="item" >
                    <img src="Pictures/promotion1.jpg" alt="Chicago">
                    <div class="carousel-caption">
                        <h3>Promotion2</h3>
                    </div>
                </div>

                <div class="item">
                    <img src="Pictures/promotion1.jpg" alt="Los Angeles">
                    <div class="carousel-caption">
                        <h3>Promotion3</h3>
                    </div>
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>



        <div class = "mainContent row">



            <div class="row" id="content">
                <div class="container">

                    <div class="row">
                        <?php 
                        include "phpAction/mainPVAction.php";
                        ?>
                    </div>

                </div>

            </div>
        </div>


        <?php
        include "footer.html";
        ?>


    </body>
</html>
