function myFunction(imgs) {
  // Get the expanded image
  var expandImg = document.getElementById("expandedImg");
  // Get the image text
  var imgText = document.getElementById("imgtext");
  // Use the same src in the expanded image as the image being clicked on from the grid
  expandImg.src = imgs.src;
  // Use the value of the alt attribute of the clickable image as text inside the expanded image
  imgText.innerHTML = imgs.alt;
  // Show the container element (hidden with CSS)
  expandImg.parentElement.style.display = "block";
}

//function addAclass(obj) {
//    $(".element").click(function () {
//        $(this).each(function () {
//            $("[class*='active']").removeClass('active');
//            $(this).addClass('active');
//        });
//    });
//}


// User Registeration Validation.
$(document).ready(function () {
    $('#UserRegisteration').click(function () {
        var fname = $('#fNameText').val();
        var lname = $('#lNameText').val();
        var email = $('#emailText').val();
        var pwd = $('#pwdText').val();
        if (fname == "") {
            $('.validation-failed').text("*First name is required");
            return false;
        }
        else if (lname == "") {
            $('.validation-failed').text("*Last name is required");
            return false;
        }
        else if (email == "") {
            $('.validation-failed').text("*Email address is required");
            return false;
        }
        else if (pwd == "") {
            $('.validation-failed').text("*Password is required");
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

// Error.
function error() {
    $('.error').show(function () {
        $('.error').delay(5000).fadeOut(1000);
    });
}

// Error1.
function error1() {
    $('.error1').show(function () {
        $('.error1').delay(5000).fadeOut(1000);
    });
}

// Login Error
function LoginError() {
    $('.LoginError').show(function () {
        $('.LoginError').delay(5000).fadeOut(1000);
    });
}

// Cart Error
function CartError() {
    $('.CartError').show(function () {
        $('.CartError').delay(8000).fadeOut(1000);
    });
}

// Order Placed
function OrderPlaced() {
    $('.order-placed').fadeIn(function () {
        $('.order-placed').delay(8000).fadeOut(1000);
    });
}


// Success.
function Success() {
    $('.success').show(function () {
        $('.success').delay(5000).fadeOut(1000);
    });
}

function Cart() {
    $('.product-added').fadeIn(function () {
        $('.product-added').delay(5000).fadeOut(1000);
    });
}

// Login Validation.
$(document).ready(function () {
    $('#loginBtn').click(function () {
        var email = $('#emailText').val();
        var pwd = $('#pwdText').val();
        if (email == "") {
            $('.validation-failed').text("*Email is required");
            return false;
        }
        else if (pwd == "") {
            $('.validation-failed').text("*Password is required");
            return false;
        }
        else
            return true;
    });
});

// Conatact Validation.
$(document).ready(function () {
    $('#ContactBtn').click(function () {
        var name = $('#nameText').val();
        var email = $('#emailText').val();
        var msg = $('#msgText').val();
        if (name == "") {
            $('.validation-failed').text("*Full Name is required");
            return false;
        }
        else if (email == "") {
            $('.validation-failed').text("*Email address is required");
            return false;
        }
        else if (msg == "") {
            $('.validation-failed').text("*Message is required");
            return false;
        }
        else {
            return true;
        }
    });
});

// Conatact Validation.
$(document).ready(function () {
    $('#NewsletterBtn').click(function () {
        var news = $('#newsText').val();
        if (news == "") {
            $('.validation-failed1').text("*Email address is required");
            return false;
        }
        else {
            return true;
        }
    });
});


// Shipping Validation.
$(document).ready(function () {
    $('#Confirm').click(function () {
        var email = $('#EmailTxtBox').val();
        var mobile = $('#MobileTxtBox').val();
        var FName = $('#FNameTxtBox').val();
        var LName = $('#LNameTxtBox').val();
        var Adrs = $('#AddressTxtBox').val();
        var city = $('#CityTxtBox').val();
        var postal = $('#CodeTxtBox').val();
        if (email == "") {
            $('.ship-msg').text("*Email is required");
            return false;
        }
        else if (mobile == "") {
            $('.ship-msg').text("*Mobile Number is required");
            return false;
        }
        else if (mobile == "") {
            $('.ship-msg').text("*Mobile Number is required");
            return false;
        }
        else if (FName == "") {
            $('.ship-msg').text("*First Name is required");
            return false;
        }
        else if (LName == "") {
            $('.ship-msg').text("*Last Name is required");
            return false;
        }
        else if (Adrs == "") {
            $('.ship-msg').text("*Current address is required");
            return false;
        }
        else if (city == "") {
            $('.ship-msg').text("*City is required");
            return false;
        }
        else if (postal == "") {
            $('.ship-msg').text("*Postal Code is required");
            return false;
        }
        if (mobile > 0 || mobile < 9) {
        }
        else {
            $('.ship-msg').text("*Mobile number is not in correct format");
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
        if(code > 0 || code < 9){}
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


// Product Filter Validation.
$(document).ready(function () {
    $('#Filter').click(function () {
        var lowest = $('#LowestPrice').val();
        var highest = $('#HighestPrice').val();
        if (lowest == "") {
            $('.validate').text("*MIN Field is required");
            return false;
        }
        else if (highest == "") {
            $('.validate').text("*MAX Field is required");
            return false;
        }
        if (lowest > 0 || lowest < 9) {}
        else{
            $('.validate').text("*Only integer numbers are allowed.");
            return false;
        }
        if (highest > 0 || highest < 9) { }
        else {
            $('.validate').text("*Only integer numbers are allowed.");
            return false;
        }
    });
});
