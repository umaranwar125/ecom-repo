<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="Ecommerce.Admin.Categories" %>

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
                        <h2 class="heading">Categories</h2>
                        <ol class="breadcrumb">
                            <li><a href="Dashboard.aspx">Home</a></li>
                            <li><a href="Comments.aspx">Categories</a></li>
                            <li class="active">Data</li>
                        </ol>
                        <!-- Breadcrumb -->

                        <div class="registered-users">
                            <div class="bg">
                                <div class="text-left msg-success success alert alert-success" style="display: none">Category has been added successfully.</div>
                                <div class="text-left msg-success success-update alert alert-success" style="display: none">Category has been updated successfully.</div>
                                <input type="button" value="Add Category" class="btn btn-default show" runat="server" id="AddCategory" />
                                <div class="hid" style="display: none" runat="server" id="InsertCategory">
                                    <label>Enter Category*</label>
                                    <input type="text" id="CatText" runat="server" />
                                    <p class="validate"></p>
                                    <asp:Button ID="AddCat" runat="server" Text="ADD" CssClass="btn btn-default add" OnClick="Button1_Click" />
                                </div>
                                <div runat="server" id="UpdateCategory" class="hid" visible="false">
                                    <label>Enter Category*</label>
                                    <input type="text" id="UpdCatText" runat="server" />
                                    <p class="validate"></p>
                                    <asp:Button ID="UpdateCat" runat="server" Text="Update" CssClass="btn btn-default add" OnClick="UpdateCat_Click" />
                                </div>
                                <div class="clearfix"></div>
                                <div class="table-responsive">
                                    <table class="table table-responsive table-bordered table-hover ">
                                        <% if (displayProductCategories.Count > 0)
                                            {
                                                int val = 1; %>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Update</th>
                                            <th>Category ID</th>
                                            <th>Category Name</th>
                                        </tr>
                                        <% foreach (var data in displayProductCategories)
                                            { %>
                                        <tr>
                                            <td><%= val++ %></td>
                                            <td><a href="Categories.aspx?Update-Category-ID=<%= data.CategoryID %>" class="btn btn-default">Update</a></td>
                                            <td><%= data.CategoryID %></td>
                                            <td><%= data.Category %></td>
                                        </tr>
                                        <%}
                                            }
                                            else
                                                Response.Write("<h5 class='text-center msg' >No Categories found.</h5>"); %>
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
