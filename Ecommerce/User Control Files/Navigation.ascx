<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navigation.ascx.cs" Inherits="Ecommerce.User_Control_Files.Navigation" %>

<div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="Default.aspx"><b>S</b>hopping <b>O</b>nline</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li runat="server" id="HomeActive"><a href="Default.aspx"><i class="fas fa-home"></i> Home</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-shopping-bag"></i> All Categories <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <% if (displayProductCategories.Count > 0)
                                {
                                    foreach(var data in displayProductCategories) { %>
                                        <li><a href="Categories.aspx?Cat-ID=<%= data.CategoryID %>"><%= data.Category %></a></li>
                            <% }}
                                else
                                   Response.Write("<h5 class='text-center'>No categories found!</h5>"); %>
                </ul>
            </li>
            <li runat="server" id="ContactActive"><a href="Contact-Us"><i class="fas fa-phone"></i> Contact Us</a></li>
            <li runat="server" id="AboutActive"><a href="About"><i class="fas fa-info"></i> About Us</a></li>

        </ul>
        <ul class="nav navbar-nav navbar-right">
            <% if (Session["userLoggedin"] != null)
                {%>
            <li class="dropdown profile">
                <% foreach (var data in DisplayUserName)
                    { %>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                    <img src="Images/avatar1.png" alt="profile_img" width="25"/>&nbsp;<%= data.FName + " " + data.LName %></a>
                <ul class="dropdown-menu">
                    <li><a href="Profile/User_Profile">My Profile</a></li>
                    <li><a href="Logout.aspx">Logout</a></li>
                </ul>
                <%} %>
            </li>
            <%}
            else
            {%>
            <li runat="server" id="LoginActive"><a href="Login"> Login <i class="fas fa-sign-in-alt"></i></a></li>
            <%} %>
            <li runat="server" id="CartActive"><a href="Cart"><i class="fas fa-shopping-cart"></i><span><%= displayTotalProductsFromCart.Count %></span></a></li>
        </ul>
    </div>
    <!-- /.navbar-collapse -->
</div>
<!-- /.container-fluid -->
