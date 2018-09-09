<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderSuccess.aspx.cs" Inherits="Ecommerce.OrderSuccess" %>

<%@ Register Src="~/User Control Files/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/User Control Files/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>
<%@ Register Src="~/User Control Files/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/User Control Files/Socialicons.ascx" TagPrefix="uc1" TagName="Socialicons" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Passed | Shopping Online</title>
    <meta name="description" content="Your order processed successfully." />
    <meta name="keywords" content="order, order passed, shopping online, ecommerce" />
    <meta name="author" content="Umar Anwar" />
    <meta name="robots", content="noindex, nofollow" />
    <uc1:Header runat="server" ID="Header1" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar  -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <uc1:Navigation runat="server" ID="Navigation" />
        </nav>
        <!-- Navbar -->
        <div class="container">
            <div class="success-fail">
                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <h1 style="color: darkseagreen" class="text-center">Thanks for Shopping</h1>
                    <h5 class="text-center">We have received your order. If we need to confirm any information regarding your purchase, our customer service agent will contact you shortly. Otherwise your order will be automatically confirmed. </h5>
                    <a href="Default.aspx" class="btn btn-default center-block">Go to Main Page</a>
                </div>
                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>
            </div>
        </div>
        <!-- Social Icons -->
        <div class="icons">
            <uc1:Socialicons runat="server" ID="Socialicons" />
        </div>
        <!-- Social Icons -->

        <!-- Footer -->
        <div class="footer" style="margin-top: 50px;">
            <uc1:Footer runat="server" ID="Footer" />
        </div>
        <!-- Footer -->
    </form>
</body>
</html>
