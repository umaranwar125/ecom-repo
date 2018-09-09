using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce
{
    public partial class OrderFail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CheckoutProcess"] == null)
                Response.Redirect("Default.aspx");
            else
                Session.Remove("CheckoutProcess");
        }
    }
}