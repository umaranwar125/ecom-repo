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
    public partial class RegisteredUsers : System.Web.UI.Page
    {
        public List<RegisterBOL> displayRegisterationDataObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedin"] == null)
                Response.Redirect("Login.aspx");
            displayRegisterationData();
        }

        private void displayRegisterationData()
        {
            RegisterBLL ob = new RegisterBLL();
            displayRegisterationDataObj = ob.selectRegisterationDataForAdminPanel();
        }
    }
}