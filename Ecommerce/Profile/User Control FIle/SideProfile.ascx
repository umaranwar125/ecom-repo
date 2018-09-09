<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideProfile.ascx.cs" Inherits="Ecommerce.User_Control_Files.SideProfile" %>

<div class="panel panel-default">
    <div class="panel-heading">Profile</div>
    <div class="panel-body">
        <div class="Profile-bg">
            <% foreach (var data in displayRegisterationDataObj)
                {
                    if (data.Image == null && data.Title == null)
                    {  %>
            <p class="red text-center" style="padding-top: 15px;">Please! Update your profile.</p>
            <%} %>
            <img src="../<%= data.Image %>" alt="">
            <h3><%= data.FName + " " + data.LName %></h3>
            <h5><%= data.Title %></h5>
            <%} %>
        </div>
    </div>
</div>
