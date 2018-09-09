<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminInfoUpdate.aspx.cs" Inherits="Ecommerce.Admin.AdminInfoUpdate" %>

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
                    <nav>
                        <h3><a href="Dashboard.aspx"><b>A</b>dmin <b>Panel</b></a></h3>
                        <hr class="bottom" />
                        <ul>
                            <a href="Dashboard.aspx">
                                <li><i class="fas fa-tachometer-alt"></i>&nbsp;&nbsp;Dashboard</li>
                            </a>
                            <a href="AdminProfile.aspx">
                                <li class="active"><i class="fa fa-user fa-5x border" aria-hidden="true"></i>&nbsp;&nbsp;My Profile</li>
                            </a>
                            <a href="Categories.aspx">
                                <li><i class="fas fa-list-ul"></i>&nbsp;&nbsp;Categories</li>
                            </a>
                            <a href="Contact.aspx">
                                <li><i class="fas fa-envelope"></i>&nbsp;&nbsp;Contact Us</li>
                            </a>
                            <a href="Newsletter.aspx">
                                <li><i class="fas fa-newspaper"></i>&nbsp;&nbsp;Newsletter</li>
                            </a>
                            <a href="Products.aspx">
                                <li><i class="fas fa-tshirt"></i>&nbsp;&nbsp;Products</li>
                            </a>
                            <a href="ProductImages.aspx">
                                <li><i class="fas fa-wallet"></i>&nbsp;&nbsp;Product Images</li>
                            </a>
                            <a href="RegisteredUsers.aspx">
                                <li><i class="far fa-registered"></i>&nbsp;&nbsp;Registerations</li>
                            </a>
                            <a href="Orders.aspx">
                                <li><i class="fas fa-shopping-bag"></i>&nbsp;&nbsp;Orders</li>
                            </a>
                            <a href="Shipping.aspx">
                                <li><i class="fas fa-shipping-fast"></i>&nbsp;&nbsp;Shiiping Addresses</li>
                            </a>
                        </ul>
                    </nav>
                </div>

                <!-- Second Column -->
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 right-bg">

                    <!-- Top COntent -->
                    <div class="top-content">
                        <uc1:TopNavigation runat="server" ID="TopNavigation" />
                    </div>
                    <!-- Top Content  -->

                    <!--  Main COntent -->
                    <div class="main-content" onclick="Open();">

                        <nav class="navbar navbar-default">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <%foreach (var data in displayAdminDataObj)
                                    { %>
                                <a class="navbar-brand" href="Profile.aspx" style="letter-spacing: 1px"><span><%= data.FullName %></span>'s Profile</a>
                                <%} %>
                            </div>
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav navbar-right">
                                    <li><a href="AdminInfoUpdate.aspx"><i class="fa fa-key" aria-hidden="true"></i>&nbsp;Change Admin Username and Password</a></li>
                                    <li><a href="Logout.aspx"><i class="fa fa-power-off" aria-hidden="true"></i>&nbsp;Logout</a></li>
                                </ul>
                            </div>
                            <!-- /.navbar-collapse -->
                        </nav>

                        <div class="profile">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="profile-bg text-center">
                                    <%foreach (var data in displayAdminDataObj)
                                        { %>
                                    <img src="../<%= data.Image %>" class="img img-responsive img-rounded center-block" width="490" height="490" />
                                    <h3><%= data.FullName %></h3>
                                    <h5><%= data.Email %></h5>
                                    <%} %>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                                <div class="information-bg">
                                    <p class="validate text-center" runat="server" id="Caution" visible="true">These fields are sensitive please be calm and enter correct letters.</p>
                                    <div class="validate text-center" runat="server" id="Incorrect" visible="false">Old Username and Old Password1 is incorrect.</div>
                                    <div class="text-left msg-success success-update alert alert-success" style="display: none">Username and Password has been updated successfully.</div>
                                    <label>Old Username*</label><input type="text" placeholder="Enter Old Username" runat="server" id="UsernameOldText" />
                                    <label>Username*</label><input type="text" placeholder="umaranwar616" runat="server" id="UsernameText" />
                                    <label>Old Password1*</label><input type="password" placeholder="Enter Old Password1" runat="server" id="Pwd1OldText" />
                                    <label>Password1*</label><input type="password" placeholder="Enter New Password1" runat="server" id="Pwd1Text" />
                                    <label>Password2*</label><input type="password" placeholder="Enter New Password1" runat="server" id="Pwd2Text" />
                                    <div class="clearfix"></div>
                                    <p class="validate text-right"></p>
                                    <asp:Button ID="AdminPwdUpdate" runat="server" Text="Update Now" CssClass="btn center-block" OnClick="AdminPwdUpdate_Click" />
                                </div>
                            </div>
                        </div>
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
