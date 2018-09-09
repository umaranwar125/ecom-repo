using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel.DataAnnotations;
//using Plivo;
//using Plivo.Exception;
using BOL;
using BLL;
using System.Text;
using System.Collections;
using System.Security.Cryptography;

namespace Ecommerce
{
    public partial class Checkout : System.Web.UI.Page
    {
        string ipaddress;
        public int Price;
        int RegID, ShipID;
        Double amount;
        public List<ShoppingCartBOL> displayTotalPriceObj;
        public List<ShoppingCartBOL> displayProductsInCartObj;
        protected void Page_Load(object sender, EventArgs e)
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
            }

            if (Session["userLoggedin"] == null)
            {
                Session["ShoppingLogin"] = "ShoppingLogin";
                Response.Redirect("Login");
            }
            if (displayProductsInCartObj.Count == 0)
            {
                Session["EmptyCart"] = "EmptyCart";
                Response.Redirect("Categories.aspx?Cat-ID=12");
            }
        }

        private bool isValid(string email)
        {
            return new EmailAddressAttribute().IsValid(email);
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

        protected void Confirm_Click(object sender, EventArgs e)
        {
            Session["CheckoutProcess"] = "CheckoutProcess";
            ShoppingCartBLL ob = new ShoppingCartBLL();
            CheckoutBLL ob1 = new CheckoutBLL();
            ob1.selectRegisterationID(Session["userLoggedin"].ToString());
            if (isValid(EmailTxtBox.Value.ToString()))
            {
                if (Payment.Checked)
                {
                    foreach (var data1 in displayTotalPriceObj)
                    {
                        if (ob1.insertShippingInformation(RegID, EmailTxtBox.Value.ToString(), Convert.ToInt64(MobileTxtBox.Value.ToString()), FNameTxtBox.Value.ToString(), LNameTxtBox.Value.ToString(), AddressTxtBox.Value.ToString(), CityTxtBox.Value.ToString(), CodeTxtBox.Value.ToString(), data1.TotalPrice, Price))
                        {
                            ob1.selectShippingID(RegID);
                            foreach (var data in displayProductsInCartObj)
                            {
                                ob1.insertInfoToOrderTable(ipaddress, ShipID, RegID, data.ProductID, data.PQuantity, data.PSize, DateTime.Now, Payment.Value.ToString());
                            }
                            ob.deleteAllProductsFromCart(ipaddress);
                            Session["OrderPlaced"] = "OrderPlaced";
                            //var api = new PlivoApi("MAZDBLMMEYNMUWNZIZYZ", "Y2ZmY2ViZjYwYzU4NWVlNDU3N2UxMmFiZjQ1OWE2");
                            //var response = api.Message.Create(
                            //    src: "+923219737094",
                            //    dst: new List{ "+923159382193" },
                            //    text: "Hello, world!"
                            //);
                            //Console.WriteLine(response);
                            Response.Redirect("OrderSuccess.aspx");
                        }
                    }
                }
                else if (PayuMoney.Checked)
                {
                    foreach (var data1 in displayTotalPriceObj)
                    {
                        if (ob1.insertShippingInformation(RegID, EmailTxtBox.Value.ToString(), Convert.ToInt64(MobileTxtBox.Value.ToString()), FNameTxtBox.Value.ToString(), LNameTxtBox.Value.ToString(), AddressTxtBox.Value.ToString(), CityTxtBox.Value.ToString(), CodeTxtBox.Value.ToString(), data1.TotalPrice, Price))
                        {
                            ob1.selectShippingID(RegID);
                            foreach (var data2 in displayProductsInCartObj)
                            {
                                ob1.insertInfoToOrderTable(ipaddress, ShipID, RegID, data2.ProductID, data2.PQuantity, data2.PSize, DateTime.Now, PayuMoney.Value.ToString());
                            }
                            Session["PayUmoney"] = "PayUmoney";

                            // Pay u Money Coding
                            Random random = new Random();
                            string txVal = random.Next(10000000, 20000000).ToString();
                            txnid.Value = FNameTxtBox.Value.ToString() + txVal;
                            Response.Write(txnid.Value.ToString());
                            amount = Convert.ToDouble(Price + data1.TotalPrice);
                            String text = key.Value.ToString() + "|" + txnid.Value.ToString() + "|" + amount + "|" + "myProduct" + "|" + FNameTxtBox.Value.ToString() + "|" + EmailTxtBox.Value.ToString() + "|" + "1" + "|" + "1" + "|" + "1" + "|" + "1" + "|" + "1" + "||||||" + salt.Value.ToString();
                            byte[] message = Encoding.UTF8.GetBytes(text);

                            UnicodeEncoding UE = new UnicodeEncoding();
                            byte[] hashValue;
                            SHA512Managed hashString = new SHA512Managed();
                            string hex = "";
                            hashValue = hashString.ComputeHash(message);
                            foreach (byte x in hashValue)
                            {
                                hex += String.Format("{0:x2}", x);
                            }
                            hash.Value = hex;

                            Hashtable data = new Hashtable(); // adding values in hashtable for data post
                            data.Add("hash", hex.ToString());
                            data.Add("txnid", txnid.Value);
                            data.Add("key", key.Value);
                            // string AmountForm = ;// eliminating trailing zeros

                            data.Add("amount", amount);
                            data.Add("firstname", FNameTxtBox.Value.ToString());
                            data.Add("email", EmailTxtBox.Value.ToString());
                            data.Add("phone", MobileTxtBox.Value.ToString());
                            data.Add("productinfo", "myProduct");
                            data.Add("udf1", "1");
                            data.Add("udf2", "1");
                            data.Add("udf3", "1");
                            data.Add("udf4", "1");
                            data.Add("udf5", "1");
                            data.Add("surl", "http://localhost:27722/OrderSuccess.aspx");
                            data.Add("furl", "http://localhost:27722/OrderFail.aspx");

                            data.Add("service_provider", "");


                            string strForm = PreparePOSTForm("https://secure.payu.in/_payment", data);
                            Page.Controls.Add(new LiteralControl(strForm));
                        }
                    }
                }
                else if (Jazzcash.Checked)
                {
                    foreach (var data1 in displayTotalPriceObj)
                    {
                        if (ob1.insertShippingInformation(RegID, EmailTxtBox.Value.ToString(), Convert.ToInt64(MobileTxtBox.Value.ToString()), FNameTxtBox.Value.ToString(), LNameTxtBox.Value.ToString(), AddressTxtBox.Value.ToString(), CityTxtBox.Value.ToString(), CodeTxtBox.Value.ToString(), data1.TotalPrice, Price))
                        {
                            Session["Jazzcash"] = "Jazzcash";
                            Response.Redirect("Payment/Jazzcash/");
                        }
                    }
                }
            }
            else
                EmailIncorrect.Visible = true;
        }

        private string PreparePOSTForm(string url, System.Collections.Hashtable data)
        {
            //Set a name for the form
            string formID = "PostForm";
            //Build the form using the specified data to be posted.
            StringBuilder strForm = new StringBuilder();
            strForm.Append("<form id=\"" + formID + "\" name=\"" +
                           formID + "\" action=\"" + url +
                           "\" method=\"POST\">");
            foreach (System.Collections.DictionaryEntry key in data)
            {

                strForm.Append("<input type=\"hidden\" name=\"" + key.Key +
                               "\" value=\"" + key.Value + "\">");
            }
            strForm.Append("</form>");
            //Build the JavaScript which will do the Posting operation.
            StringBuilder strScript = new StringBuilder();
            strScript.Append("<script language='javascript'>");
            strScript.Append("var v" + formID + " = document." +
                             formID + ";");
            strScript.Append("v" + formID + ".submit();");
            strScript.Append("</script>");
            //Return the form and the script concatenated.
            //(The order is important, Form then JavaScript)
            return strForm.ToString() + strScript.ToString();
        }

    }
}