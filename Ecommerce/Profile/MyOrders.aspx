<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyOrders.aspx.cs" Inherits="Ecommerce.Profile.MyOrders" %>

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

                <!-- profile -->
                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                    <uc1:SideProfile runat="server" ID="SideProfile" />
                </div>
                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">Orders</div>
                        <div class="panel-body">
                            <% if (displayOrderObj.Count > 0)
                                {
                                    int i = 1; %>
                            <div class="table-responsive">
                                <table class="table table-hover table-striped table-bordered">
                                    <tr>
                                        <th>S.No</th>
                                        <th>Order ID</th>
                                        <th>Status</th>
                                        <th>Image</th>
                                        <th>Product</th>
                                        <th>Size</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                    </tr>
                                    <% foreach (var data in displayOrderObj)
                                        {
                                            BLL.OrderPlacementBLL ob = new BLL.OrderPlacementBLL();
                                            displayProductObj = ob.selectProductDetailsForProfile(data.ProductID);
                                            foreach (var data1 in displayProductObj)
                                            {%>
                                    <tr>
                                        <td><%= i++ %></td>
                                        <td><%= data.OrderID %></td>
                                        <%if (data.Status == "Pending") { %>
                                        <td style="color: red"><%= data.Status %></td>
                                        <%} else { %>
                                        <td style="color: green"><%= data.Status %></td>
                                        <%} %>
                                        <td><img src="../<%= data1.Image %>" /></td>
                                        <td><%= data1.Name  %></td>
                                        <td><%= data.Size %></td>
                                        <td><%= data.Quantity %></td>
                                        <td>Rs. <%= data.Quantity * data1.Price %></td>
                                    </tr>
                                    <%}
                                    } %>
                                </table>
                            </div>
                            <%}else
                                Response.Write("<h4 class='text-center msg'>You haven't order any product yet.</h4>"); %>
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
