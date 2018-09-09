﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOL;
using BLL;

namespace Ecommerce.User_Control_Files
{
    public partial class Navigation : System.Web.UI.UserControl
    {
        int RegID;
        string ipaddress;
        public List<ProductBOL> displayProductObj;
        public List<CategoriesBOL> displayProductCategories;
        public List<RegisterBOL> DisplayUserName;
        public List<ShoppingCartBOL> displayTotalProductsFromCart;
        protected void Page_Load(object sender, EventArgs e)
        {
            displayCategories();
            displayProducts();
            totalProductsinShoppingCart();
            if (Session["userLoggedin"] != null)
            {
                DisplayUserData();
            }
            if (Request.Url.AbsolutePath.EndsWith("Default.aspx"))
                HomeActive.Attributes.Add("class", "active");
            else if (Request.Url.AbsolutePath.EndsWith("Contact-Us"))
                ContactActive.Attributes.Add("class", "active");
            else if (Request.Url.AbsolutePath.EndsWith("About"))
                AboutActive.Attributes.Add("class", "active");
            else if (Request.Url.AbsolutePath.EndsWith("Login"))
                LoginActive.Attributes.Add("class", "active");
        }

        private void getIP()
        {
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
        }

        private void DisplayUserData()
        {
            RegisterBLL obj = new RegisterBLL();
            obj.selectRegisterationID(Session["userLoggedin"].ToString());
            DisplayUserName = obj.selectRegisterationData(RegID);
        }

        // Categories
        private void displayCategories()
        {
            CategoriesBLL ob = new CategoriesBLL();
            displayProductCategories = ob.selectingCategories();
        }

        // Products
        private void displayProducts()
        {
            ProductBLL ob = new ProductBLL();
            displayProductObj = ob.selectAllProducts(Convert.ToInt32(Request.QueryString["Cat-ID"]));
        }

        private void totalProductsinShoppingCart()
        {
            ShoppingCartBLL ob = new ShoppingCartBLL();
            getIP();
            displayTotalProductsFromCart = ob.selectTotalProductsFromShoppingCart(ipaddress);
        }
    }
}