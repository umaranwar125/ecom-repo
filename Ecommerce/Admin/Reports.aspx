<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Ecommerce.Admin.Reports" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register Src="~/Admin/User Control File/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Admin/User Control File/SideNavigation.ascx" TagPrefix="uc1" TagName="SideNavigation" %>
<%@ Register Src="~/Admin/User Control File/TopNavigation.ascx" TagPrefix="uc1" TagName="TopNavigation" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel | Shopping Online</title>
    <script type="text/javascript" src="../crystalreportviewers13/js/crviewer/crv.js"></script>
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
                        <h2 class="heading">Reports</h2>
                        <ol class="breadcrumb">
                            <li><a href="Dashboard.aspx">Home</a></li>
                            <li><a href="Reports.aspx">Reports</a></li>
                            <li class="active">Data</li>
                        </ol>
                        <!-- Breadcrumb -->

                        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" CssClass="" ReportSourceID="CrystalReportSource1" EnableTheming="True" HasRefreshButton="True" ToolbarStyle-BackColor="White" ToolbarStyle-BorderColor="White" ToolbarStyle-BorderStyle="Ridge" ToolbarStyle-BorderWidth="2px" ToolbarStyle-CssClass="crtoolbar1" ToolPanelView="None" />
                        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                            <Report FileName="Crystal Reports\OrdersStatus.rpt">
                            </Report>
                        </CR:CrystalReportSource>
                    </div>
                    <!-- Second Column -->
                </div>
                <!-- Row  -->
            </div>
            <!-- Container-Fluid -->
        </div>
    </form>
</body>
</html>
