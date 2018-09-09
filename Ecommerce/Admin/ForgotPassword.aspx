<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Ecommerce.Admin.ForgotPassword" %>

<%@ Register Src="~/Admin/User Control File/Header.ascx" TagPrefix="uc1" TagName="Header" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel | Shopping Online</title>
    <uc1:Header runat="server" ID="Header" />
</head>
<body id="login">
    <form id="form1" runat="server">

        <!--Forgot Password -->
        <section runat="server" id="showEmail" visible="true">
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
                                <p class="text-center red" runat="server" id="EmailNotExist" visible="false">Please enter registerd email address.</p>
                                <p class="text-center red" runat="server" id="EmailIncorrect" visible="false">Email address is not Correct, please try with correct one.</p>
                                <p class="text-center red validation-failed"></p>
                                <label>Email</label><input type="text" runat="server" id="ForgotEmail" placeholder="Enter Email" />
                                <asp:Button ID="Forgot" runat="server" Text="SEND" CssClass="btn btn-default" OnClick="Forgot_Click" />
                                <a href="Login.aspx" class="pull-left ForgotPassword">Know Password?</a>
                                <a href="../Default.aspx" class="pull-right page">Go to Main Page</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-1 col-md-1 col-lg-2"></div>
            </div>
        </section>

        <!--Varify Password -->
        <section runat="server" id="Varification" visible="false">
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
                                <p class="text-center green register-success" style="display: none">Varification code has been sent to your email address.</p>
                                <p class="text-center red validation-failed"></p>
                                <p class="text-center red" runat="server" id="CodeIncorrect" visible="false">Varification code is not correct, try again.</p>
                                <label>Code</label><input type="text" runat="server" id="CodeText" placeholder="Enter Code" />
                                <asp:Button ID="Varify" runat="server" Text="VARIFY" CssClass="btn btn-default" OnClick="Varify_Click" />
                                <a href="Login.aspx" class="pull-left ForgotPassword">Know Password?</a>
                                <a href="../Default.aspx" class="pull-right page">Go to Main Page</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-1 col-md-1 col-lg-2"></div>
            </div>
        </section>

        <!--Varify Password -->
        <section runat="server" id="ChangePassword" visible="false">
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
                                <p class="text-center green register-success" style="display: none">Your Email address has been varified.</p>
                                <p class="text-center red validation-failed"></p>
                                <label>Password 2</label><input type="password" runat="server" id="Pwd" placeholder="Enter Password 1" />
                                <label>Password 2</label><input type="password" runat="server" id="ConPwd" placeholder="Enter Password 2" />
                                <p class="validate text-center validation-failed"></p>
                                <asp:Button ID="Change" runat="server" Text="Change" CssClass="btn btn-default" OnClick="Change_Click" />
                                <a href="Login.aspx" class="pull-left ForgotPassword">Know Password?</a>
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
