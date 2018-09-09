using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BOL;

namespace Ecommerce.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        public List<CategoriesBOL> displayTotalCategoriesObj;
        public List<ContactsBOL> displayTotalContactsObj;
        public List<NewsletterBOL> displayTotalNewsletterObj;
        public List<ProductBOL> displayTotalProductsObj;
        public List<ProductImagesBOL> displayTotalImagesObj;
        public List<RegisterBOL> displayTotalRegisterationObj;
        public List<OrderPlacementBOL> displayTotalOrdersObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedin"] == null)
                Response.Redirect("Login.aspx");
            displayTotalCategoriesMethod();
            displayTotalContactsMethod();
            displayTotalNewsletterMethod();
            displayTotalProductsMethod();
            displayTotalImagesMethod();
            displayTotalRegisterationMethod();
            displayTotalOrdersMethod();
        }

        private void displayTotalCategoriesMethod()
        {
            CategoriesBLL ob = new CategoriesBLL();
            displayTotalCategoriesObj = ob.selectTotalCategories();
        }

        private void displayTotalContactsMethod()
        {
            ContactBLL ob = new ContactBLL();
            displayTotalContactsObj = ob.selectTotalContacts();
        }

        private void displayTotalNewsletterMethod()
        {
            NewsletterBLL ob = new NewsletterBLL();
            displayTotalNewsletterObj = ob.selectTotalNewsletter();
        }

        private void displayTotalProductsMethod()
        {
            ProductBLL ob = new ProductBLL();
            displayTotalProductsObj = ob.selectTotalProducts();
        }

        private void displayTotalImagesMethod()
        {
            ProductBLL ob = new ProductBLL();
            displayTotalImagesObj = ob.selectTotalProductImages();
        }

        private void displayTotalRegisterationMethod()
        {
            RegisterBLL ob = new RegisterBLL();
            displayTotalRegisterationObj = ob.selectTotalRegisteration();
        }

        private void displayTotalOrdersMethod()
        {
            OrderPlacementBLL ob = new OrderPlacementBLL();
            displayTotalOrdersObj = ob.selectTotalOrders();
        }

    }
}