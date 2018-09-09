using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BOL;

namespace Ecommerce
{
    public partial class Categories : System.Web.UI.Page
    {
        public decimal total, noOfPost, total_pages, startForm, pageID;
        public List<CategoriesBOL> displayProductCategories;
        public List<ProductBOL> displayProductforPageObj;
        public List<ProductBOL> displayProductobj;
        public List<ProductBOL> displayTotalProductsobj;
        public List<ProductBOL> displayFilterProductsobj;
        protected void Page_Load(object sender, EventArgs e)
        {
            displayCategories();
            displayProducts();
            displayProductsforPage();
            displayTotalProducts();

            if(Session["EmptyCart"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>CartError();</script>");
                Session.Remove("EmptyCart");
            }
        }

        // Filter for Products.
        protected void Filter_Click(object sender, EventArgs e)
        {
            ProductBLL ob = new ProductBLL();
            displayFilterProductsobj = ob.selectPriceForFilteration(Convert.ToInt32(Request.QueryString["Cat-ID"]), Convert.ToInt32(LowestPrice.Value), Convert.ToInt32(HighestPrice.Value));
            pagination.Visible = false;
            VisibleProducts.Visible = false;
            unVisibleProducts.Visible = true;
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
            displayProductobj = ob.selectAllProducts(Convert.ToInt32(Request.QueryString["Cat-ID"]));
        }

        // Products for Pagination
        public void displayProductsforPage()
        {
            ProductBLL ob = new ProductBLL();
            if (Request.QueryString["Page"] == null)
                pageID = 1;
            else
                pageID = Convert.ToDecimal(Request.QueryString["Page"]);
            total = displayProductobj.Count;
            noOfPost = 9;
            total_pages = Math.Ceiling(total / noOfPost);
            startForm = (pageID - 1) * noOfPost;
            displayProductforPageObj = ob.selectAllProductsForPage(Convert.ToInt32(Request.QueryString["Cat-ID"]), Convert.ToInt32(startForm), Convert.ToInt32(noOfPost));
        }

        // Count Total Products
        private void displayTotalProducts()
        {
            ProductBLL ob = new ProductBLL();
            displayTotalProductsobj = ob.selectTotalProducts(Convert.ToInt32(Request.QueryString["Cat-ID"]));
        }
    }
}