<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SecondaryNavigation.ascx.cs" Inherits="Ecommerce.Profile.User_Control_FIle.SecondaryNavigation" %>

<nav class="navbar navbar-default">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>

        <a class="navbar-brand" href="../Profile/User_Profile"><b>Umar Anwar</b>'s Profile</a>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
        <ul class="nav navbar-nav navbar-right">
            <li runat="server" id="Profiles"><a href="../Profile/User_Profile"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;My Profile</a></li>
            <li runat="server" id="Orders"><a href="../Profile/User_Orders"><i class="fas fa-bookmark"></i>&nbsp;My Orders</a></li>
            <li runat="server" id="Edit"><a href="../Profile/Edit_Profile"><i class="fa fa-key" aria-hidden="true"></i>&nbsp;Edit Profile</a></li>
            <li><a href="../Logout.aspx"><i class="fa fa-power-off" aria-hidden="true"></i>&nbsp;Logout</a></li>
        </ul>
    </div>
    <!-- /.navbar-collapse -->
</nav>
