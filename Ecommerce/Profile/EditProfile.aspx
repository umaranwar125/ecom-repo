<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Ecommerce.Profile.EditProfile" %>

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
    <uc1:Header runat="server" ID="Header" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar  -->
        <nav class="main navbar navbar-default navbar-fixed-top">
            <uc1:MainNavigation runat="server" ID="MainNavigation" />
        </nav>
        <!-- Navbar -->

        <div class="container">
            <div class="profile">
                <!-- navbar -->
                <uc1:SecondaryNavigation runat="server" ID="SecondaryNavigation" />

                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                    <uc1:SideProfile runat="server" ID="SideProfile" />
                </div>
                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">Personel Information</div>
                        <div class="panel-body">
                            <div class="Profie-info-bg">
                                <p class="text-center green alert_Congrats" style="display: none">Congrats! Profile has been updated successfully.</p>
                                <p visible="false" id="alert_image" runat="server" class="red text-center">Please Select Image.</p>
                                <label for="">First Name</label>
                                <input type="text" placeholder="Enter your First Name" id="FName" runat="server">
                                <label for="" class="margin">Last Name</label>
                                <input type="text" placeholder="Enter your Last Name" id="LName" runat="server">
                                <label for="" class="margin">Title</label>
                                <input type="text" placeholder="Say something in 3-4 words." id="Titl" runat="server">
                                <label for="" class="margin">Contact Number</label>
                                <input type="text" placeholder="Enter Contact Number" id="contact_n" runat="server">
                                <label for="" class="margin">New Password</label>
                                <input type="password" placeholder="Enter New Password" id="new_p" runat="server">
                                <label for="" class="margin">Confirm Password</label>
                                <input type="password" placeholder="Enter Confirm Password" id="con_p" runat="server">
                                <label for="" class="margin">Change Image</label>
                                <asp:FileUpload ID="img" runat="server" />
                                <p id="error" class="text-right red" display: none"></p>
                                <p id="error-pwd" class="text-right red" display: none"></p>
                                <asp:Button ID="UpdateNow" runat="server" Text="Update Now" CssClass="btn btn-warning center-block" OnClick="UpdateNow_Click" />
                            </div>
                        </div>
                    </div>
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
