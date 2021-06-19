$(function () {

    // init the validator
    // validator files are included in the download package
    // otherwise download from http://1000hz.github.io/bootstrap-validator

    $('#registrationForm').validator();


    // when the form is submitted
    $('#registrationForm').on('submit', function (e) {

        // if the validator does not prevent form submit
        if (!e.isDefaultPrevented()) {
            var url = "phpAction/regisAction.php";

            // POST values in the background the the script URL
            $.ajax({
                type: "POST",
                url: url,
                data: $(this).serialize(),
                success: function (data)
                {
                    // data = JSON object that contact.php returns

                    // we recieve the type of the message: success x danger and apply it to the 
                    var messageAlert = 'alert-' + data.type;
                    var messageText = data.message;

                    // let's compose Bootstrap alert box HTML
                    var alertBox = '<div class="alert ' + messageAlert + ' alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>' + messageText + '</div>';

                    // If we have messageAlert and messageText
                    if (messageAlert == 'alert-success') {

                        // inject the alert to .messages div in our form
                        $('#registrationForm').find('#result').html(alertBox);

                        setTimeout(function () {
                            location.href = "login.php"; //will redirect to login page
                        }, 2000); //will call the function after 2 secs.

                        // empty the form
                        //$('#registrationForm')[0].reset();

                    } else {
                        // inject the alert to .messages div in our form
                        $('#registrationForm').find('#result').html(alertBox);

                    }
                }
            });
            return false;
        }
    })
});






/*$(document).ready(function() {
    var i = "1";

    $("#submitButton").click(function(){



        if (i == "2"){
            document.getElementById("result").innerHTML = "success";
        }else{
            document.getElementById("result").innerHTML = "Fail";
        }

        return false;
    });

    function checkData(){
        var fName = $("#first_name").val();
        var lName = $("#last_name").val();
        var dob = $("#dob").val();
        var address = $("#address").val();
        var uName = $("#user_name").val();
        var pass = $("#inputPassword").val();
        var passCon = $("#inputPasswordConfirm").val();
        var email = $("#email").val();
        var tel = $("#contact_no").val();

        if(fName.length==0 || lName.length==0 || dob.length==0 || address.length==0 || uName.length==0 || pass.length==0 || passCon.length==0 || email.length==0 || tel.length==0)
        {
            return false;
        } 
        else
        {
            return true;
        }
    };


    /*$('#registrationForm').validator().on('submit', function (e) {
        if (e.isDefaultPrevented()) {
            // handle the invalid form...

            document.getElementById("result").innerHTML = "Error";


        } else {
            // everything looks good!




            // using serialize function of jQuery to get all values of form
            var serializedData = $("#registrationForm").serialize();

            $.post("regisAction.php",serializedData,function(data){

                document.getElementById("result").innerHTML = data;

            });

            setTimeout(function () {
                location.href = "index.php"; //will redirect to your blog page (an ex: blog.html)
            }, 2000); //will call the function after 2 secs.




        }
    })

})*/