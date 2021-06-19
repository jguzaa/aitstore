$(function () {

    // init the validator
    // validator files are included in the download package
    // otherwise download from http://1000hz.github.io/bootstrap-validator

    $('#loginForm').validator();


    // when the form is submitted
    $('#loginForm').on('submit', function (e) {

        // if the validator does not prevent form submit
        if (!e.isDefaultPrevented()) {
            var url = "phpAction/loginAction.php";

            // POST values in the background the the script URL
            $.ajax({
                type: "POST",
                url: url,
                data: $(this).serialize(),
                success: function (data)
                {
                    // data = JSON object that login.php returns

                    // we recieve the type of the message: success x danger and apply it to the 
                    var messageAlert = 'alert-' + data.type;
                    var messageText = data.message;

                    // let's compose Bootstrap alert box HTML
                    var alertBox = '<div class="alert ' + messageAlert + ' alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>' + messageText + '</div>';

                    // If we have messageAlert and messageText
                    if (messageAlert == 'alert-success') {

                        // inject the alert to .messages div in our form
                        $('#loginForm').find('#result').html(alertBox);

                        setTimeout(function () {
                            location.href = "index.php"; //will redirect to index page
                        }, 2000); //will call the function after 2 secs.

                        // empty the form
                        //$('#registrationForm')[0].reset();

                    } else {
                        // inject the alert to .messages div in our form
                        $('#loginForm').find('#result').html(alertBox);
                        // empty the form
                        $('#loginForm')[0].reset();

                    }
                }
            });
            return false;
        }
    })
});