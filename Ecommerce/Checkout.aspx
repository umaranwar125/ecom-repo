<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Ecommerce.Checkout" %>

<%@ Register Src="~/User Control Files/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>
<%@ Register Src="~/User Control Files/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/User Control Files/Header.ascx" TagPrefix="uc1" TagName="Header" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Checkout | Shopping Online</title>
    <meta name="description" content="We offer different payment gateways in our checkout process by which you can easily pay." />
    <meta name="keywords" content="checkout, jazzcash, payment, payment gateway, shopping online, ecommerce" />
    <meta name="author" content="Umar Anwar" />
    <meta name="robots" content="noindex, nofollow" />
    <uc1:Header runat="server" ID="Header" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar  -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <uc1:Navigation runat="server" ID="Navigation" />
        </nav>
        <!-- Navbar -->

        <div class="container">
            <div class="checkout">
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-1">
                    <h4 class="text-center"><b>C</b>heckout <b>P</b>rocess</h4>
                    <hr class="bottom" />
                    <p class="text-center red" runat="server" id="EmailIncorrect" visible="false">Email address is not Correct, please try with correct one.</p>
                    <h5 class="text-left">Contact Information</h5>
                    <input type="text" placeholder="Email" class="form-control" runat="server" id="EmailTxtBox" />
                    <input type="text" placeholder="Mobile No" class="form-control" runat="server" id="MobileTxtBox" />
                    <h5 class="text-left ship">Shipping Address</h5>
                    <input type="text" placeholder="First Name" class="form-control" runat="server" id="FNameTxtBox" />
                    <input type="text" placeholder="Last Name" class="form-control" runat="server" id="LNameTxtBox" />
                    <input type="text" placeholder="Address" class="form-control" runat="server" id="AddressTxtBox" />
                    <input type="text" placeholder="City" class="form-control" runat="server" id="CityTxtBox" />
                    <input type="text" placeholder="Postal Code" class="form-control" runat="server" id="CodeTxtBox" />
                    <h5 class="text-left ship">Payement Method</h5>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 payement">
                        <input type="radio" value="Cash On Delivery" runat="server" id="Payment" name="payement" checked="" /><span>Cash On Delivery</span>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 payement">
                        <input type="radio" value="PayuMoney" runat="server" id="PayuMoney" class="disabled" checked="false" name="payement" /><span>PayuMoney</span>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 payement">
                        <input type="radio" value="Jazzcash" runat="server" id="Jazzcash" name="payement" /><span>Jazzcash</span>
                    </div>
                    <p class="text-right red ship-msg"></p>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 left">
                        <a href="Cart">< Return to cart</a>
                    </div>

                    <input type="hidden" runat="server" id="key" name="key" value="gtkFFx" />
                    <input type="hidden" runat="server" id="salt" name="salt" value="eCwWELxi" />
                    <input type="hidden" runat="server" id="hash" name="hash" value="" />
                    <input type="hidden" runat="server" id="txnid" name="txnid" value="" />
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 right text-right">
                        <asp:Button ID="Confirm" runat="server" CssClass="btn btn-primary" Text="Confirm Order" OnClick="Confirm_Click" />
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-2">
                    <h4 class="text-center"><b>P</b>urchased <b>P</b>roducts</h4>
                    <hr class="bottom" />
                    <div class="cart">
                        <%foreach (var data in displayProductsInCartObj)
                            { %>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 text-left">
                                <img src="<%= data.PImage %>" alt=""><%= data.PName %>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 text-center">
                                <h6>QTY <b><%= data.PQuantity %></b></h6>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 text-right">
                                <h6>Rs. <b><%= data.PPrice * data.PQuantity %></b></h6>
                            </div>
                        </div>
                        <%} %>
                    </div>

                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 info">
                        <hr />
                        <div class="sub-total">
                            <h4 class="text-left">Subtotal</h4>
                            <% foreach (var data in displayTotalPriceObj)
                                { %>
                            <h5 class="text-right">Rs. <b><%= data.TotalPrice %></b></h5>
                            <%} %>
                        </div>
                        <br>
                        <div class="shipping">
                            <h4 class="text-left">Shipping</h4>
                            <% foreach (var data in displayTotalPriceObj)
                                {%>
                            <h5 class="text-right">Rs. <b><%= Price %></b></h5>
                            <%} %>
                        </div>
                        <hr />
                        <div class="total">
                            <h4 class="text-left">Total</h4>
                            <% foreach (var data in displayTotalPriceObj)
                                { %>
                            <h5 class="text-right">Rs. <b><%= data.TotalPrice + Price %></b></h5>
                            <%} %>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Footer -->
        <div class="footer">
            <uc1:Footer runat="server" ID="Footer" />
        </div>
        <!-- Footer -->
    </form>
</body>
</html>
