<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisteredUsers.aspx.cs" Inherits="Ecommerce.Admin.RegisteredUsers" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

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
                        <h2 class="heading">Registered Users</h2>
                        <ol class="breadcrumb">
                            <li><a href="Dashboard.aspx">Home</a></li>
                            <li><a href="Contact.aspx">Registered Users</a></li>
                            <li class="active">Data</li>
                        </ol>
                        <!-- Breadcrumb -->

                        <div class="registered-users">
                            <div class="bg">
                                <div class="clearfix"></div>
                                <div class="table-responsive">
                                    <table class="table table-responsive table-bordered table-hover ">
                                        <% if (displayRegisterationDataObj.Count > 0)
                                            {
                                                int val = 1; %>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Register ID</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Email</th>
                                            <th>Title</th>
                                            <th>Contact</th>
                                            <th>Image</th>
                                        </tr>
                                        <% foreach (var data in displayRegisterationDataObj)
                                            { %>
                                        <tr>
                                            <td><%= val++ %></td>
                                            <td><%= data.RegisterID %></td>
                                            <td><%= data.FName %></td>
                                            <td><%= data.LName %></td>
                                            <td><%= data.Email %></td>
                                            <td><%= data.Title %></td>
                                            <td><%= data.Contact %></td>
                                            <% if (data.Image == null)
                                                { %>
                                            <td>
                                                <img src="../Images/avatar1.png" width="40" height="40" style="object-fit: cover" /></td>
                                            <%}
                                                else
                                                { %>
                                            <td>
                                                <img src="../<%= data.Image %>" width="40" height="40" style="object-fit: cover" /></td>
                                            <%} %>
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
