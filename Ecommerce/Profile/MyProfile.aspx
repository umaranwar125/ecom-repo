<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="UI.Profile.MyProfile" %>

<%@ Register Src="~/Profile/User Control FIle/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/Profile/User Control FIle/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Profile/User Control FIle/MainNavigation.ascx" TagPrefix="uc1" TagName="MainNavigation" %>
<%@ Register Src="~/Profile/User Control FIle/SecondaryNavigation.ascx" TagPrefix="uc1" TagName="SecondaryNavigation" %>
<%@ Register Src="~/Profile/User Control FIle/SideProfile.ascx" TagPrefix="uc1" TagName="SideProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile | Shopping Online</title>
    <meta name="author" content="Umar Anwar" />
    <meta name="robots" content="noindex, nofollow" />
    <uc1:Header runat="server" id="Header" />

    <!-- Icon -->
    <link rel="icon" type="image/png" href="/Image/title.png" />

    <link rel="stylesheet" type="text/css" href="Style/ProfileStyle.css" />
</head>
<body style="background: #eef3f6">

    <form id="form1" runat="server">

        <!-- Navbar  -->
        <nav class="main navbar navbar-default navbar-fixed-top">
            <uc1:MainNavigation runat="server" id="MainNavigation" />
        </nav>
        <!-- Navbar -->

        <div class="container">
            <div class="profile">
                <!-- navbar -->
                <uc1:SecondaryNavigation runat="server" id="SecondaryNavigation" />

                <!-- profile -->
                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                    <uc1:SideProfile runat="server" ID="SideProfile" />
                </div>
                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">Personel Information</div>
                        <div class="panel-body">
                            <% foreach (var data in displayRegisterationDataObj)
                                {
                                     %>
                            <h5>First Name</h5>
                            <h6><%= data.FName %></h6>
                            <hr />
                            <h5>Last Name</h5>
                            <h6><%= data.LName %></h6>
                            <hr />
                            <h5>Title</h5>
                            <h6><%= (data.Title == null) ? "N/A" : data.Title %></h6>
                            <hr />
                            <h5>Mobile Number</h5>
                            <h6><%= data.Contact%></h6>
                            <%} %>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            <uc1:Footer runat="server" id="Footer" />
        </div>
        <!-- Footer -->
    </form>
</body>
</html>
