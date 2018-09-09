<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderInvoice.aspx.cs" Inherits="Ecommerce.Admin.OrderInvoice" %>

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
                                <div class="text-left msg-success success-update alert alert-success" style="display: none">Order has been approved successfully.</div>
                                <div class="clearfix"></div>
                                <asp:Button ID="DisplayOrder" runat="server" Text="Download Now" OnClick="DisplayOrder_Click" CssClass="btn btn-default" />
                                <a href="Orders.aspx" class="btn btn-defualt">Go back</a>
                                <asp:Panel ID="Panel1" runat="server">
                                    <div class="table-responsive" runat="server" id="Real" visible="true">
                                        <table class="table table-responsive table-bordered table-hover" border="1">
                                            <tr>
                                                <td colspan="6">
                                                    <h1 class="text-center">SHOPPING ONLINE</h1>
                                                </td>
                                            </tr>
                                            <tr>
                                                <%foreach (var data in displayOrderforPrintObj)
                                                    {%>
                                                <td colspan="6">
                                                    <br />
                                                    <h5 class="text-left">Order Date & Time: <b><%= data.Time %></b></h5>
                                                    <h5 class="text-left">Order ID: <b><%= data.OrderID %></b></h5>
                                                </td>
                                            </tr>
                                            <tr>

                                                <%
                                                    BLL.ShippingBLL ob = new BLL.ShippingBLL();
                                                    displayShippingforPrintObj = ob.searchSpecificShipping(data.ShippingID);
                                                    foreach (var data1 in displayShippingforPrintObj)
                                                    { %>
                                                <td colspan="3">
                                                    <h4 class="text-center"><b>Buyer Personal Information</b></h4>
                                                    <br />
                                                    <h5 class="text-left">Name: <b><%= data1.FName + " " + data1.LName %></b></h5>
                                                    <h5 class="text-left">Email: <b><%= data1.Email %></b></h5>
                                                    <h5 class="text-left">Mobile: <b><%= data1.Mobile %></b></h5>
                                                </td>
                                                <td colspan="3">
                                                    <h4 class="text-center"><b>Buyer Shipping Information</b></h4>
                                                    <br />
                                                    <h5 class="text-left">Postal Code: <b><%= data1.PostalCode %></b></h5>
                                                    <h5 class="text-left">City: <b><%= data1.City %></b></h5>
                                                    <h5 class="text-left">Address: <b><%= data1.Address %></b></h5>
                                                </td>
                                                <%}
                                                } %>
                                            </tr>
                                            <tr>
                                                <th>S.No</th>
                                                <th>Product</th>
                                                <th>Size</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Total Price</th>
                                            </tr>
                                            <%int i = 1;
                                                foreach (var data in displayOrderforPrintObj)
                                                {
                                                    BLL.ProductBLL ob = new BLL.ProductBLL();
                                                    displayProductforPrintObj = ob.selectProductDetails(data.ProductID);
                                                    foreach (var data1 in displayProductforPrintObj)
                                                    {%>
                                            <tr>
                                                <td><%= i++ %></td>
                                                <td><%= data1.Name %></td>
                                                <% if (data.Size == null)
                                                { %>
                                                <td>N/A</td>
                                                <%}
                                                else
                                                { %>
                                                <td><%= data.Size %></td>
                                                <%} %>
                                                <td><%= data1.Price %></td>
                                                <td><%= data.Quantity %></td>
                                                <td><%= data1.Price * data.Quantity %></td>
                                            </tr>
                                            <%}
                                            }%>
                                            <tr>
                                                <% foreach (var data in displayOrderforPrintObj)
                                                    {
                                                        BLL.ShippingBLL ob = new BLL.ShippingBLL();
                                                        displayShippingforPrintObj = ob.searchSpecificShipping(data.ShippingID);
                                                        foreach (var data1 in displayShippingforPrintObj)
                                                        {
                                                            BLL.ProductBLL ob1 = new BLL.ProductBLL();
                                                            displayProductforPrintObj = ob1.selectProductDetails(data.ProductID);
                                                            foreach (var data2 in displayProductforPrintObj)
                                                            { %>
                                                <td colspan="10">
                                                    <h4 class="text-right"><b>Shipping Charges:&nbsp; <%if (data.PaymentStatus == "Received")
          { %> 0 <%}
                                                                                                                                                  else
                                                                                                                                                  {%><%= data1.ShippingCharges %><%} %></b></h4>
                                                    <h3 class="text-right"><b>Grand Total: <%if (data.PaymentStatus == "Received")
          { %> 0 <%}
                                                                                                                                         else
                                                                                                                                         {%><%= data2.Price * data.Quantity + data1.ShippingCharges %><%} %></b></h3>
                                                    <p class="text-left">Disclaimer: In case you find selling price on this invoice to be more than mentiond on a product, then please directly contact us by visiting our website.</p>
                                                    <p class="text-left">This is a computer generated invoice and does not required a signature.</p>

                                                </td>
                                                <%}
                                                }
                                            } %>
                                            </tr>
                                        </table>
                                        <!-- Table -->
                                    </div>
                                    <!-- Table Responsive -->
                                </asp:Panel>
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
