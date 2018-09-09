<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Ecommerce.Login" %>

<%@ Register Src="~/User Control Files/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>
<%@ Register Src="~/User Control Files/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/User Control Files/Header.ascx" TagPrefix="uc1" TagName="Header" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login | Shopping Online</title>
    <meta name="description" content="Login is required for purchasing a products." />
    <meta name="keywords" content="Login, account,  shopping online, ecommerce" />
    <meta name="author" content="Umar Anwar" />
    <uc1:Header runat="server" ID="Header" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar  -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <uc1:Navigation runat="server" ID="Navigation" />
        </nav>
        <!-- Navbar -->


        <!-- Login -->
        <div class="container" runat="server" id="LoginForm" visible="true">
            <div class="login">
                <h1 class="text-center"><b>L</b>OGIN</h1>
                <hr class="bottom" />
                <p class="text-center green register-success" style="display: none">Registeration successfull, you can Login now!</p>
                <p class="text-center green success" style="display: none">Password has been updated successfully, you can Login now!</p>
                <p class="text-center red validation-failed"></p>
                <p class="text-center red error" style="display: none">Username or Password is incorrect!</p>
                <p class="text-center red LoginError" style="display: none">For booking, you have to login first.</p>
                <div class="bg">
                    <h6 class="info">Enter your Email and Password.</h6>
                    <input type="text" class="form-control" placeholder="Email" runat="server" id="emailText" />
                    <input type="password" class="form-control" placeholder="Password" runat="server" id="pwdText" />
                    <a href="Forgot_Password">Forgot your password?</a>
                    <asp:Button ID="loginBtn" runat="server" Text="LOGIN" CssClass="btn btn-primary center-block" OnClick="loginBtn_Click" />
                    <h6 class="text-center">Don't have an account? <a href="Register">Register</a></h6>
                </div>
            </div>
        </div>
        <!-- Login -->


        <!-- Footer -->
        <div class="footer">
            <uc1:Footer runat="server" ID="Footer" />
        </div>
        <!-- Footer -->
    </form>
</body>
</html>
