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
    public partial class Products : System.Web.UI.Page
    {
        public List<ProductBOL> displayProductsObj;
        public List<ProductBOL> displaySearchProductsObj;
        int CatID;
        string Cat;
        protected void Page_Load(object sender, EventArgs e)
        {
            sessions();
            queryStrings();
            displayProducts();
        }

        private void displayProducts()
        {
            ProductBLL ob = new ProductBLL();
            if (DropDownList1.SelectedValue == "")
            {
                ob.selectTopCategory();
                ob.selectSpecificTopCatID(Cat);
                displayProductsObj = ob.selectAllProductsForAdminPanel(CatID);
            }
            else
            {
                ob.selectSpecificCatID(DropDownList1.SelectedValue.ToString());
                displayProductsObj = ob.selectAllProductsForAdminPanel(CatID);
            }
        }

        protected void AddPro_Click(object sender, EventArgs e)
        {
            ProductBLL ob = new ProductBLL();
            ob.selectSpecificCatID(DropDownList2.SelectedValue.ToString());
            if (Image.HasFile)
            {
                string path = Image.FileName.ToString();
                Image.PostedFile.SaveAs(Server.MapPath("~") + "//Images//" + path);
                string str = "Images/" + path.ToString();
                if (OPriceText.Value == "")
                {
                    if (ob.insertProducts(CatID, NameText.Value.ToString(), Convert.ToInt32(PriceText.Value), 0, str))
                    {
                        Session["ProductInserted"] = "ProductInserted";
                        Response.Redirect("Products.aspx");
                    }
                }
                else
                {
                    if (ob.insertProducts(CatID, NameText.Value.ToString(), Convert.ToInt32(PriceText.Value), Convert.ToInt32(OPriceText.Value), str))
                    {
                        Session["ProductInserted"] = "ProductInserted";
                        Response.Redirect("Products.aspx");
                    }
                }
            }
            else
                ImageChoose.Visible = true;
        }

        private void sessions()
        {
            if (Session["AdminLoggedin"] == null)
                Response.Redirect("Login.aspx");
            if(Session["ProductInserted"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>displaySuccessMessage();</script>");
                Session.Remove("ProductInserted"); 
            }
            if(Session["ProductUpdated"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>displaySuccessUpdateMessage();</script>");
                Session.Remove("ProductUpdated");
            }
            if (Session["ProductDeleted"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>displayDeleteSuccessMessage();</script>");
                Session.Remove("ProductDeleted");
            }
        }

        private void queryStrings()
        {
            ProductBLL ob = new ProductBLL();
            if (Request.QueryString["Update-Product-ID"] != null)
            {
                AddProduct.Visible = false;
                InsertProduct.Visible = false;
                UpdateProduct.Visible = true;
            }
            if(Request.QueryString["Delete-Product-ID"] != null)
            {
                ob.deleteProductInShoppingCart(Convert.ToInt32(Request.QueryString["Delete-Product-ID"]));
                ob.deleteProductInOrders(Convert.ToInt32(Request.QueryString["Delete-Product-ID"]));
                ob.deleteProductInProductImages(Convert.ToInt32(Request.QueryString["Delete-Product-ID"]));
                if (ob.deleteProduct(Convert.ToInt32(Request.QueryString["Delete-Product-ID"])))
                {
                    Session["ProductDeleted"] = "ProductDeleted";
                    Response.Redirect("Products.aspx");
                }
            }
        }

        protected void UpdatePro_Click(object sender, EventArgs e)
        {
            ProductBLL ob = new ProductBLL();
            if (UpdImage.HasFile)
            {
                ob.selectSpecificCatID(DropDownList3.SelectedValue.ToString());
                string path = UpdImage.FileName.ToString();
                UpdImage.PostedFile.SaveAs(Server.MapPath("~") + "//Images//" + path);
                string str = "Images/" + path.ToString();
                if (OPriceText.Value == "")
                {
                    if (ob.updateProduct(Convert.ToInt32(Request.QueryString["Update-Product-ID"]), CatID, UpdNameText.Value.ToString(), Convert.ToInt32(UpdPriceText.Value.ToString()), 0, str))
                    {
                        Session["ProductUpdated"] = "ProductUpdated";
                        Response.Redirect("Products.aspx");
                    }
                }
                else
                {
                    if (ob.updateProduct(Convert.ToInt32(Request.QueryString["Update-Product-ID"]), CatID, UpdNameText.Value.ToString(), Convert.ToInt32(UpdPriceText.Value.ToString()), 0, str))
                    {
                        Session["ProductUpdated"] = "ProductUpdated";
                        Response.Redirect("Products.aspx");
                    }
                }
            }
            else
                ImageChoose.Visible = true;
        }

        protected void SearchProductImage_Click(object sender, EventArgs e)
        {
            ProductBLL ob = new ProductBLL();
            ob.selectSpecificCatID(DropDownList4.SelectedValue.ToString());
            displaySearchProductsObj = ob.searchProductsForAdminPanel(SearchText.Value.ToString(), CatID);
            if(displaySearchProductsObj.Count > 0)
            {
                Real.Visible = false;
                Alternate.Visible = true;
                Categories.Visible = false;
            }
            else
            {
                Categories.Visible = false;
                Real.Visible = false;
                Alternate.Visible = true;
            }
        }
    }
}