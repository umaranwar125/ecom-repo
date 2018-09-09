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
    public partial class Jazzcash : System.Web.UI.Page
    {
        public double Amount;
        double t_price;
        string ipaddress, Ref_numb;
        int RegID, ShipID, Price;
        public string RefNumb;
        public List<ShoppingCartBOL> displayTotalPriceObj;
        public List<ShoppingCartBOL> displayProductsInCartObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Refresh"] != null)
            {
                getIP();
                ShoppingCartBLL ob1 = new ShoppingCartBLL();
                ob1.deleteAllProductsFromCart(ipaddress);
                Session.Remove("Refresh");
                Session.Remove("Jazzcash");
                Response.Redirect("../../OrderFail.aspx");
            }
            else
            {
                if (Session["Jazzcash"] != null && Session["userLoggedin"] != null)
                {
                    getIP();
                    diplayCartProducts();
                    totalPriceOfAllProducts();
                    foreach (var data in displayTotalPriceObj)
                    {
                        if (data.TotalPrice < 1000)
                        {
                            Price = 60;
                        }
                        else if (data.TotalPrice > 1000 && data.TotalPrice < 10000)
                        {
                            Price = 250;
                        }
                        else if (data.TotalPrice > 10000 && data.TotalPrice < 20000)
                        {
                            Price = 710;
                        }
                        else if (data.TotalPrice > 20000)
                        {
                            Price = 1050;
                        }
                        t_price = Price + data.TotalPrice;
                    }
                    Random random = new Random();
                    Ref_numb = "Ref" + random.Next(10000000, 20000000).ToString();
                    RefNumb = Ref_numb;
                    Amount = t_price;
                    Session["CheckoutProcess"] = "CheckoutProcess";
                    Session["Refresh"] = "Refresh";
                    CheckoutBLL ob1 = new CheckoutBLL();
                    ob1.selectRegisterationID(Session["userLoggedin"].ToString());
                    foreach (var data1 in displayTotalPriceObj)
                    {
                        ob1.selectShippingID(RegID);
                        foreach (var data in displayProductsInCartObj)
                        {
                            ob1.insertInfoToOrderTable(ipaddress, ShipID, RegID, data.ProductID, data.PQuantity, data.PSize, DateTime.Now, "Jazzcash");
                        }
                    }
                }
                else
                    Response.Redirect("Default.aspx?Cat-ID=1");
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
            displayProductsInCartObj = ob.selectTotalProductsFromShoppingCart(ipaddress);
        }

        private void totalPriceOfAllProducts()
        {
            ShoppingCartBLL ob = new ShoppingCartBLL();
            displayTotalPriceObj = ob.selectTotalPriceForCart(ipaddress);
        }
    }
}