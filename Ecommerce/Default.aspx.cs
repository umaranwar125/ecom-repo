using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel.DataAnnotations;
using BLL;
using BOL;

namespace Ecommerce
{
    public partial class Default : System.Web.UI.Page
    {
        int val = 1;
        public List<CategoriesBOL> displayProductCategories;
        public List<ProductBOL> displayProductObj;
        public List<ProductBOL> displayFilterProductsobj;
        public List<ProductBOL> displayTotalProductsobj;
        public List<MainSliderBOL> displaySliderobj;
        NewsletterBLL obj = new NewsletterBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["OrderPlaced"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>OrderPlaced();</script>");
                Session.Remove("OrderPlaced");
            }

            if (Session["ShoppingLogin"] != null)
                Session.Remove("ShoppingLogin");
                if (Convert.ToInt32(Request.QueryString["Cat-ID"]) == 0)
                Response.Redirect("Default.aspx?Cat-ID=12");
            displayCategories();
            displaySlider();
            displayProducts();
            displayTotalProducts();
        }

        // Email validation
        public bool IsValidEmail(string source)
        {
            return new EmailAddressAttribute().IsValid(source);
        }

        // Newsletter
        protected void NewsletterBtn_Click(object sender, EventArgs e)
        {
            if (IsValidEmail(newsText.Value.ToString()))
            {
                if (obj.insertNewsletterData(newsText.Value.ToString()))
                    ClientScript.RegisterStartupScript(GetType(), "", "<script>Success();</script>");
            }
            else
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert('Email is not correct.');</script>");
        }

        // Slider
        private void displaySlider()
        {
            MainSliderBLL ob = new MainSliderBLL();
            displaySliderobj = ob.selectImageSlider();
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

        // Count Total Products
        private void displayTotalProducts()
        {
            ProductBLL ob = new ProductBLL();
            displayTotalProductsobj = ob.selectTotalProducts(Convert.ToInt32(Request.QueryString["Cat-ID"]));
        }

        protected void Filter_Click(object sender, EventArgs e)
        {
            ProductBLL ob = new ProductBLL();
            if(Convert.ToInt32(Request.QueryString["Cat-ID"]) == 0)
                displayFilterProductsobj = ob.selectPriceForFilteration(1, Convert.ToInt32(LowestPrice.Value), Convert.ToInt32(HighestPrice.Value));
            else
                displayFilterProductsobj = ob.selectPriceForFilteration(Convert.ToInt32(Request.QueryString["Cat-ID"]), Convert.ToInt32(LowestPrice.Value), Convert.ToInt32(HighestPrice.Value));
                VisibleProducts.Visible = false;
            unVisibleProducts.Visible = true;
        }
    }
}