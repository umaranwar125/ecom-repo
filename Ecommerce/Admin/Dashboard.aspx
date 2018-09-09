<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Ecommerce.Admin.Dashboard" %>

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
                        <h2 class="heading">Dashboard</h2>
                        <ol class="breadcrumb">
                            <li><a href="Dashboard.aspx">Home</a></li>
                            <li><a href="Dashboard.aspx">Dashboard</a></li>
                            <li class="active">Data</li>
                        </ol>
                        <!-- Breadcrumb -->

                        <!-- Statistic Reports -->
                        <div class="row">
                            <div class="statistic-report">
                                <!-- Column 1 -->
                                <div class="col-sm-12 col-sm-6 col-md-3 col-lg-3">
                                    <div class="panel panel-danger">
                                        <div class="panel-heading" style="background: white;">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <i class="fas fa-list-ul fa-5x border" aria-hidden="true"></i>
                                                </div>
                                                <div class="col-xs-9">
                                                    <% foreach (var data in displayTotalCategoriesObj)
                                                        { %>
                                                    <div class="text-right huge"><%= data.CategoryID %></div>
                                                    <%} %>
                                                    <div class="text-right text">Categories</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Column 2 -->
                                <div class="col-sm-12 col-sm-6 col-md-3 col-lg-3">
                                    <div class="panel panel-success">
                                        <div class="panel-heading" style="background: white;">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <i class="fas fa-envelope fa-5x border" aria-hidden="true"></i>
                                                </div>
                                                <div class="col-xs-9">
                                                    <% foreach (var data in displayTotalContactsObj)
                                                        { %>
                                                    <div class="text-right huge"><%= data.ContactID %></div>
                                                    <%} %>
                                                    <div class="text-right text">Contacts</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Column 3 -->
                                <div class="col-sm-12 col-sm-6 col-md-3 col-lg-3">
                                    <div class="panel panel-info">
                                        <div class="panel-heading" style="background: white;">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <i class="fas fa-newspaper fa-5x border" aria-hidden="true"></i>
                                                </div>
                                                <div class="col-xs-9">
                                                    <% foreach (var data in displayTotalNewsletterObj)
                                                        { %>
                                                    <div class="text-right huge"><%= data.ID %></div>
                                                    <%} %>
                                                    <div class="text-right text">Newsletter</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Column 4 -->
                                <div class="col-sm-12 col-sm-6 col-md-3 col-lg-3">
                                    <div class="panel panel-warning">
                                        <div class="panel-heading" style="background: white;">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <i class="fas fa-tshirt fa-5x border" aria-hidden="true"></i>
                                                </div>
                                                <div class="col-xs-9">
                                                    <% foreach (var data in displayTotalProductsObj)
                                                        { %>
                                                    <div class="text-right huge"><%= data.ProductID %></div>
                                                    <%} %>
                                                    <div class="text-right text">Products</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Column 4 -->
                                <div class="col-sm-12 col-sm-6 col-md-3 col-lg-3">
                                    <div class="panel panel-info">
                                        <div class="panel-heading" style="background: white;">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <i class="fas fa-wallet fa-5x border" aria-hidden="true"></i>
                                                </div>
                                                <div class="col-xs-9">
                                                    <% foreach (var data in displayTotalImagesObj)
                                                        { %>
                                                    <div class="text-right huge"><%= data.ImageID %></div>
                                                    <%} %>
                                                    <div class="text-right text">Images</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Column 5 -->
                                <div class="col-sm-12 col-sm-6 col-md-3 col-lg-3">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" style="background: white;">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <i class="fa fa-user-circle fa-5x border" aria-hidden="true"></i>
                                                </div>
                                                <div class="col-xs-9">
                                                    <% foreach (var data in displayTotalRegisterationObj)
                                                        { %>
                                                    <div class="text-right huge"><%= data.RegisterID %></div>
                                                    <%} %>
                                                    <div class="text-right text">Registeration</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Column 6 -->
                                <div class="col-sm-12 col-sm-6 col-md-3 col-lg-3">
                                    <div class="panel panel-danger">
                                        <div class="panel-heading" style="background: white;">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <i class="fas fa-shopping-bag fa-5x border" aria-hidden="true"></i>
                                                </div>
                                                <div class="col-xs-9">
                                                    <% foreach (var data in displayTotalOrdersObj)
                                                        { %>
                                                    <div class="text-right huge"><%= data.OrderID %></div>
                                                    <%} %>
                                                    <div class="text-right text">Orders</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Statistic Reports -->
                        </div>
                        <!-- Row -->
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
