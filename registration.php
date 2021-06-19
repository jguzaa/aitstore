<?php
session_start();
?>


<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Registration Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>

        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">

        <link rel="stylesheet" type="text/css" href="css/logInStyle.css">
        <link rel="stylesheet" type="text/css" href="css/navbarStyle.css">

        <script src="JScript/regisScript.js"></script>


    </head>

    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">


        <?php
        include "navbar.php";
        ?>

        <ol class="breadcrumb">
            <li><a href="index.php">Home</a></li>
            <li class="active">Registration</li>     
        </ol>


        <div class="container">
            <form class="well form-horizontal" id="registrationForm" method="post" role="form">

                <fieldset>

                    <!-- Form Name -->
                    <legend><center><h2><b>Registration Form</b></h2></center></legend><br>

                    <!-- Text input-->

                    <div class="form-group">
                        <label class="col-md-4 control-label">First Name</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input id="first_name" name="first_name" placeholder="First Name" class="form-control" type="text" required>
                            </div>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>

                    <!-- Text input-->

                    <div class="form-group">
                        <label class="col-md-4 control-label" >Last Name</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input id="last_name" name="last_name" placeholder="Last Name" class="form-control"  type="text" required>
                            </div>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group"> 
                        <label class="col-md-4 control-label">Date of Birth</label>
                        <div class="col-md-4 selectContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                <input id="dob" name="dob" placeholder="Date of Birth" class="form-control"  type="date" required>
                            </div>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group"> 
                        <label class="col-md-4 control-label">Address</label>
                        <div class="col-md-4 selectContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                <input id="address" name="address" placeholder="Address" class="form-control"  type="text" required>
                            </div>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>

                    <!-- Text input-->

                    <div class="form-group">
                        <label class="col-md-4 control-label">Username</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input id="user_name" name="user_name" placeholder="Username" class="form-control" type="text" required>
                            </div>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>

                    <!-- Text input-->

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="inputPassword"  >Password</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input type="password" data-minlength="6" data-minlength-error="Password should has at least 6 chars" class="form-control" id="inputPassword" placeholder="Password" name="password" required>

                            </div>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <!-- Text input-->

                    <div class="form-group">
                        <label class="col-md-4 control-label" >Confirm Password</label> 
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input type="password" class="form-control" id="inputPasswordConfirm" data-match="#inputPassword" data-match-error="The confirm password isn't matched" placeholder="Confirm Password" required>

                            </div>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">E-Mail</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <input id="email" name="email" class="form-control" type="email" data-error="Please Fill the correct Email" placeholder="E-Mail Address" required>
                            </div>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>


                    <!-- Text input-->

                    <div class="form-group">
                        <label class="col-md-4 control-label">Contact No.</label>  
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                <input id="contact_no" name="contact_no" placeholder="041xxxxxxx" class="form-control" type="tel" pattern="[0-9]{10}" required>
                            </div>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>




                    <!-- Button -->
                    <div class="btnDiv">


                        <button id="submitButton" type="submit" class="btn btn-send">Submit   &nbsp&nbsp<span class="glyphicon glyphicon-send"></span></button>

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
