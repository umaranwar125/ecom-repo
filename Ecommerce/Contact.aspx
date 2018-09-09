<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Ecommerce.Contact" %>

<%@ Register Src="~/User Control Files/Socialicons.ascx" TagPrefix="uc1" TagName="Socialicons" %>
<%@ Register Src="~/User Control Files/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/User Control Files/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/User Control Files/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contacts Us | Shopping Online</title>
    <meta name="description" content="You can feel free to contact us regarding any query." />
    <meta name="keywords" content="contact, contact us, shopping online, ecommerce" />
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

        <!-- Contact US -->
        <div class="container">
            <div class="contact">
                <h1 class="text-center"><b>C</b>ontact <b>U</b>s</h1>
                <hr class="bottom">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <!--Start of Tawk.to Script-->


                    <h3>What To Say?</h3>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam quis eveniet, quos, doloribus dignissimos cum corporis optio iste recusandae dolores similique aperiam ipsam voluptatum saepe, voluptate, possimus rerum molestias. Sint!
                        <br />
                        <br />
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi, ea atque nihil deleniti eveniet odit ipsam, possimus, aliquid a facilis ad saepe accusamus similique, illo minus maiores ex porro. Odit! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo atque ratione inventore, deleniti possimus molestias iusto quisquam libero ullam repellendus perspiciatis reiciendis eius aliquid quos omnis cum corporis ducimus illum!
                    </p>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <p class="text-center red error1" style="display: none">Email is not correct, please try with correct one!</p>
                    <p class="text-center green success" style="display: none">Your message has been successfully send.</p>
                    <div class="bg">
                        <p>Do you have a question? A suggestion? Feel free to contact us and we will be happy to help you</p>
                        <input type="text" class="form-control" placeholder="Your Name" runat="server" id="nameText">
                        <input type="text" class="form-control" placeholder="Your Email" runat="server" id="emailText" />
                        <textarea class="form-control" placeholder="Your Message"  runat="server" id="msgText"></textarea>
                        <p class="text-left red validation-failed" style="color: red"></p>
                        <asp:Button ID="ContactBtn" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="ContactBtn_Click"  />
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact US -->


        <!-- Social Icons -->
        <div class="icons">
            <uc1:Socialicons runat="server" ID="Socialicons" />
        </div>
        <!-- Social Icons -->


        <!-- Footer -->
        <div class="footer">
            <uc1:Footer runat="server" ID="Footer" />

        </div>
        <!-- Footer -->
    </form>
</body>
</html>
