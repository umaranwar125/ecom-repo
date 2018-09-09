using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BOL;

namespace Ecommerce.Admin
{
    public partial class Orders : System.Web.UI.Page
    {
        public List<OrderPlacementBOL> displayOrdersObj;
        public List<OrderPlacementBOL> displaySearchedOrdersObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            sessions();
            queryString();
            displayOrders();
        }

        private void displayOrders()
        {
            OrderPlacementBLL ob = new OrderPlacementBLL();
            displayOrdersObj = ob.selectAllOrders();
        }

        private void sessions()
        {
            if (Session["AdminLoggedin"] == null)
                Response.Redirect("Login.aspx");
            if (Session["OrderApproved"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>displaySuccessUpdateMessage();</script>");
                Session.Remove("OrderApproved");
            }
        }

        private void queryString()
        {
            OrderPlacementBLL ob = new OrderPlacementBLL();
            if(Request.QueryString["Approve-Order"] != null)
            {
                if (ob.approveOrders(Convert.ToInt32(Request.QueryString["Approve-Order"])))
                {
                    Session["OrderApproved"] = "OrderApproved";
                    Response.Redirect("Orders.aspx");
                }
            }
        }

        protected void SearchOrders_Click(object sender, EventArgs e)
        {
            OrderPlacementBLL ob = new OrderPlacementBLL();
            displaySearchedOrdersObj = ob.searchRegisterIDForOrders(Convert.ToInt32(SearchText.Value));
            if(displaySearchedOrdersObj.Count > 0)
            {
                Real.Visible = false;
                Alternate.Visible = true;
            }
            else
            {
                Real.Visible = false;
                Alternate.Visible = true;
            }
        }
    }
}