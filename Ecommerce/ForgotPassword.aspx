<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Ecommerce.ForgotPassword" %>

<%@ Register Src="~/User Control Files/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>
<%@ Register Src="~/User Control Files/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/User Control Files/Header.ascx" TagPrefix="uc1" TagName="Header" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password | Shopping Online</title>
    <meta name="description" content="A two factor authentication is available to recover your password.." />
    <meta name="keywords" content="account, password, forgot password, shopping online, ecommerce" />
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


        <!-- Forgot Password -->
        <div class="container" runat="server" id="showEmail" visible="true">
            <div class="login">
                <h1 class="text-center"><b>F</b>ORGOT <b>P</b>assword</h1>
                <hr class="bottom" />
                <p class="text-center green register-success" style="display: none">Varification code has been sent to your email address.</p>
                <p class="text-center red validation-failed"></p>
                <p class="text-center red" runat="server" id="EmailNotExist" visible="false">Please enter registerd email address.</p>
                <p class="text-center red" runat="server" id="EmailIncorrect" visible="false">Email address is not Correct, please try with correct one.</p>
                <div class="bg">
                    <h6 class="info">Enter your email to recover your account.</h6>
                    <input type="text" class="form-control" placeholder="Email" runat="server" id="ForgotEmail" />
                    <asp:Button ID="Forgot" runat="server" Text="SEND" CssClass="btn btn-primary center-block" OnClick="Forgot_Click" />
                    <h6 class="text-center">Know your password? <a href="Login">Login Now</a></h6>
                </div>
            </div>
        </div>

        <!-- Varify Password -->
        <div class="container" runat="server" id="Varification" visible="false">
            <div class="login">
                <h1 class="text-center"><b>C</b>ode <b>V</b>arification</h1>
                <hr class="bottom" />
                <p class="text-center green register-success" style="display: none">Varification code has been sent to your email address.</p>
                <p class="text-center red validation-failed"></p>
                <p class="text-center red" runat="server" id="CodeIncorrect" visible="false">Varification code is not correct, try again.</p>
                <div class="bg">
                    <h6 class="info">Enter Varification Code.</h6>
                    <input type="text" class="form-control" placeholder="Code" runat="server" id="CodeText" />
                    <asp:Button ID="Varify" runat="server" Text="Varify" CssClass="btn btn-primary center-block" OnClick="Varify_Click" />
                    <h6 class="text-center">Know your password? <a href="Login">Login Now</a></h6>
                </div>
            </div>
        </div>

        <!-- Varify Password -->
        <div class="container" runat="server" id="ChangePassword" visible="false">
            <div class="login">
                <h1 class="text-center"><b>R</b>eset <b>P</b>assword</h1>
                <hr class="bottom" />
                <p class="text-center green register-success" style="display: none">Your Email address has been varified.</p>
                <p class="text-center red validation-failed"></p>
                <div class="bg">
                    <h6 class="info">New Password.</h6>
                    <input type="password" class="form-control" placeholder="Password" runat="server" id="Pwd" />
                    <h6 class="info">Confirm Password.</h6>
                    <input type="password" class="form-control" placeholder="Password" runat="server" id="ConPwd" />
                    <asp:Button ID="Change" runat="server" Text="Change" CssClass="btn btn-primary center-block" OnClick="Change_Click" />
                    <h6 class="text-center">Know your password? <a href="Login">Login Now</a></h6>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            <uc1:Footer runat="server" ID="Footer" />
        </div>
        <!-- Footer -->
    </form>
</body>
</html>
