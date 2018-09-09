<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductImages.aspx.cs" Inherits="Ecommerce.Admin.ProductImages" %>

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
                        <h2 class="heading">Product Images</h2>
                        <ol class="breadcrumb">
                            <li><a href="Dashboard.aspx">Home</a></li>
                            <li><a href="ProductImages.aspx">Product Images</a></li>
                            <li class="active">Data</li>
                        </ol>
                        <!-- Breadcrumb -->

                        <div class="registered-users">
                            <div class="bg">
                                <p class="validate text-left" runat="server" id="IDerror" visible="false">*Product ID you enetered is not available in Product List. See here <a href="Products.aspx">Products</a></p>
                                <p class="msg text-left" runat="server" id="NoData" visible="false">*No Data Found.</p>
                                <p class="validate text-left" runat="server" id="ImageChoose" visible="false">*Image is required.</p>
                                <div class="text-left msg-success success alert alert-success" style="display: none">Product Image has been added successfully.</div>
                                <div class="text-left msg-success success-delete alert alert-success" style="display: none">Image has been deleted successfully.</div>
                                <input type="button" value="Add Image" class="btn btn-default show" runat="server" id="AddImage" />
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-left" style="margin-left: -15px">
                                    <div class="hid text-left" style="display: none" runat="server" id="InsertImage">
                                        <label>Enter ProductID*</label>
                                        <input type="text" id="IDText" runat="server" />
                                        <label>Choose Image*</label>
                                        <asp:FileUpload ID="Image" runat="server" /><br />
                                        <p class="validate"></p>
                                        <asp:Button ID="AddImg" runat="server" Text="ADD" CssClass="btn btn-default add" OnClick="AddImg_Click" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-right" style="margin-top: -48px; right: -30px;">
                                    <div class="right">
                                        <p class="validate"></p>
                                        <input type="text" id="SearchText" runat="server" placeholder="Search by ID" />
                                        <asp:Button ID="SearchProduct" runat="server" Text="Search" CssClass="btn btn-default add" OnClick="SearchProduct_Click" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="table-responsive" runat="server" id="real" visible="true">
                                    <table class="table table-responsive table-bordered table-hover ">
                                        <% if (displayProductImagesObj.Count > 0)
                                            {
                                                int val = 1; %>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Delete</th>
                                            <th>Product ID</th>
                                            <th>Image</th>
                                        </tr>
                                        <% foreach (var data in displayProductImagesObj)
                                            { %>
                                        <tr>
                                            <td><%= val++ %></td>
                                            <td><a href="ProductImages.aspx?Delete-Image-ID=<%= data.ImageID %>" class="btn btn-default">Delete</a></td>
                                            <td><%= data.ProductID %></td>
                                            <td>
                                                <img src="../<%= data.Image %>" width="80" height="80" style="object-fit: cover" /></td>
                                        </tr>
                                        <%}
                                            }
                                            else
                                                Response.Write("<h5 class='text-center msg' >No Image found.</h5>"); %>
                                    </table>
                                    <!-- Table -->
                                </div>
                                <!-- Table Responsive -->

                                <div class="table-responsive" runat="server" id="Alternate" visible="false">
                                    <table class="table table-responsive table-bordered table-hover ">
                                        <%if (displaySearchedProductImagesObj.Count > 0)
                                            {
                                                int val = 1; %>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Delete</th>
                                            <th>Product ID</th>
                                            <th>Image</th>
                                        </tr>
                                        <% foreach (var data in displaySearchedProductImagesObj)
                                            { %>
                                        <tr>
                                            <td><%= val++ %></td>
                                            <td><a href="ProductImages.aspx?Delete-Image-ID=<%= data.ImageID %>" class="btn btn-default">Delete</a></td>
                                            <td><%= data.ProductID %></td>
                                            <td>
                                                <img src="../<%= data.Image %>" width="80" height="80" style="object-fit: cover" /></td>
                                        </tr>
                                        <%}
                                            }
                                            else
                                                Response.Write("<h5 class='text-center msg' >Sorry! No Data found. <a href='ProductImages.aspx'>Go back</a></h5>"); %>
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
