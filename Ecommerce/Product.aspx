<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Ecommerce.Product" %>

<%@ Register Src="~/User Control Files/Socialicons.ascx" TagPrefix="uc1" TagName="Socialicons" %>
<%@ Register Src="~/User Control Files/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/User Control Files/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/User Control Files/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Products | Shopping Online</title>
    <meta name="description" content="We provide alot of different products on discount to our customers." />
    <meta name="keywords" content="categories, products, discount, quality, shopping online, ecommerce" />
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

        <!-- Product Purchase -->
        <div class="product-added container" style="display: none">
            <p class="text-center">Product has been added to the Cart.</p>
            <div class="text-center"><a href="Cart" class="btn btn-primary">GO TO CART</a></div>
        </div>  
        <div class="container">
            <div class="product-purchase">
                <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5 col-1">
                    <!-- Button trigger modal -->
                    <% foreach (var data in displayProductDetailsObj)
                        {%>
                    <a href="<%= data.Image %>"><img src="<%= data.Image %>" alt="" id="expandedImg" class="center-block" /></a>
                    <%}%>
                        <div class="row">
                        <% foreach (var data in displayProductImagesObj)
                            { %>
                        <div class="col-xs-6 col-sm-4 col-md-4 col-lg-4 column">
                            <a href="<%= data.Image %>"><img src="<%= data.Image %>" alt="Nature" /></a>
                        </div>
                        <%} %>
                    </div>
                    <!-- Modal -->
                </div>
                <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7 col-2">
                    <% foreach (var data in displayProductDetailsObj)
                        {
                            string name = data.Name; %>
                    <h3 class="text-left"><%= data.Name %></h3>
                    <h5>RS. <%= data.Price %> &nbsp;&nbsp;&nbsp;&nbsp; <del><% if (data.OldPrice == 0) { Response.Write(""); } else { Response.Write("Rs. " + data.OldPrice); }%></del></h5>
                    <%if(data.CategoryID == 5 || data.CategoryID == 6) { %>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3 text-left" style="margin-left: -15px">
                        <span>Size</span>
                         <asp:DropDownList ID="Size" runat="server">
                            <asp:ListItem Value="Small"></asp:ListItem>
                            <asp:ListItem Value="Medium"></asp:ListItem>
                            <asp:ListItem Value="Large"></asp:ListItem>
                            <asp:ListItem Value="X-large"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <%} }%>
                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3 text-left" style="margin-left: -15px">
                        <span>Quanitity</span>
                        <asp:DropDownList ID="Quantity" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin-left: -15px">
                        <asp:Button ID="Cart" runat="server" Text="ADD TO CART" CssClass="btn btn-primary" OnClick="Cart_Click" />
                        <a href="Categories.aspx?Cat-ID=12" class="btn btn-primary">CONTINUE SHOPPING</a>
                    </div>
                </div>
                <div class="pills">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 other col-2">
                        <h3 class="text-left">You might also like</h3>
                        <% if (displaySimilarProductsObj.Count > 0)
                            {
                                foreach (var data in displaySimilarProductsObj)
                                {
                                    if (data.ProductID != Convert.ToInt32(Request.QueryString["Product-ID"]))
                                    { %>
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3 product">
                            <a href="Product.aspx?Product-ID=<%= data.ProductID %>">
                                <img src="<%= data.Image %>" alt="" />
                                <h4 class="text-center"><%= data.Name %></h4>
                                <h6>Rs. <%= data.Price %></h6>
                            </a>
                        </div>
                        <%}}}
                            else
                                Response.Write("<h5 class='text-center msg'>No similar products are available.</h5>");
                        %>
                    </div>
                </div>
            </div>
        </div>
        <!-- About US -->

        <!-- Social Icons -->
        <div class="icons">
            <uc1:Socialicons runat="server" ID="Socialicons" />
        </div>
        <!-- Social Icons -->

        <!-- Footer -->
        <div class="footer">
            <uc1:Footer runat="server" ID="Footer" />
        </div>
        <!-- Footer -->
    </form>
</body>
</html>
