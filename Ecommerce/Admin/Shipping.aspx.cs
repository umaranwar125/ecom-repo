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
    public partial class Shipping : System.Web.UI.Page
    {
        public List<ShippingBOL> displayAllShippingAddressObj;
        public List<ShippingBOL> displaySearchedShippingAddressObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedin"] == null)
                Response.Redirect("Login.aspx");
            displayAllShippingAddress();
        }

        private void displayAllShippingAddress()
        {
            ShippingBLL ob = new ShippingBLL();
            displayAllShippingAddressObj = ob.selectAllShippingAddresses();
        }

        protected void SearchShipping_Click(object sender, EventArgs e)
        {
            ShippingBLL ob = new ShippingBLL();
            displaySearchedShippingAddressObj = ob.searchSpecificShipping(Convert.ToInt32(SearchText.Value));
            if(displaySearchedShippingAddressObj.Count > 0)
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