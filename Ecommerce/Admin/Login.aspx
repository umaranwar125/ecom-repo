<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Ecommerce.Admin.Login" %>

<%@ Register Src="~/Admin/User Control File/Header.ascx" TagPrefix="uc1" TagName="Header" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login | Shopping Online</title>
    <uc1:Header runat="server" ID="Header" />
</head>
<body id="login">
    <form id="form1" runat="server">
        <section>
            <!-- Main Login Form -->
            <div class="container MainPage">
                <div class="col-sm-1 col-md-1 col-lg-2"></div>
                <div class="col-xs-12 col-sm-10 col-md-10 col-lg-8">
                    <div class="my-form">
                        <div class="form-content">
                            <h2 class="text-center">Login</h2>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
                            <p>when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
                        </div>
                        <div class="login-form">
                            <img src="../Images/avatar2.png" class="center-block" width="100" height="100" />
                            <div class="inputs">
                                <p class="text-center green success" style="display: none">Password has been updated successfully, you can Login now!</p>
                                <p class="validate text-center" runat="server" id="Incorrect" visible="false">Username or password is incorrect</p>
                                <label>Username</label><input type="text" runat="server" id="UsernameLogin" placeholder="Enter Username" />
                                <label>Password 1</label><input type="password" runat="server" id="PasswornOneLogin" placeholder="Enter First Password" />
                                <label>Password 2</label><input type="password" runat="server" id="PasswordTwoLogin" placeholder="Enter Second Password" />
                                <p class="validate text-center"></p>
                                <asp:Button ID="LoginBtn" runat="server" Text="LOGIN" CssClass="btn btn-default" OnClick="Login_Click" />
                                <a href="ForgotPassword.aspx" class="pull-left ForgotPassword">Forgot Password</a>
                                <a href="../Default.aspx" class="pull-right page">Go to Main Page</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-1 col-md-1 col-lg-2"></div>
            </div>
        </section>
    </form>
</body>
</html>
