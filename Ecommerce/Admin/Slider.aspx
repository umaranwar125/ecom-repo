<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Slider.aspx.cs" Inherits="Ecommerce.Admin.Slider" %>

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
                                <p class="validate text-left" runat="server" id="ImageChoose" visible="false">*Image is required.</p>
                                <div class="text-left msg-success success alert alert-success" style="display: none">Slider has been added successfully.</div>
                                <div class="text-left msg-success success-update alert alert-success" style="display: none">Slider has been updated successfully.</div>
                                <div class="text-left msg-success success-delete alert alert-success" style="display: none">Slider has been deleted successfully.</div>
                                <input type="button" value="Add Slider" class="btn btn-default show" runat="server" id="AddSlider" />
                                <div class="hid" style="display: none" runat="server" id="InsertSlider">
                                    <label>Enter Title*</label>
                                    <input type="text" id="TitleText" runat="server" />
                                    <label>Choose Image*</label>
                                    <asp:FileUpload ID="ImageUpload" runat="server" />
                                    <label>Choose Button*</label>
                                    <input type="radio" class="Yes" id="yesBtn" runat="server" name="btn" value="Yes" checked="" />&nbsp;<span>Yes</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" class="No" id="noBtn" runat="server" name="btn" value="No" />&nbsp;<span>No</span>
                                    <div runat="server" class="Show">
                                        <label>Enter Button Text*</label>
                                        <input type="text" id="btnText" runat="server" />
                                        <label>Enter Button Link*</label>
                                        <input type="text" id="btnLink" runat="server" />
                                    </div>
                                    <p class="validate"></p>
                                    <asp:Button ID="AddSlide" runat="server" Text="ADD" CssClass="btn btn-default add" OnClick="AddSlide_Click" />
                                </div>
                                <div runat="server" id="UpdateSlider" class="hid" visible="false">
                                    <label>Enter Title*</label>
                                    <input type="text" id="updTitleText" runat="server" />
                                    <label>Choose Image*</label>
                                    <asp:FileUpload ID="updImageUpload" runat="server" />
                                    <label>Choose Button*</label>
                                    <input type="radio" class="Yes" id="updYesBtn" runat="server" name="btn" value="Yes" checked="" />&nbsp;<span>Yes</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" class="No" id="updNoBtn" runat="server" name="btn" value="No" />&nbsp;<span>No</span>
                                    <div runat="server" class="Show">
                                        <label>Enter Button Text*</label>
                                        <input type="text" id="updbtnText" runat="server" />
                                        <label>Enter Button Link*</label>
                                        <input type="text" id="updbtnLink" runat="server" />
                                    </div>
                                    <p class="validate"></p>
                                    <asp:Button ID="UpdateSlide" runat="server" Text="Update" CssClass="btn btn-default add" OnClick="UpdateSlide_Click" />
                                </div>
                                <div class="clearfix"></div>
                                <div class="table-responsive">
                                    <table class="table table-responsive table-bordered table-hover ">
                                        <% if (displaySliderobj.Count > 0)
                                            {
                                                int val = 1; %>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Update</th>
                                            <th>Delete</th>
                                            <th>Title</th>
                                            <th>Button</th>
                                            <th>Button Text</th>
                                            <th>Button Link</th>
                                            <th>Image</th>
                                        </tr>
                                        <% foreach (var data in displaySliderobj)
                                        { %>
                                        <tr>
                                            <td><%= val++ %></td>
                                            <td><a href="Slider.aspx?Update-Slider-ID=<%= data.SliderID %>" class="btn btn-default">Update</a></td>
                                            <td><a href="Slider.aspx?Delete-Slider-ID=<%= data.SliderID %>" class="btn btn-default">Delete</a></td>
                                            <td><%= data.Text %></td>
                                            <td><%= data.Button %></td>
                                            <td><%= data.BtnText %></td>
                                            <td><%= data.BtnLink %></td>
                                            <td>
                                                <img src="../<%= data.Image %>" width="80" height="80" style="object-fit: cover" /></td>
                                        </tr>
                                        <%}
                                            }
                                            else
                                                Response.Write("<h5 class='text-center msg' >No Slider found.</h5>"); %>
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
