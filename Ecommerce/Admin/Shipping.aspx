<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shipping.aspx.cs" Inherits="Ecommerce.Admin.Shipping" %>

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
                        <h2 class="heading">Shipping Adresses</h2>
                        <ol class="breadcrumb">
                            <li><a href="Dashboard.aspx">Home</a></li>
                            <li><a href="Shipping.aspx">Shipping Address</a></li>
                            <li class="active">Data</li>
                        </ol>
                        <!-- Breadcrumb -->

                        <div class="registered-users">
                            <div class="bg">
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pull-left">
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-right" style="right: -13px">
                                    <div class="filter">
                                        <p class="validate"></p>
                                        <input type="text" id="SearchText" runat="server" placeholder="Search by Shipping ID" style="width: 50%; margin-top: 5px;" />
                                        <asp:Button ID="SearchShipping" runat="server" Text="Search" CssClass="btn btn-default add" OnClick="SearchShipping_Click" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="table-responsive" runat="server" id="real" visible="true">
                                    <table class="table table-responsive table-bordered table-hover ">
                                        <% if (displayAllShippingAddressObj.Count > 0)
                                            {
                                                int val = 1; %>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Shipping ID</th>
                                            <th>Register ID</th>
                                            <th>Email</th>
                                            <th>Mobile</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Address</th>
                                            <th>City</th>
                                            <th>Postal Code</th>
                                            <th>Total Price</th>
                                            <th>Shipping Charges</th>
                                        </tr>
                                        <% foreach (var data in displayAllShippingAddressObj)
                                            { %>
                                        <tr>
                                            <td><%= val++ %></td>
                                            <td><%= data.ShippingID %></td>
                                            <td><%= data.RegisterID %></td>
                                            <td><%= data.Email %></td>
                                            <td><%= data.Mobile %></td>
                                            <td><%= data.FName %></td>
                                            <td><%= data.LName %></td>
                                            <td><%= data.Address %></td>
                                            <td><%= data.City %></td>
                                            <td><%= data.PostalCode %></td>
                                            <td><%= data.Price %></td>
                                            <td><%= data.ShippingCharges %></td>
                                        </tr>
                                        <%}
                                            }
                                            else
                                                Response.Write("<h5 class='text-center msg' >No Shipping Address found.</h5>"); %>
                                    </table>
                                    <!-- Table -->
                                </div>
                                <!-- Table Responsive -->

                                <div class="table-responsive" runat="server" id="Alternate" visible="false">
                                    <table class="table table-responsive table-bordered table-hover ">
                                        <% if (displaySearchedShippingAddressObj.Count > 0)
                                            {
                                                int val = 1; %>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Shipping ID</th>
                                            <th>Register ID</th>
                                            <th>Email</th>
                                            <th>Mobile</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Address</th>
                                            <th>City</th>
                                            <th>Postal Code</th>
                                            <th>Total Price</th>
                                            <th>Shipping Charges</th>
                                        </tr>
                                        <% foreach (var data in displaySearchedShippingAddressObj)
                                            { %>
                                        <tr>
                                            <td><%= val++ %></td>
                                            <td><%= data.ShippingID %></td>
                                            <td><%= data.RegisterID %></td>
                                            <td><%= data.Email %></td>
                                            <td><%= data.Mobile %></td>
                                            <td><%= data.FName %></td>
                                            <td><%= data.LName %></td>
                                            <td><%= data.Address %></td>
                                            <td><%= data.City %></td>
                                            <td><%= data.PostalCode %></td>
                                            <td><%= data.Price %></td>
                                            <td><%= data.ShippingCharges %></td>
                                        </tr>
                                        <%}
                                            }
                                            else
                                                Response.Write("<h5 class='text-center msg' >Sorry! No Address found. <a href='Shipping.aspx'>Go back</a></h5>"); %>
                                    </table>
                                    <!-- Table -->
                                </div>
                                <!-- Table Responsive -->
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
