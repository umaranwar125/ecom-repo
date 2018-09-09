using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOL;
using BLL;

namespace Ecommerce.Profile
{
    public partial class MyOrders : System.Web.UI.Page
    {
        int ProductID;
        int Reg_ID;
        public List<ProductBOL> displayProductObj;
        public List<OrderPlacementBOL> displayOrderObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userLoggedin"] == null)
                Response.Redirect("../Login");
            OrderPlacementBLL ob = new OrderPlacementBLL();
            ob.selectRegisterationID(Session["userLoggedin"].ToString());
            displayOrderObj = ob.selectShippingInfo(Reg_ID);
        }
    }
}