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
    public partial class ProductImages : System.Web.UI.Page
    {
        public List<ProductImagesBOL> displayProductImagesObj;
        public List<ProductImagesBOL> displaySearchedProductImagesObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            sessions();
            queryString();
            displayProductImages();
        }

        private void displayProductImages()
        {
            ProductBLL ob = new ProductBLL();
            displayProductImagesObj = ob.selectAllProductImagesForAdminPanel();
        }

        protected void AddImg_Click(object sender, EventArgs e)
        {
            ProductBLL ob = new ProductBLL();
            try {
                if (Image.HasFile)
                {
                    string path = Image.FileName.ToString();
                    Image.PostedFile.SaveAs(Server.MapPath("~") + "//Images//" + path);
                    string str = "Images/" + path.ToString();
                    if (ob.insertProductImages(Convert.ToInt32(IDText.Value), str))
                    {
                        Session["ImageInserted"] = "ImageInserted";
                        Response.Redirect("ProductImages.aspx");
                    }
                }
                else
                    ImageChoose.Visible = true;
            }catch(Exception ex)
            {
                IDerror.Visible = true;
            }
        }

        private void sessions()
        {
            if (Session["AdminLoggedin"] == null)
                Response.Redirect("Login.aspx");
            if (Session["ImageInserted"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>displaySuccessMessage();</script>");
                Session.Remove("ImageInserted");
            }
            if(Session["ImageDeleted"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>displaySuccessDeleteMessage();</script>");
                Session.Remove("ImageDeleted");
            }
        }

        private void queryString()
        {
            if(Request.QueryString["Delete-Image-ID"] != null)
            {
                ProductBLL ob = new ProductBLL();
                if (ob.deleteProductImages(Convert.ToInt32(Request.QueryString["Delete-Image-ID"])))
                {
                    Session["ImageDeleted"] = "ImageDeleted";
                    Response.Redirect("ProductImages.aspx");
                }
            }
        }

        protected void SearchProduct_Click(object sender, EventArgs e)
        {
            ProductBLL ob = new ProductBLL();
            displaySearchedProductImagesObj = ob.searchProductImages(Convert.ToInt32(SearchText.Value));
            if(displaySearchedProductImagesObj.Count > 0)
            {
                real.Visible = false;
                Alternate.Visible = true;
            }
            else
            {
                real.Visible = false;
                Alternate.Visible = true;
            }
        }
    }
}