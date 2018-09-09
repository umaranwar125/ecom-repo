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
    public partial class OrderSuccess : System.Web.UI.Page
    {
        string ipaddress;
        int RegID, ShipID;
        public List<OrderPlacementBOL> displayOrdersObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CheckoutProcess"] == null)
                Response.Redirect("Default.aspx");
            else
            {
                if (Session["PayUmoney"] != null)
                {
                    getIP();
                    displayOrders();
                    OrderPlacementBLL ob = new OrderPlacementBLL();
                    ShoppingCartBLL ob1 = new ShoppingCartBLL();
                    foreach (var data in displayOrdersObj)
                    {
                        ob.updateMoneyStatus(data.OrderID);
                    }
                    ob1.deleteAllProductsFromCart(ipaddress);
                    Session.Remove("PayUmoney");
                    Session.Remove("CheckoutProcess");
                }
                if (Session["Jazzcash"] != null)
                {
                    getIP();
                    displayOrders();
                    OrderPlacementBLL ob = new OrderPlacementBLL();
                    ShoppingCartBLL ob1 = new ShoppingCartBLL();
                    foreach (var data in displayOrdersObj)
                    {
                        ob.updateMoneyStatus(data.OrderID);
                    }
                    ob1.deleteAllProductsFromCart(ipaddress);
                    Session.Remove("Jazzcash");
                    Session.Remove("CheckoutProcess");
                }
                Session.Remove("CheckoutProcess");
            }
        }

        private void displayOrders()
        {
            CheckoutBLL ob = new CheckoutBLL();
            ob.selectRegisterationID(Session["userLoggedin"].ToString());
            ob.selectShippingID(RegID);
            displayOrdersObj = ob.selectOrderIdForMoneyStatusUpdation(ShipID, ipaddress, RegID);
        }

        private void getIP()
        {
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
        }
    }
}