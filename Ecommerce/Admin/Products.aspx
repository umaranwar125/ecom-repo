<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Ecommerce.Admin.Products" %>

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
                        <h2 class="heading">Products</h2>
                        <ol class="breadcrumb">
                            <li><a href="Dashboard.aspx">Home</a></li>
                            <li><a href="Products.aspx">Products</a></li>
                            <li class="active">Data</li>
                        </ol>
                        <!-- Breadcrumb -->

                        <div class="registered-users">
                            <div class="bg">
                                <p class="validate text-left" runat="server" id="ImageChoose" visible="false">*Image is required.</p>
                                <div class="text-left msg-success success alert alert-success" style="display: none">Product has been added successfully.</div>
                                <div class="text-left msg-success success-delete alert alert-success" style="display: none">Product has been deleted successfully.</div>
                                <div class="text-left msg-success success-update alert alert-success" style="display: none">Product has been updated successfully.</div>
                                <input type="button" value="Add Product" class="btn btn-default show" runat="server" id="AddProduct" />

                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 text-left" style="margin-left: -15px">
                                    <div class="hid" style="display: none" runat="server" id="InsertProduct">
                                        <label>Product Name*</label>
                                        <input type="text" id="NameText" runat="server" />
                                        <label>Select Category*</label>
                                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="false" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Category"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:myCon %>" SelectCommand="SELECT Category FROM Categories ORDER BY Category ASC"></asp:SqlDataSource>
                                        <label>Price*</label>
                                        <input type="text" id="PriceText" runat="server" />
                                        <label>Old Price*</label>
                                        <input type="text" id="OPriceText" runat="server" />
                                        <label>Choose Image*</label>
                                        <asp:FileUpload ID="Image" runat="server" />
                                        <p class="validate"></p>
                                        <asp:Button ID="AddPro" runat="server" Text="ADD" CssClass="btn btn-default add" OnClick="AddPro_Click" />
                                    </div>

                                    <div runat="server" id="UpdateProduct" class="hid" visible="false" style="margin-top: -20px;">
                                        <label>Product Name*</label>
                                        <input type="text" id="UpdNameText" runat="server" />
                                        <label>Select Category*</label>
                                        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="false" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Category"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:myCon %>" SelectCommand="SELECT Category FROM Categories ORDER BY Category ASC"></asp:SqlDataSource>
                                        <label>Price*</label>
                                        <input type="text" id="UpdPriceText" runat="server" />
                                        <label>Old Price*</label>
                                        <input type="text" id="UpdOPriceText" runat="server" />
                                        <label>Choose Image*</label>
                                        <asp:FileUpload ID="UpdImage" runat="server" />
                                        <p class="validate"></p>
                                        <asp:Button ID="UpdatePro" runat="server" Text="Update" CssClass="btn btn-default add" OnClick="UpdatePro_Click" />
                                    </div>
                                    <div runat="server" id="Categories" visible="true">
                                        <label>Select Category</label>
                                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Category"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myCon %>" SelectCommand="SELECT Category FROM Categories ORDER BY Category ASC"></asp:SqlDataSource>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 text-right" style="margin-top: -65px; right: -30px;">
                                    <div class="filter">
                                        <p class="validate"></p>
                                        <input type="text" id="SearchText" runat="server" placeholder="Search by Product Name" />
                                        <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="false" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Category"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:myCon %>" SelectCommand="SELECT Category FROM Categories ORDER BY Category ASC"></asp:SqlDataSource>
                                        <asp:Button ID="SearchProductImage" runat="server" Text="Search" CssClass="btn btn-default add" OnClick="SearchProductImage_Click" />
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                                <div class="table-responsive" runat="server" id="Real" visible="true">
                                    <table class="table table-responsive table-bordered table-hover ">
                                        <% if (displayProductsObj.Count > 0)
                                            {
                                                int val = 1; %>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Update</th>
                                            <th>Delete</th>
                                            <th>Category ID</th>
                                            <th>Product ID</th>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Old Price</th>
                                            <th>Image</th>
                                        </tr>
                                        <% foreach (var data in displayProductsObj)
                                            { %>
                                        <tr>
                                            <td><%= val++ %></td>
                                            <td><a href="Products.aspx?Update-Product-ID=<%= data.ProductID %>" class="btn btn-default update">Update</a></td>
                                            <td><a href="Products.aspx?Delete-Product-ID=<%= data.ProductID %>" class="btn btn-default">Delete</a></td>
                                            <td><%= data.CategoryID %></td>
                                            <td><%= data.ProductID %></td>
                                            <td><%= data.Name %></td>
                                            <td><%= data.Price %></td>
                                            <td><%= data.OldPrice %></td>
                                            <td>
                                                <img src="../<%= data.Image %>" width="40" height="40" style="object-fit: cover" /></td>
                                        </tr>
                                        <%}
                                            }
                                            else
                                                Response.Write("<h5 class='text-center msg' >No Products found.</h5>"); %>
                                    </table>
                                    <!-- Table -->
                                </div>
                                <!-- Table Responsive -->

                                <div class="table-responsive" runat="server" id="Alternate" visible="false">
                                    <table class="table table-responsive table-bordered table-hover ">
                                        <% if (displaySearchProductsObj.Count > 0)
                                            {
                                                int val = 1; %>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Update</th>
                                            <th>Delete</th>
                                            <th>Category ID</th>
                                            <th>Product ID</th>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Old Price</th>
                                            <th>Image</th>
                                        </tr>
                                        <% foreach (var data in displaySearchProductsObj)
                                            { %>
                                        <tr>
                                            <td><%= val++ %></td>
                                            <td><a href="Products.aspx?Update-Product-ID=<%= data.ProductID %>" class="btn btn-default update">Update</a></td>
                                            <td><a href="Products.aspx?Delete-Product-ID=<%= data.ProductID %>" class="btn btn-default">Delete</a></td>
                                            <td><%= data.CategoryID %></td>
                                            <td><%= data.ProductID %></td>
                                            <td><%= data.Name %></td>
                                            <td><%= data.Price %></td>
                                            <td><%= data.OldPrice %></td>
                                            <td>
                                                <img src="../<%= data.Image %>" width="40" height="40" style="object-fit: cover" /></td>
                                        </tr>
                                        <%}
                                            }
                                            else
                                                Response.Write("<h5 class='text-center msg' >Sorry! No Data found. <a href='Products.aspx'>Refresh Now</a></h5>"); %>
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
