<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderFail.aspx.cs" Inherits="Ecommerce.OrderFail" %>

<%@ Register Src="~/User Control Files/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/User Control Files/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>
<%@ Register Src="~/User Control Files/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/User Control Files/Socialicons.ascx" TagPrefix="uc1" TagName="Socialicons" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Failed | Shopping Online</title>
    <meta name="description" content="Your order is prcoessed unsuccessfully." />
    <meta name="keywords" content="order, fail, order failed, shopping online, ecommerce" />
    <meta name="author" content="Umar Anwar" />
    <meta name="robots" content="noindex, nofollow" />
    <uc1:Header runat="server" ID="Header" />
</head>
<body>

    <form id="form1" runat="server">
        <!-- Navbar  -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <uc1:Navigation runat="server" ID="Navigation1" />
        </nav>
        <!-- Navbar -->
        <div class="container">
            <div class="success-fail">
                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <h1 style="color: darkseagreen" class="text-center">Unsuccessfull</h1>
                    <h5 class="text-center">Sorry your purchasing is not processed successfully, please try again.</h5>
                    <a href="Default.aspx" class="btn btn-default center-block">Go to Main Page</a>
                </div>
                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>
            </div>
        </div>
        <!-- Social Icons -->
        <div class="icons">
            <uc1:Socialicons runat="server" ID="Socialicons1" />
        </div>
        <!-- Social Icons -->

        <!-- Footer -->
        <div class="footer" style="margin-top: 50px;">
            <uc1:Footer runat="server" ID="Footer1" />
        </div>
        <!-- Footer -->
    </form>
</body>
</html>
