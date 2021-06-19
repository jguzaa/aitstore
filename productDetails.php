<?php
session_start();
?>


<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Product Detail</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="JScript/pVScript.js"></script>
        <script src="JScript/showDES.js"></script>

        <link rel="stylesheet" type="text/css" href="css/navbarStyle.css">
        <link rel="stylesheet" type="text/css" href="css/product.css">

        <script>

            function addCart(pId) {

                var qty = $("#qty").val();
                window.location.href = "cart.php?pid="+pId+"&qty="+qty;

            }

            function addWlist(pId) {

                window.location.href = "wishlist.php?pid="+pId;

            }

        </script>

    </head>

    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

        <?php
        include "navbar.php";
        ?>

        <?php

        if (isset($_REQUEST["pid"])){
            $pid = $_REQUEST["pid"];

            echo "

                <script>

                    $(function(){
                        loadPrice($pid);
                        loadDescription($pid);
                        loadImage($pid);
                        loadRelated($pid);
                        loadProductName($pid);
                        loadHighlights($pid);
                        loadBreadCrums($pid);
                        loadRating($pid);

                        $('.descriptionButton').click(function(){
                              loadDescription($pid);              
                        });

                        $('.detailsButton').click(function(){
                              loadDetail($pid);              
                        });

                        $('#cartButton').click(function(){
                            addCart($pid);              
                        });

                        $('#cartWButton').click(function(){
                            addWlist($pid);              
                        });
                        
                        $('#btnRating').click(function(){
                            addRating($pid);
                            loadRating($pid);
                        });


                    });

                </script> 

            ";

        }


        ?>

        <ol class="breadcrumb" id="breadcrumb" style="margin-bottom:0px">

        </ol>


        <div class = "mainContent row">


            <div class="row col-sm-2" id="sideList">

                <div class="list-group" id="list-tab" role="tablist">
                    <?php 
                    include "phpAction/catListAction.php";
                    ?>
                </div>

            </div>


            <div class="row col-sm-10" id="content">

                <div class="row" > 

                    <div class="col-md-7">

                        <div class="carouselContainer">
                            <div id="ProductName">
                            </div>
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">


                                <!-- Wrapper for slides -->
                                <div class="carousel-inner" role="listbox" id="ImageBox">

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
                        </div>

                    </div>
                    <div class="col-md-5">
                        <div class="highlightsContainer">
                            <h2>Product Highlights</h2><br>
                            <ul id="highlights">


                            </ul>

                            <div style="text-align:center">

                                <h3 id="price">Price AUD xx.xx</h3>
                                <h4 id="rating">Rating x.x out of 5 stars</h4><br>
                                <P Style="display: inline;">QTY&nbsp;&nbsp;</P>
                                <select id="qty">  
                                    <option value = "1">1</option>
                                    <option value = "2">2</option>
                                    <option value = "3">3</option>
                                    <option value = "4">4</option>
                                </select>
                                <br><br>
                                <button class="btn" type="submit" id="cartButton">Add to cart</button>

                                <button class="btn" type="submit" id="cartWButton">Save to wish list</button>

                            </div>



                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-8">

                        <button class="descriptionButton"  type="button">
                            Description</button>

                        <button  class="detailsButton" type="button">Details</button>
                        <div class="descriptionBox">

                            <p id="description"> 

                            </p>

                        </div>
                    </div>
                    <div class="col-md-3">
                        <h4>Related Products</h4>
                        <div id="Related">


                        </div>
                    </div>
                </div>

                
                <?php
                    if(isset($_SESSION['cid'])){
                        echo '
                        
                            <div style="text-align:center">

                            <h4>Rating for this products</h4>

                            <select name="rate" id="rate">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select> 
                            <p style="display: inline">&nbsp;&nbsp;out of 5&nbsp;&nbsp;</p>

                            <button class="btn" type="submit" id="btnRating" >submit</button>


                        </div>
                        ';
                    }
                ?>
                
            </div>

            <p id="checkBar"></p>
        </div>

        <?php
        include "footer.html";
        ?>

    </body>
</html>
