<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Ecommerce.About" %>

<%@ Register Src="~/User Control Files/Socialicons.ascx" TagPrefix="uc1" TagName="Socialicons" %>
<%@ Register Src="~/User Control Files/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/User Control Files/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/User Control Files/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us | Shopping Online</title>
    <meta name="description" content="We are the man behind selling different company products to you, you can know more about us." />
    <meta name="keywords" content="about us, shopping online, ecommerce, introduction" />
    <meta name="author" content="Umar Anwar" />
    <uc1:Header runat="server" id="Header" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar  -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <uc1:Navigation runat="server" id="Navigation" />
        </nav>
        <!-- Navbar -->


        <!-- About US -->
        <div class="container">
            <div class="about">
                <h1 class="text-center"><b>A</b>bout <b>U</b>s</h1>
                <hr class="bottom" />
                <img src="Images/about1.jpeg" alt="">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum omnis dolor tenetur, animi deleniti consectetur fugiat dolorum sequi fuga aliquid iure tempore, ut laudantium ipsa error aut placeat, voluptatum facilis. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aliquam nulla tempora, possimus eaque dolorem ut placeat debitis tempore facere consectetur, minus id cumque repellendus dolor dolorum, incidunt neque quae. Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p>
                <div class="value">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <h3 class="text-center">Our Values</h3>
                        <p class="text-center">We're committed to a sustainable relations with out partners - from seamstress to salesperson. We are community partners, not just employers.</p>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <img src="Images/value.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
        <!-- About US -->

        <!-- Social Icons -->
        <div class="icons">
            <uc1:Socialicons runat="server" id="Socialicons" />
        </div>
        <!-- Social Icons -->

        <!-- Footer -->
        <div class="footer">
            <uc1:Footer runat="server" id="Footer" />
        </div>
        <!-- Footer -->
    </form>
</body>
</html>
