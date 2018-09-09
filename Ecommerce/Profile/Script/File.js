// Edit Profile Validation
$(document).ready(function () {
    $('#UpdateNow').click(function () {
        var fname = $('#FName').val();
        var lname = $('#LName').val();
        var titile = $('#Titl').val();
        var email = $('#email_a').val();
        var contact = $('#contact_n').val();
        var new_pwd = $('#new_p').val();
        var con_pwd = $('#con_p').val();

        if (fname == "") {
            $('#error').show();
            $('#error').text("* First Name is required.");
            return false;
        }
        if (lname == "") {
            $('#error').show();
            $('#error').text("* Last Name is required.");
            return false;
        }
        else if (titile == "") {
            $('#error').show();
            $('#error').text("* Please enter Title.");
            return false;
        }
        else if (email == "") {
            $('#error').show();
            $('#error').text("* Please enter your Email Address.");
            return false;
        }
        else if (contact == "") {
            $('#error').show();
            $('#error').text("* Please enter your Mobile Number.");
            return false;
        }
        else if (new_pwd == "") {
            $('#error').show();
            $('#error').text("* Please Enter Password1.");
            return false;
        }
        else if (con_pwd == "") {
            $('#error').show();
            $('#error').text("* Please Enter Password2.");
            return false;
        }
        else if (new_pwd != con_pwd) {
            $('#error').show();
            $('#error').text("* Password is not match.");
            return false;
        }
        else {
            $('#error').hide();
        }
        if (contact > 0 || contact < 9) { }
        else {
            $('#error').show();
            $('#error').text("* Mobile number is not in correct format.");
            return false;
        }
    });
});

function alert_Congrats() {
    $('.alert_Congrats').show(function () {
        $('.alert_Congrats').delay(5000).fadeOut(1000);
    });
}

