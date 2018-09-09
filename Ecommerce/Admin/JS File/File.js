
if ($(window).width() > 992) {
    $('.side-bar').show();
}
function Open() {
    if ($(window).width() < 992) {
        $('.side-bar').hide();
    }
}

function openNav() {
    $('.side-bar').fadeIn(0);
}

// Hide and Show
$(document).ready(function () {
    $(".show").click(function () {
        $(".hid").toggle(1000);
    });
});

// Category Validation.
$(document).ready(function () {
    $("#AddCat").click(function () {
        var cat = $("#CatText").val();
        if (cat == "") {
            $('.validate').text("*Category field is required.");
            return false;
        }
        else
            return true;
    });
});
$(document).ready(function () {
    $("#UpdateCat").click(function () {
        var cat = $("#UpdCatText").val();
        if (cat == "") {
            $('.validate').text("*Category field is required.");
            return false;
        }
        else
            return true;
    });
});

$(document).ready(function () {
    $("#AddMsg").click(function () {
        var subject = $("#SubjectText").val();
        var msg = $("#MsgText").val();
        if (subject == "") {
            $('.validate').text("*Subject field is required.");
            return false;
        }
        if (msg == "") {
            $('.validate').text("*Message field is required.");
            return false;
        }
        else
            return true;
    });
});

// Successfull Message.
function userRegisterationSuccessfull() {
    $('.register-success').show(function () {
        $('.register-success').delay(5000).fadeOut(1000);
    });
}


// Success.
function Success() {
    $('.success').show(function () {
        $('.success').delay(5000).fadeOut(1000);
    });
}

function displaySuccessMessage() {
    $(document).ready(function () {
        $('.success').show(function () {
            $('.success').delay(4000).fadeOut(1000);
        });
    });
}

function displaySuccessUpdateMessage() {
    $(document).ready(function () {
        $('.success-update').show(function () {
            $('.success-update').delay(4000).fadeOut(1000);
        });
    });
}

function displaySuccessDeleteMessage() {
    $(document).ready(function () {
        $('.success-delete').show(function () {
            $('.success-delete').delay(4000).fadeOut(1000);
        });
    });
}

function displayDeleteSuccessMessage() {
    $(document).ready(function () {
        $('.success-delete').show(function () {
            $('.success-delete').delay(4000).fadeOut(1000);
        });
    });
}

// Login Validation.
$(document).ready(function () {
    $("#LoginBtn").click(function () {
        var user = $("#UsernameLogin").val();
        var pwd1 = $("#PasswornOneLogin").val();
        var pwd2 = $("#PasswordTwoLogin").val();
        if (user == "") {
            $('.validate').text("*Username field is required.");
            return false;
        }
        if (pwd1 == "") {
            $('.validate').text("*Password1 field is required.");
            return false;
        }
        if (pwd2 == "") {
            $('.validate').text("*Password2 field is required.");
            return false;
        }
        else
            return true;
    });
});


// Profile Update Validation.

$(document).ready(function () {
    $("#AdminProfileUpdate").click(function () {
        var name = $("#FullName").val();
        var email = $("#Email").val();
        var mobile = $("#Contact").val();
        if (name == "") {
            $('.validate').text("*Name field is required.");
            return false;
        }
        if (email == "") {
            $('.validate').text("*Email field is required.");
            return false;
        }
        if (mobile == "") {
            $('.validate').text("*Mobile field is required.");
            return false;
        }
        if (mobile > 0 || mobile < 9) { }
        else{
            $('.validate').text("*Mobile number is not in correct format.");
            return false;
        }
    });
});

// Username and Password Update Validation.

$(document).ready(function () {
    $("#AdminPwdUpdate").click(function () {
        var Ouser = $("#UsernameOldText").val();
        var Nuser = $("#UsernameText").val();
        var Opwd1 = $("#Pwd1OldText").val();
        var Npwd1 = $("#Pwd1Text").val();
        var Npwd2 = $("#Pwd2Text").val();
        if (Ouser == "") {
            $('.validate').text("*Old Username field is required.");
            return false;
        }
        else if (Nuser == "") {
            $('.validate').text("*New Username field is required.");
            return false;
        }
        else if (Opwd1 == "") {
            $('.validate').text("*Old Password 1 field is required.");
            return false;
        }
        else if (Npwd1 == "") {
            $('.validate').text("*New Password 1 field is required.");
            return false;
        }
        else if (Npwd2 == "") {
            $('.validate').text("*New Password 2 field is required.");
            return false;
        }
        else
            return true;
    });
});


// Product Validation.

