using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOL;
using BLL;


namespace Ecommerce.Admin
{
    public partial class Categories : System.Web.UI.Page
    {
        public List<CategoriesBOL> displayProductCategories;
        protected void Page_Load(object sender, EventArgs e)
        {
            sessions();
            displayCategories();
            if (Request.QueryString["Update-Category-ID"] != null)
                displayDivs(false, true);
            else
                displayDivs(true, false);
        }

        // Categories
        private void displayCategories()
        {
            CategoriesBLL ob = new CategoriesBLL();
            displayProductCategories = ob.selectingCategories();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CategoriesBLL ob = new CategoriesBLL();
            if (ob.insertCategory(CatText.Value.ToString()))
            {
                Session["CategoryAdded"] = "CategoryAdded";
                Response.Redirect("Categories.aspx");
            }
        }

        protected void UpdateCat_Click(object sender, EventArgs e)
        {
            CategoriesBLL ob = new CategoriesBLL();
            if (ob.updateCategory(Convert.ToInt32(Request.QueryString["Update-Category-ID"]), UpdCatText.Value.ToString()))
            {
                Session["CategoryUpdated"] = "CategoryUpdated";
                Response.Redirect("Categories.aspx");
            }
        }

        // Display Textboxes
        private void displayDivs(bool Insert, bool Update)
        {
            InsertCategory.Visible = Insert;
            UpdateCategory.Visible = Update;
        }

        // Sessions
        private void sessions()
        {
            if (Session["AdminLoggedin"] == null)
                Response.Redirect("Login.aspx");
            if (Session["CategoryAdded"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>displaySuccessMessage();</script>");
                Session.Remove("CategoryAdded");
            }
            if (Session["CategoryUpdated"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>displaySuccessUpdateMessage();</script>");
                Session.Remove("CategoryUpdated");
            }
        }
    }
}