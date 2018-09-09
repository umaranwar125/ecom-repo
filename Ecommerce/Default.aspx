<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ecommerce.Default" %>

<%@ Register Src="~/User Control Files/Socialicons.ascx" TagPrefix="uc1" TagName="Socialicons" %>
<%@ Register Src="~/User Control Files/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/User Control Files/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/User Control Files/Navigation.ascx" TagPrefix="uc1" TagName="Navigation" %>
<%@ Register Src="~/User Control Files/Chat.ascx" TagPrefix="uc1" TagName="Chat" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shopping Online</title>
    <meta name="description" content="Our website provides a quality and variety of products for our customers." />
    <meta name="keywords" content="shopping online, ecommerce, products, online" />
    <meta name="author" content="Umar Anwar" />
    <uc1:Header runat="server" ID="Header" />
</head>
<body>
    <script src="Script/wow.min.js"></script>
              <script>
              new WOW().init();
              </script>
    <form id="form1" runat="server">
        <!-- Navbar  -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <uc1:Navigation runat="server" ID="Navigation" />
        </nav>
        <!-- Navbar -->

        <% if(displaySliderobj.Count > 0)
            {
                int val = 1; %>
        <!--Carousel -->
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="5000">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <% foreach (var data in displaySliderobj)
                    { %>
                <li data-target="#carousel-example-generic" data-slide-to="0" class="<%= val == 1 ? "active" : "" %>"></li>
                <%val++;
                    } %>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <% val = 1;
                    foreach (var data in displaySliderobj) { %>
                <div class="item <%= (val == 1) ? "active" : "" %>">
                    <img src="<%= data.Image %>" alt="..." />
                    <div class="carousel-caption">
                        <h1 class="text-center animated bounce"><%= data.Text %></h1>
                        <% if(data.Button == "Yes")
                            { %>
                        <a href="<%= data.BtnLink %>" class="btn btn-primary"><%= data.BtnText %></a>
                        <%} %>
                    </div>
                </div>
                <%val++; } %>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!--Carousel -->
        <%} %>

        <!-- Newsletter -->
        <div class="newsletter">
            <center>			
                <p class="text-center green success" style="display: none; padding-top: 20px; margin-bottom: -20px;">You've joined successfully.</p>
                <p class="text-center red validation-failed1" style="color: red; padding-top: 20px; margin-bottom: -3px;"></p>
                <span>Join Our Newsletter</span>
	            <input type="text" placeholder="Email" runat="server" id="newsText" />
                <asp:Button ID="NewsletterBtn" runat="server" CssClass="btn btn-primary" Text="Join" OnClick="NewsletterBtn_Click"></asp:Button>
            </center>
        </div>
        <!-- Newsletter -->

        <!-- Pills And Accessories -->
        <section id="pills-bg">
            <div class="container-fluid">
                <div class="pills">
                    <h1 class="text-center wow bounce"><b>O</b>ur <b>P</b>roducts</h1>
                    <hr class="bottom" />
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 wow fadeInLeft">
                        <ul class="nav nav-pills nav-stacked">
                            <% if (displayProductCategories.Count > 0)
                                {
                                    foreach(var data in displayProductCategories) { %>
                            <li role="presentation" class="<%= Convert.ToInt32(Request.QueryString["Cat-ID"]) == data.CategoryID ? "active" : "" %>"><a href="Default.aspx?Cat-ID=<%= data.CategoryID %>" onclick="addAclass(this)"><%= data.Category %></a></li>
                            <% }}
                                else
                                   Response.Write("<h5 class='text-center'>No categories found!</h5>"); %>
                        </ul>
                    </div>
                    <div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 col-2">
                        <hr class="top" />
                        <p class="text-right red validation-failed validate" style="font-size: 10px"></p>
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
                            <% if (displayProductObj.Count > 0)
                                {
                                    foreach (var data in displayProductObj)
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

                        <% if(displayProductObj.Count >= 15)
                            { %>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                            <a href="Categories.aspx?Cat-ID=12" class="btn btn-primary see-more">See More</a>
                        </div>
                        <%} %>
                    </div>
                </div>
            </div>
        </section>
        <!-- Pills -->


        <!-- Testimonial -->
        <div class="test">
            <h1 class="text-center">Fall Sale</h1>
            <h4 class="text-center">Fall has come and gone. Warm up for winter.</h4>
            <div class="text-center">
                <a href="#" class="btn btn-primary">Winter Collection</a>
            </div>
        </div>
        <!-- Testimonial -->


        <!-- Customer Appreciation -->
        <div class="customers wow bounceIn">
            <div class="container">
                <h1 class="text-center"><b>C</b>ustomer <b>A</b>ppreciation</h1>
                <hr class="bottom" />
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-1">
                    <h1 class="text-left">How Our Client
                        <br />
                        Appreciate Our
                        <br />
                        Services</h1>
                    <hr class="col-1-bottom" />
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-2">
                    <h1 class="text-center">“</h1>
                    <!--Carousel -->
                    <div id="carousel-example-generic1" class="carousel slide" data-ride="carousel" data-interval="5000">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic1" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic1" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic1" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <p>
                                    Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model
				                	text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.
                                </p>
                                <div class="carousel-caption">
                                    <img src="Images/user-1.jpg" class="img-thumbnail" alt="">
                                    <h3>Umar Anwar</h3>

                                </div>
                            </div>

                            <div class="item">
                                <p>
                                    Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model
				                	text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.
                                </p>
                                <div class="carousel-caption">
                                    <img src="Images/user-2.jpg" class="img-thumbnail" alt="">
                                    <h3>Ayesha Khan</h3>
                                </div>
                            </div>

                            <div class="item">
                                <p>
                                    Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model
				                	text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.
                                </p>
                                <div class="carousel-caption">
                                    <img src="Images/user-3.jpg" class="img-thumbnail" alt="">
                                    <h3>Ali Hassan</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Carousel -->
                </div>
            </div>
        </div>
        <!-- Customer Appreciation -->


        <!-- Social Icons -->
        <div class="icons">
            <uc1:Socialicons runat="server" ID="Socialicons" />
        </div>
        <!-- Social Icons -->

        <!-- Footer -->
        <div class="footer" id="footer">
            <uc1:Footer runat="server" ID="Footer" />
        </div>
        <!-- Footer -->
    </form>
    <uc1:Chat runat="server" id="Chat" />
</body>
</html>
