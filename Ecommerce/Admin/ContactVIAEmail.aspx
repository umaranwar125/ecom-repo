<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactVIAEmail.aspx.cs" Inherits="Ecommerce.Admin.ContactVIAEmail" %>

<%@ Register Src="~/Admin/User Control File/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Admin/User Control File/SideNavigation.ascx" TagPrefix="uc1" TagName="SideNavigation" %>
<%@ Register Src="~/Admin/User Control File/TopNavigation.ascx" TagPrefix="uc1" TagName="TopNavigation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel | Shopping Online</title>
    <uc1:Header runat="server" ID="Header" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Contaier-Fluid -->
        <div class="container-fluid">
            <div class="row">
                <!-- First Column -->
                <div class="col-md-2 col-lg-2 side-bar" id="side-bar">
                    <uc1:SideNavigation runat="server" ID="SideNavigation" />
                </div>

                <!-- Second Column -->
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 right-bg">

                    <!-- Top COntent -->
                    <uc1:TopNavigation runat="server" ID="TopNavigation" />
                    <!-- Top Content  -->

                    <!--  Main COntent -->
                    <div class="main-content" onclick="Open();">

                        <!-- Breadcrumb -->
                        <h2 class="heading">Contact</h2>
                        <ol class="breadcrumb">
                            <li><a href="Dashboard.aspx">Home</a></li>
                            <li><a href="Contact.aspx">Contact to Customer</a></li>
                            <li class="active">Data</li>
                        </ol>
                        <!-- Breadcrumb -->

                        <div class="registered-users">
                            <div class="bg col-xs-12 col-sm-12 col-md-12 col-lg-12 Customer-Contact">
                                <div class="text-left msg-success success-delete alert alert-success" style="display: none">Your message has been sent.</div>
                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="clearfix"></div>
                                    <h2 class="text-center">Contact to Customer</h2>
                                    <p class="text-center red" runat="server" id="EmailIncorrect" visible="false">Email address is not Correct, please try with correct one.</p>
                                    <label>To*</label>
                                    <input type="text" id="ToText" runat="server" placeholder="abc@xyz.com" />
                                    <label>Subject*</label>
                                    <input type="text" id="SubjectText" runat="server" placeholder="Enter Subject" />
                                    <label>Message*</label>
                                    <textarea id="Msg" rows="10" runat="server" placeholder="Enter your message"></textarea>
                                    <p class="validate text-right"></p>
                                    <asp:Button ID="SendMail" runat="server" Text="SEND" CssClass="btn btn-default add pull-right" OnClick="SendMail_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>
                            </div>
                            <!-- BG -->
                        </div>
                        <!-- Registetred User -->
                    </div>
                    <!-- Main Content -->
                </div>
                <!-- Second Column -->
            </div>
            <!-- Row  -->
        </div>
        <!-- Container-Fluid -->
    </form>
</body>
</html>
