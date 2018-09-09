<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="Ecommerce.Admin.Orders" %>

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
                        <h2 class="heading">Product Orders</h2>
                        <ol class="breadcrumb">
                            <li><a href="Dashboard.aspx">Home</a></li>
                            <li><a href="Comments.aspx">Orders</a></li>
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
                                        <input type="text" id="SearchText" runat="server" placeholder="Search by Register ID" style="width: 50%; margin-top: 5px;" />
                                        <asp:Button ID="SearchOrders" runat="server" Text="Search" CssClass="btn btn-default add" OnClick="SearchOrders_Click" />
                                    </div>
                                </div>
                                <div class="text-left msg-success success-update alert alert-success" style="display: none">Order has been approved successfully.</div>
                                <div class="clearfix"></div>
                                <div class="table-responsive" runat="server" id="Real" visible="true">
                                    <table class="table table-responsive table-bordered table-hover ">
                                        <% if (displayOrdersObj.Count > 0)
                                            {
                                                int val = 1; %>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Print</th>
                                            <th>Approve/Pending</th>
                                            <th>Status</th>
                                            <th>Payment Status</th>
                                            <th>IP Address</th>
                                            <th>Order ID</th>
                                            <th>Shipping ID</th>
                                            <th>Register ID</th>
                                            <th>Product ID</th>
                                            <th>Quantity</th>
                                            <th>Size</th>
                                            <th>Payment Method</th>
                                            <th>Time</th>
                                        </tr>
                                        <% foreach (var data in displayOrdersObj)
                                        { %>
                                        <tr>
                                            <td><%= val++ %></td>
                                            <%if (data.Status == "Pending")
                                                { %>
                                            <td><a href="OrderInvoice.aspx?Print=<%= data.OrderID %>" class="btn btn-default disabled">Print</a></td>
                                            <%}
                                            else
                                            { %>
                                            <td><a href="OrderInvoice.aspx?Print=<%= data.OrderID %>" class="btn btn-default">Print</a></td>
                                            <%} %>
                                            <%if (data.PaymentMethod == "PayuMoney" && data.PaymentStatus == "NotReceived")
                                                { %>
                                            <td><a href="Orders.aspx?Approve-Order=<%= data.OrderID %>" class="btn btn-default disabled">Approve</a></td>
                                            <%}
                                            else if (data.Status == "Approved")
                                            { %>
                                            <td><a href="Orders.aspx?Approve-Order=<%= data.OrderID %>" class="btn btn-default disabled">Approve</a></td>
                                            <%}
                                            else if (data.PaymentMethod == "Jazzcash" && data.PaymentStatus == "NotReceived")
                                            { %>
                                            <td><a href="Orders.aspx?Approve-Order=<%= data.OrderID %>" class="btn btn-default disabled">Approve</a></td>
                                            <% }
                                            else
                                            {%>
                                            <td><a href="Orders.aspx?Approve-Order=<%= data.OrderID %>" class="btn btn-default">Approve</a></td>
                                            <%} %>
                                            <%if (data.Status == "Pending")
                                            { %>
                                            <td style="color: red"><%= data.Status %></td>
                                            <%}
                                            else
                                            { %>
                                            <td style="color: green"><%= data.Status %></td>
                                            <%} %>
                                            <% if (data.PaymentStatus == "NotReceived")
                                            {%>
                                            <td style="color: red"><%= data.PaymentStatus %></td>
                                            <%}
                                            else
                                            { %>
                                            <td style="color: green"><%= data.PaymentStatus %></td>
                                            <%} %>
                                            <td><%= data.IpAddress %></td>
                                            <td><%= data.OrderID %></td>
                                            <td><%= data.ShippingID %></td>
                                            <td><%= data.RegisterID %></td>
                                            <td><%= data.ProductID %></td>
                                            <td><%= data.Quantity %></td>
                                            <td><%= data.Size %></td>
                                            <td><%= data.PaymentMethod %></td>
                                            <td><%= data.Time %></td>
                                        </tr>
                                        <%}
                                            }
                                            else
                                                Response.Write("<h5 class='text-center msg' >No Orders found.</h5>"); %>
                                    </table>
                                    <!-- Table -->
                                </div>
                                <!-- Table Responsive -->

                                <div class="table-responsive" runat="server" id="Alternate" visible="false">
                                    <table class="table table-responsive table-bordered table-hover ">
                                        <% if (displaySearchedOrdersObj.Count > 0)
                                            {
                                                int val = 1; %>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Print</th>
                                            <th>Approve/Pending</th>
                                            <th>Status</th>
                                            <th>Payment Status</th>
                                            <th>IP Address</th>
                                            <th>Order ID</th>
                                            <th>Shipping ID</th>
                                            <th>Register ID</th>
                                            <th>Product ID</th>
                                            <th>Quantity</th>
                                            <th>Size</th>
                                            <th>Payment Method</th>
                                            <th>Time</th>
                                        </tr>
                                        <% foreach (var data in displaySearchedOrdersObj)
                                            { %>
                                        <tr>
                                            <td><%= val++ %></td>
                                            <%if (data.Status == "Pending")
                                                { %>
                                            <td><a href="OrderInvoice.aspx?Print=<%= data.OrderID %>" class="btn btn-default disabled">Print</a></td>
                                            <%}
                                            else
                                            { %>
                                            <td><a href="OrderInvoice.aspx?Print=<%= data.OrderID %>" class="btn btn-default">Print</a></td>
                                            <%} %>
                                            <%if (data.PaymentMethod == "PayuMoney" && data.PaymentStatus == "NotReceived")
                                                { %>
                                            <td><a href="Orders.aspx?Approve-Order=<%= data.OrderID %>" class="btn btn-default disabled">Approve</a></td>
                                            <%}
                                            else if (data.Status == "Approved")
                                            { %>
                                            <td><a href="Orders.aspx?Approve-Order=<%= data.OrderID %>" class="btn btn-default disabled">Approve</a></td>
                                            <%}
                                            else if (data.PaymentMethod == "Jazzcash" && data.PaymentStatus == "NotReceived")
                                            { %>
                                            <td><a href="Orders.aspx?Approve-Order=<%= data.OrderID %>" class="btn btn-default disabled">Approve</a></td>
                                            <% }
                                            else
                                            {%>
                                            <td><a href="Orders.aspx?Approve-Order=<%= data.OrderID %>" class="btn btn-default">Approve</a></td>
                                            <%} %>
                                            <%if (data.Status == "Pending")
                                            { %>
                                            <td style="color: red"><%= data.Status %></td>
                                            <%}
                                            else
                                            { %>
                                            <td style="color: green"><%= data.Status %></td>
                                            <%} %>
                                            <% if (data.PaymentStatus == "NotReceived")
                                            {%>
                                            <td style="color: red"><%= data.PaymentStatus %></td>
                                            <%}
                                            else
                                            { %>
                                            <td style="color: green"><%= data.PaymentStatus %></td>
                                            <%} %>
                                            <td><%= data.IpAddress %></td>
                                            <td><%= data.OrderID %></td>
                                            <td><%= data.ShippingID %></td>
                                            <td><%= data.RegisterID %></td>
                                            <td><%= data.ProductID %></td>
                                            <td><%= data.Quantity %></td>
                                            <td><%= data.Size %></td>
                                            <td><%= data.PaymentMethod %></td>
                                            <td><%= data.Time %></td>
                                        </tr>
                                        <%}
                                            }
                                            else
                                                Response.Write("<h5 class='text-center msg' >Sorry! No Orders found. <a href='Orders.aspx'>Go back</a></h5>"); %>
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
