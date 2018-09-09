<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Ecommerce.Register" %>

<%@ Register Src="~/User Control Files/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/User Control Files/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/User Control Files/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration | Shopping Online</title>
    <meta name="description" content="Registration is necessary while purchasing a products." />
    <meta name="keywords" content="accoubt, register, shopping online, ecommerce" />
    <meta name="author" content="Umar Anwar" />
		<uc1:Header runat="server" ID="Header" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar  -->
		<nav class="navbar navbar-default navbar-fixed-top">
		  	<uc1:Navigation runat="server" ID="Navigation" />
		</nav>
		<!-- Navbar -->

		<!-- Login -->
		<div class="container">
			<div class="register">
				<h1 class="text-center"><b>R</b>EGISTER</h1>
				<hr class="bottom" />
                <p class="text-center red error" style="display: none">Email already exist, please try with another one!</p>
                <p class="text-center red error1" style="display: none">Email is not correct, please try with correct one!</p>
                <p class="text-center red validation-failed"></p>                   
				<div class="bg">
					<h6 class="info">Please enter information to create your account.</h6>
					<input type="text" class="form-control" placeholder="First Name" runat="server" id="fNameText" />
					<input type="text" class="form-control" placeholder="Last Name" runat="server" id="lNameText" />
					<input type="text" class="form-control" placeholder="Email" runat="server" id="emailText" />
					<input type="password" class="form-control" placeholder="Password" runat="server" id="pwdText" />
                    <asp:Button ID="UserRegisteration" runat="server" Text="REGISTER" CssClass="btn btn-primary center-block" OnClick="UserRegisteration_Click" />
					<h6 class="text-center">Already have an account? <a href="Login">Login</a></h6>
				</div>
			</div>
		</div>
		<!-- Login -->

		<!-- Footer -->
		<div class="footer">
			<uc1:Footer runat="server" ID="Footer" />
		</div>
		<!-- Footer -->
    </form>
</body>
</html>
