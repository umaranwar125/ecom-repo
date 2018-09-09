<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Ecommerce.Admin.Contact" %>

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
                            <li><a href="Contact.aspx">Contact</a></li>
                            <li class="active">Data</li>
                        </ol>
                        <!-- Breadcrumb -->

                        <div class="registered-users">
                            <div class="bg">
                                <div class="text-left msg-success success-delete alert alert-success" style="display: none">Contact has been deleted successfully.</div>
                                <div class="clearfix"></div>
                                <div class="table-responsive">
                                    <table class="table table-responsive table-bordered table-hover ">
                                        <% if (displayContactObj.Count > 0)
                                            {
                                                int val = 1; %>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Delete</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Message</th>
                                        </tr>
                                        <% foreach (var data in displayContactObj)
                                            { %>
                                        <tr>
                                            <td><%= val++ %></td>
                                            <td><a href="Contact.aspx?Delete-Contact-ID=<%= data.ContactID %>" class="btn btn-default">Delete</a></td>
                                            <td><%= data.Name %></td>
                                            <td><%= data.Email %></td>
                                            <td><%= data.Message %></td>
                                        </tr>
                                        <%}
                                            }
                                            else
                                                Response.Write("<h5 class='text-center msg' >No Contacts found.</h5>"); %>
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
