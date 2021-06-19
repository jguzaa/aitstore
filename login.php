<?php
session_start();
?>


<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/logInStyle.css">
        <link rel="stylesheet" type="text/css" href="css/navbarStyle.css">

        <script src="JScript/loginScript.js"></script>

    </head>

    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

        <?php
        include "navbar.php";
        ?>
        
        <ol class="breadcrumb">
            <li><a href="index.php">Home</a></li>
            <li class="active">Log in</li>     
        </ol>


        <div class="container">
            <form class="well form-horizontal" method="post"  id="loginForm" data-toggle="validator"  role="form">
                <fieldset>

                    <!-- Form Name -->
                    <legend><center><h2><b>Log in</b></h2></center></legend><br>

                    <!-- Text input-->

                    <div class="form-group">
                        <label class="col-md-4 control-label">Email</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <input  name="email" placeholder="Email" class="form-control"  type="email" required>
                            </div>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>

                    <!-- Text input-->

                    <div class="form-group">
                        <label class="col-md-4 control-label" >Password</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input type="password" data-minlength="6" class="form-control" id="inputPassword" placeholder="Password" name="password" required>
                            </div>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>



                    <!-- Button -->
                    <div class="btnDiv">


                        <button type="submit" class="btn btn-send">Login   &nbsp&nbsp<span class="glyphicon glyphicon-send"></span></button>

                    </div>

                    <div id="result"></div>

                </fieldset>
            </form>
        </div>


        <?php
        include "footer.html";
        ?>

    </body>
</html>