$(document).ready(function () {
    $("#AddPro").click(function () {
        var Name = $("#NameText").val();
        var Price = $("#PriceText").val();
        var OPrice = $("#OPriceText").val();
        if (Name == "") {
            $('.validate').text("*Name field is required.");
            return false;
        }
        if (Price == "") {
            $('.validate').text("*Price field is required.");
            return false;
        }
        if (Price > 0 || Price < 9) { }
        else {
            $('.validate').text("*Price is not in correct format.");
            return false;
        }
        if (OPrice > 0 || OPrice < 9) { }
        else {
            $('.validate').text("*Old Price is not in correct format.");
            return false;
        }
    });
});

// Product Validation.

$(document).ready(function () {
    $("#UpdatePro").click(function () {
        var Name = $("#UpdNameText").val();
        var Price = $("#UpdPriceText").val();
        var OPrice = $("#UpdOPriceText").val();
        if (Name == "") {
            $('.validate').text("*Name field is required.");
            return false;
        }
        if (Price == "") {
            $('.validate').text("*Price field is required.");
            return false;
        }
        if (Price > 0 || Price < 9) { }
        else {
            $('.validate').text("*Price is not in correct format.");
            return false;
        }
        if (OPrice > 0 || OPrice < 9) { }
        else {
            $('.validate').text("*Old Price is not in correct format.");
            return false;
        }

    });
});

// Product Image Validation.

$(document).ready(function () {
    $("#AddImg").click(function () {
        var ID = $("#IDText").val();
        if (ID == "") {
            $('.validate').text("*Product ID field is required.");
            return false;
        }
        if (ID > 0 || ID < 9) { }
        else {
            $('.validate').text("*Product ID is not in correct format.");
            return false;
        }
    });
});

// Search Product Validation.

$(document).ready(function () {
    $("#SearchProduct").click(function () {
        var search = $("#SearchText").val();
        if (search == "") {
            $('.validate').text("*Product ID field is required.");
            return false;
        }
        if (search > 0 || search < 9) { }
        else {
            $('.validate').text("*Product ID is not in correct format.");
            return false;
        }
    });
});

// Search ProductImage Validation
$(document).ready(function () {
    $("#SearchProductImage").click(function () {
        var search = $("#SearchText").val();
        if (search == "") {
            $('.validate').text("*Product Name field is required.");
            return false;
        }
    });
});

// Search Shipping Validation
$(document).ready(function () {
    $("#SearchShipping").click(function () {
        var search = $("#SearchText").val();
        if (search == "") {
            $('.validate').text("*Shipping ID field is required.");
            return false;
        }
        if (search > 0 || search < 9) { }
        else {
            $('.validate').text("*Shipping ID is not in correct format.");
            return false;
        }
    });
});

// Search Shipping Validation
$(document).ready(function () {
    $("#SearchOrders").click(function () {
        var search = $("#SearchText").val();
        if (search == "") {
            $('.validate').text("*Register ID field is required.");
            return false;
        }
        if (search > 0 || search < 9) { }
        else {
            $('.validate').text("*Register ID is not in correct format.");
            return false;
        }
    });
});


// Forgot Passsword Validation.
$(document).ready(function () {
    $('#Forgot').click(function () {
        var email = $('#ForgotEmail').val();
        if (email == "") {
            $('.validation-failed').text("*Email address is required");
            return false;
        }
        else {
            return true;
        }
    });
});

// Forgot Passsword Validation.
$(document).ready(function () {
    $('#Varify').click(function () {
        var code = $('#CodeText').val();
        if (code == "") {
            $('.validation-failed').text("*Please enter varification code");
            return false;
        }
        if (code > 0 || code < 9) { }
        else {
            $('.validation-failed').text("*Only Integer letters are allowed.");
            return false;
        }
    });
});

// Change Passsword Validation.
$(document).ready(function () {
    $('#Change').click(function () {
        var pwd1 = $('#Pwd').val();
        var pwd2 = $('#ConPwd').val();
        if (pwd1 == "") {
            $('.validation-failed').text("*Password is required");
            return false;
        }
        else if (pwd2 == "") {
            $('.validation-failed').text("*Password is required");
            return false;
        }
        else if (pwd1 != pwd2) {
            $('.validation-failed').text("*Password is not match.");
            return false;
        }
        else
            return true;
    });
});

$(document).ready(function () {
    $('.Yes').click(function () {
        $('.Show').show(500);
    });
    $('.No').click(function () {
        $('.Show').hide(500);
    });
});

$(document).ready(function () {
    $('#SendMail').click(function () {
        var to = $('#ToText').val();
        var msg = $('#Msg').val();
        if (to == "") {
            $('.validate').text("*To field is required");
            return false;
        }
        else if (msg == "") {
            $('.validate').text("*Message field is required");
            return false;
        }
        else
            return true
    });
});

