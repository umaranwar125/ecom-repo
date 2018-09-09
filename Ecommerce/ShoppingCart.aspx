<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="Ecommerce.ShoppingCart" %>

<%@ Register Src="~/User Control Files/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>
<%@ Register Src="~/User Control Files/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/User Control Files/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/User Control Files/Socialicons.ascx" TagPrefix="uc1" TagName="Socialicons" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shopping Cart | Shopping Online</title>
    <meta name="description" content="Shopping cart is same as the shopping bag in which you put all of your purchaed products." />
    <meta name="keywords" content="shopping cart, cart, shopping, shopping online, ecommerce" />
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

        <div class="product-added container" style="display: none; padding-top: 50px">
            <p class="text-center">Product has been successfully removed from your cart.</p>
        </div>  
        <div class="container">
            <div class="cart">
                <h1 class="text-center"><b>S</b>hopping <b>C</b>art</h1>
                <hr class="bottom" />
                <div class="table-responsive">
                    <% if (displayProductsInCartObj.Count > 0)
                        {
                            %>
                    <table class="table table-hover table-condensed">
                        <tr>
                            <th>S.No</th>
                            <th>Product</th>
                            <th>Size</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                        <% foreach (var data in displayProductsInCartObj)
                            {%>
                        <tr>
                            <td>1</td>
                            <td>
                                <div><img src="<%= data.PImage %>" alt="">&nbsp;&nbsp;<%= data.PName %></div>
                            </td>
                            <td><%= data.PSize %></td>
                            <td>Rs. <%= data.PPrice %></td>
                            <td><%= data.PQuantity %></td>
                            <td>Rs. <%= data.TotalPrice %></td>
                            <td style="font-size: 20px;"><a href="ShoppingCart.aspx?Product-del-ID=<%= data.ProductID %>">&times;</a></td>
                        </tr>
                        <%}  %>
                    </table>
                    
                </div>
                <div class="total">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-2">
                        <hr class="right" />
                        <% foreach (var data in displayTotalPriceObj)
                                 { %>
                        <h5 class="text-right">Subtotal: <b>Rs. <%= data.TotalPrice %></b></h5>
                        <%} %>
                        <hr class="right" />
                        <h6 class="text-right">Excluding Tax & Shipping</h6>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <hr />
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                        <a href="Categories.aspx?Cat-ID=12" class="btn btn-primary">CONTINUE SHOPPING</a>
                        <a href="Checkout" class="btn btn-primary">CHECKOUT</a>
                    </div>
                </div>
                <%}
                        else
                            Response.Write("<h4 class='text-center msg'>Your cart is empty.</h4>"); %>
            </div>
        </div>

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
