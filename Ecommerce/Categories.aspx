<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="Ecommerce.Categories" %>

<%@ Register Src="~/User Control Files/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/User Control Files/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/User Control Files/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>
<%@ Register Src="~/User Control Files/Socialicons.ascx" TagPrefix="uc1" TagName="Socialicons" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Categories | Shopping Online</title>
    <meta name="description" content="A list of categories which consist of related products that are available to purchase." />
    <meta name="keywords" content="categories, products, purchase, buy, shopping online, ecommerce" />
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

        <!-- Pills And Accessories -->
        <section id="pills-bg" style="margin-top: 75px; height: 100%">
            <div class="container-fluid">
                <div class="pills">
                <p class="text-center red CartError" style="display: none">Your Cart is empty, please add some products in your cart first.</p>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <ul class="nav nav-pills nav-stacked">
                            <% if (displayProductCategories.Count > 0)
                                {
                                    foreach (var data in displayProductCategories)
                                    { %>
                            <li role="presentation" class="<%= Convert.ToInt32(Request.QueryString["Cat-ID"]) == data.CategoryID ? "active" : "" %>"><a href="Categories.aspx?Cat-ID=<%= data.CategoryID %>"><%= data.Category %></a></li>
                            <% }
                                }
                                else
                                    Response.Write("<h5 class='text-center msg'>No categories found!</h5>"); %>
                        </ul>
                    </div>
                    <div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 col-2">
                    <p class="text-right red validation-failed validate"></p>
                        <hr class="top" />
                        <%foreach (var data in displayTotalProductsobj)
                            { %>
                        <div class="text-left total"><span>Total Products: <b><%= (displayFilterProductsobj == null) ? data.ProductID : displayFilterProductsobj.Count %></b></span></div>
                        <%} %>
                        <div class="text-right filter">
                            <span>Min</span>
                            <input type="text" placeholder="Rs." runat="server" id="LowestPrice" />
                            <span>Max</span>
                            <input type="text" placeholder="Rs." runat="server" id="HighestPrice" />
                            <asp:Button ID="Filter" runat="server" Text="Apply" CssClass="btn btn-primary" OnClick="Filter_Click" />
                        </div>
                        <hr class="botom" />

                        <!-- Products -->

                        <div id="unVisibleProducts" runat="server" visible="false">
                            <% if(displayFilterProductsobj.Count > 0)
                                { 
                                foreach (var data in displayFilterProductsobj)
                                { %>
                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 product">
                                <a href="Product.aspx?Product-ID=<%= data.ProductID %>">
                                    <img src="<%= data.Image %>" alt="" />
                                    <h4 class="text-center"><%= data.Name %></h4>
                                    <h6>Rs. <%= data.Price %></h6>
                                </a>
                            </div>
                            <%}}
                                else
                                   Response.Write("<h4 class='text-center msg'>Sorry! No products available to your matching!</h4>"); %>
                        </div>

                        <div id="VisibleProducts" runat="server">
                            <% if (displayProductforPageObj.Count > 0)
                                {
                                    foreach (var data in displayProductforPageObj)
                                    { %>
                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 product">
                                <a href="Product.aspx?Product-ID=<%= data.ProductID %>">
                                    <img src="<%= data.Image %>" alt="" />
                                    <h4 class="text-center"><%= data.Name %></h4>
                                    <h6>Rs. <%= data.Price %></h6>
                                </a>
                            </div>
                            <%}
                                }
                                else
                                    Response.Write("<h4 class='text-center msg'>No products available!</h4>"); %>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right" runat="server" id="pagination">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <%  for (int i = 1; i <= total_pages; i++)
                                { %>
                            <li class="<%= pageID == i ? "active" : "" %>"><a href="Categories.aspx?Cat-ID=<%= Request.QueryString["Cat-ID"] %>&Page=<% Response.Write(i); %>"><% Response.Write(i); %></a></li>
                            <%} %>
                        </ul>
                    </nav>
                </div>
            </div>
            </div>
        </section>
        <!-- Pills -->

        <!-- Social Icons -->
        <div class="icons">
            <uc1:Socialicons runat="server" ID="Socialicons" />
        </div>
        <!-- Social Icons -->

        <!-- Footer -->
        <div class="footer" style="margin-top: 50px;">
            <uc1:Footer runat="server" ID="Footer" />
        </div>
        <!-- Footer -->
    </form>
</body>
</html>
