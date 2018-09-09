<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideNavigation.ascx.cs" Inherits="Ecommerce.Admin.User_Control_File.SideNavigation" %>

<nav>
    <h3><a href="Dashboard.aspx"><b>A</b>dmin <b>Panel</b></a></h3>
    <hr class="bottom" />
    <ul>
        <a href="Dashboard.aspx">
            <li runat="server" id="DashboardActive"><i class="fas fa-tachometer-alt"></i>&nbsp;&nbsp;Dashboard</li>
        </a>
        <a href="AdminProfile.aspx">
            <li runat="server" id="MyProfile"><i class="fa fa-user fa-5x border" aria-hidden="true"></i>&nbsp;&nbsp;My Profile</li>
        </a>
        <a href="Slider.aspx">
            <li runat="server" id="Slider"><i class="fas fa-images"></i>&nbsp;&nbsp;Main SLider</li>
        </a>
        <a href="Categories.aspx">
            <li runat="server" id="Categories"><i class="fas fa-list-ul"></i>&nbsp;&nbsp;Categories</li>
        </a>
        <a href="Contact.aspx">
            <li runat="server" id="Contact"><i class="fas fa-envelope"></i>&nbsp;&nbsp;Contact Us</li>
        </a>
        <a href="ContactVIAEmail.aspx">
            <li runat="server" id="ContactVIAEmail"><i class="fas fa-share-square"></i>&nbsp;&nbsp;Personal Contact</li>
        </a>
        <a href="Newsletter.aspx">
            <li runat="server" id="Newsletter"><i class="fas fa-newspaper"></i>&nbsp;&nbsp;Newsletter</li>
        </a>
        <a href="Products.aspx">
            <li runat="server" id="Products"><i class="fas fa-tshirt"></i>&nbsp;&nbsp;Products</li>
        </a>
        <a href="ProductImages.aspx">
            <li runat="server" id="ProductImages"><i class="fas fa-wallet"></i>&nbsp;&nbsp;Product Images</li>
        </a>
        <a href="RegisteredUsers.aspx">
            <li runat="server" id="Registeration"><i class="far fa-registered"></i>&nbsp;&nbsp;Registerations</li>
        </a>
         <a href="Shipping.aspx">
            <li runat="server" id="Shipping"><i class="fas fa-shipping-fast"></i>&nbsp;&nbsp;Shiiping Addresses</li>
        </a>
        <a href="Orders.aspx">
            <li runat="server" id="Orders"><i class="fas fa-shopping-bag"></i>&nbsp;&nbsp;Orders</li>
        </a>
        <a href="Reports.aspx">
            <li runat="server" id="Reports"><i class="fas fa-file-alt"></i>&nbsp;&nbsp;Reports</li>
        </a>
    </ul>
</nav>
