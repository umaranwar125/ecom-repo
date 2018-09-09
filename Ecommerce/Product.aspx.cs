using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BOL;
using BLL;

namespace Ecommerce
{
    public partial class Product : System.Web.UI.Page
    {
        //public string productName, productPrice, productImage, productID, productColor, productSize;
        int Cat_ID;
        string strCon;
        string ipaddress;
        SqlConnection con;
        public List<ProductImagesBOL> displayProductImagesObj;
        public List<ProductBOL> displayProductDetailsObj;
        public List<ProductBOL> displaySimilarProductsObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            getIP();
            displyProductImages();
            displayProductDetails();
            displaySimilarProducts();
            if (Session["Product-Added"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>Cart();</script>");
                Session.Remove("Product-Added");
            }
        }

        private void getIP()
        {   
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
        }


        private void displyProductImages()
        {
            ProductBLL ob = new ProductBLL();
            displayProductImagesObj = ob.selectProductImages(Convert.ToInt32(Request.QueryString["Product-ID"]));
        } 

        private void displayProductDetails()
        {
            ProductBLL ob = new ProductBLL();
            displayProductDetailsObj = ob.selectProductDetails(Convert.ToInt32(Request.QueryString["Product-ID"]));
        }

        private void displaySimilarProducts()
        {
            ProductBLL ob = new ProductBLL();
            ob.selectCategoryIDFromProductID(Convert.ToInt32(Request.QueryString["Product-ID"]));
            displaySimilarProductsObj = ob.selectSimilarProduct(Cat_ID);
        }

        private void connection()
        {
            strCon = ConfigurationManager.ConnectionStrings["myCon"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();
        }
        protected void Cart_Click(object sender, EventArgs e)
        {
            ShoppingCartBLL ob = new ShoppingCartBLL();
            getIP();
            foreach (var data in displayProductDetailsObj)
            {
                int Qty = Convert.ToInt32(Quantity.SelectedItem.Value);
                if (Quantity.SelectedIndex == 0)
                {
                    if (ob.insertProductsIntoCart(ipaddress, Convert.ToInt32(Request.QueryString["Product-ID"]), data.Name, Qty, data.Price, Size.SelectedItem.Value.ToString(), data.OldPrice, data.Image, data.Price))
                    {
                        Session["Product-Added"] = "Product-Added";
                        Response.Redirect("Product.aspx?Product-ID=" + Request.QueryString["Product-ID"]);
                    }
                }
                else
                {
                    int total_price = Convert.ToInt32(Quantity.SelectedItem.Value) * data.Price;
                    if (ob.insertProductsIntoCart(ipaddress, Convert.ToInt32(Request.QueryString["Product-ID"]), data.Name, Qty, data.Price, Size.SelectedItem.Value.ToString(), data.OldPrice, data.Image, total_price))
                    {
                        Session["Product-Added"] = "Product-Added";
                        Response.Redirect("Product.aspx?Product-ID=" + Request.QueryString["Product-ID"]);
                    }
                }
            }

            //connection();
            //List<ProductBOL> ls = new List<ProductBOL>();
            //SqlCommand SelectData = new SqlCommand("selectProductInfo", con);
            //SelectData.CommandType = CommandType.StoredProcedure;
            //SelectData.Parameters.AddWithValue("@ProductID", Request.QueryString["Product-ID"]);
            //SqlDataReader reader = SelectData.ExecuteReader();
            //while (reader.Read())
            //{
            //    productID = reader["ProductID"].ToString();
            //    productName = reader["Name"].ToString();
            //    productPrice = reader["Price"].ToString();
            //    productImage = reader["Image"].ToString();
            //}
            //con.Close();
            //reader.Close();

            //HttpCookie myCookie = new HttpCookie("CartInfo");
            //if(Request.Cookies["CartInfo"] == null)
            //{
            //    Response.Cookies["CartInfo"].Value = productID.ToString() + "," + productName.ToString() + "," + productPrice.ToString() + "," + productImage.ToString() + "," + Size.SelectedItem.Value.ToString() + "," + Colour.SelectedItem.Value.ToString();
            //    Response.Cookies["CartInfo"].Expires = DateTime.Now.AddDays(1);
            //}
            //else
            //{
            //    Response.Cookies["CartInfo"].Value = Response.Cookies["CartInfo"].Value + "|" + productID.ToString() + "," + productName.ToString() + "," + productPrice.ToString() + "," + productImage.ToString() + "," + Size.SelectedItem.Value.ToString() + "," + Colour.SelectedItem.Value.ToString();
            //    Response.Cookies["CartInfo"].Expires = DateTime.Now.AddDays(1);
            //}
            //myCookie.Values.Add("ProductPrice", data.Price.ToString());
            //myCookie.Values.Add("ProductImage", data.Image.ToString());
            //myCookie.Values.Add("ProductID", data.ProductID.ToString());
            //myCookie.Values.Add("ProductColour", Colour.SelectedItem.Value.ToString());
            //myCookie.Values.Add("ProductSize", Size.SelectedItem.Value.ToString());
            //myCookie.Expires.AddYears(1);
            //Response.Cookies.Add(myCookie);
            //Response.Cookies.Add(myCookie);
        }
    }
}