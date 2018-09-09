<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Newsletter.aspx.cs" Inherits="Ecommerce.Admin.Newsletter" %>

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
                        <h2 class="heading">Newsletter</h2>
                        <ol class="breadcrumb">
                            <li><a href="Dashboard.aspx">Home</a></li>
                            <li><a href="Contact.aspx">Newsletter</a></li>
                            <li class="active">Data</li>
                        </ol>
                        <!-- Breadcrumb -->

                        <div class="registered-users">
                            <div class="bg">
                                <div class="text-left msg-success success alert alert-success" style="display: none">Message has been sent successfully.</div>
                                <div class="text-left msg-success success-delete alert alert-success" style="display: none">Newsletter has been deleted successfully.</div>
                                <input type="button" value="Add Message" class="btn btn-default show" runat="server" id="AddMessage" />
                                <div class="hid" style="display: none">
                                    <label>Enter Subject*</label>
                                    <input type="text" runat="server" id="SubjectText" />
                                    <label>Enter Message*</label>
                                    <textarea id="MsgText" runat="server" style="height: 80px"></textarea>
                                    <p class="validate"></p>
                                    <asp:Button ID="AddMsg" runat="server" Text="SUBMIT" CssClass="btn btn-default add" OnClick="AddMsg_Click" />
                                </div>
                                <div class="clearfix"></div>
                                <div class="table-responsive">
                                    <table class="table table-responsive table-bordered table-hover">
                                        <% if (displayNewsletterObj.Count > 0)
                                            {
                                                int val = 1; %>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Delete</th>
                                            <th>Newsletter ID</th>
                                            <th>Email</th>
                                        </tr>
                                        <% foreach (var data in displayNewsletterObj)
                                            { %>
                                        <tr>
                                            <td><%= val++ %></td>
                                            <td><a href="Newsletter.aspx?Delete-Newsletter-ID=<%= data.ID %>" class="btn btn-default">Delete</a></td>
                                            <td><%= data.ID %></td>
                                            <td><%= data.Email %></td>
                                        </tr>
                                        <%}
                                            }
                                            else
                                                Response.Write("<h5 class='text-center msg' >No Newsletter found.</h5>"); %>
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
