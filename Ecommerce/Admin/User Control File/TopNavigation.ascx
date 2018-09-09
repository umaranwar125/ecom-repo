<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopNavigation.ascx.cs" Inherits="Ecommerce.Admin.User_Control_File.TopNavigation" %>
<div class="top-content">
    <div class="top-content">
        <div class="pull-left">
            <a href="javascript:void(0)" onclick="openNav();"><i class="fa fa-bars" aria-hidden="true"></i></a>
            <span class="glyphicon glyphicon-search"></span>&nbsp;<input type="text" placeholder="Search">
            <input type="submit" class="btn btn-primary" value="Go">
        </div>

        <!-- Notification -->
        <div class="pull-right">
            <li class="dropdown notification">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-bell"></i><span class="digit"><% Response.Write(displayProductsObj.Count); %></span></a>
                <ul class="dropdown-menu">
                    <h4 class="text-center">Notifications</h4>
                    <hr class="bottom">

                    <!-- Content 1 -->
                    <% foreach (var data in displayProductsObj)
                        {
                            BLL.RegisterBLL ob = new BLL.RegisterBLL();
                            displayUserDataObj = ob.selectRegisterationDataForNotification(data.RegisterID);
                            foreach (var data1 in displayUserDataObj)
                            {%>
                    <div class="content">
                        <a href="Orders.aspx">
                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                <% if (data1.Image == null)
                                    { %>
                                <img src="../Images/avatar1.png" width="50" height="50">
                                <%}else{ %>
                                <img src="../<%= data1.Image %>" width="50" height="50">
                                <%} %>
                            </div>
                            <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                                <% if(data.Quantity == 1) { %>
                                <p><span><%= data1.FName + " " + data1.LName %></span> Ordered <span><%= data.Quantity %></span> Product.</p>
                                <%}else { %>
                                <p><span><%= data1.FName + " " + data1.LName %></span> Ordered <span><%= data.Quantity %></span> Products.</p>
                                <%} %>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <hr style="border: 1px solid #d6dde5; margin-left: -15px; margin-right: -15px">
                            </div>
                        </a>
                    </div>
                    <%}
                    }%>
                </ul>
            </li>

            <!-- Message -->
            <li class="dropdown message">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-envelope"></i><span class="digit"><% Response.Write(displayContactObj.Count); %></span></a>
                <ul class="dropdown-menu">
                    <h4 class="text-center">Messages</h4>
                    <hr class="bottom">

                    <!-- Content 1 -->
                    <% foreach (var data in displayContactObj)
                        { %>
                    <a href="Contact.aspx">
                        <div class="content">
                            <h5 class="text-left" style="margin-top: 30px; letter-spacing: 1px"><%= data.Name %></h5>
                            <div class="clearfix"></div>
                            <div>
                                <h6><%= data.Message %></h6>
                            </div>
                            <hr style="border: 1px solid #d6dde5; margin-top: 0px; margin-bottom: 20px;">
                        </div>
                    </a>
                    <%} %>
                </ul>
            </li>

            <!-- Profile -->
            <li class="dropdown profile">
                <% foreach (var data in displayAdminDataObj)
                    { %>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                    <img src="../<%= data.Image %>">&nbsp;&nbsp;<h5><%= data.FullName %></h5>
                    &nbsp;<span class="caret"></span></a>
                <%} %>
                <ul class="dropdown-menu">
                    <li><a href="AdminProfile.aspx"><i class="fa fa-user fa-5x border" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;Profile</a></li>
                    <li><a href="Logout.aspx"><i class="fa fa-power-off" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;Logout</a></li>
                </ul>
            </li>
        </div>
    </div>
</div>
