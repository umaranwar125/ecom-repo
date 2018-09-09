using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOL;
using BLL;

namespace Ecommerce
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        string ipaddress;
        public List<ShoppingCartBOL> displayProductsInCartObj;
        public List<ShoppingCartBOL> displayTotalPriceObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpRequest request = base.Request;
            ipaddress= request.UserHostAddress;

            diplayCartProducts();
            totalPriceOfAllProducts();
            if (Session["Remove-Product"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>Cart();</script>");
                Session.Remove("Remove-Product");
            }

            if (Request.QueryString["Product-del-ID"] != null)
            {
                ShoppingCartBLL ob = new ShoppingCartBLL();
                if (ob.deleteProductsFromCart(ipaddress, Convert.ToInt32(Request.QueryString["Product-del-ID"])))
                {
                    Session["Remove-Product"] = "Remove-Product";
                    Response.Redirect("ShoppingCart.aspx");
                }
            }
        }

        private void getIP()
        {
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
        }

        private void diplayCartProducts()
        {
            ShoppingCartBLL ob = new ShoppingCartBLL();
            getIP();
            displayProductsInCartObj = ob.selectTotalProductsFromShoppingCart(ipaddress);
        }

        private void totalPriceOfAllProducts()
        {
            ShoppingCartBLL ob = new ShoppingCartBLL();
            getIP();
            displayTotalPriceObj = ob.selectTotalPriceForCart(ipaddress);
        }
    }
}