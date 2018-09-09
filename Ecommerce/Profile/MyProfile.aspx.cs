using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BOL;
using BLL;

namespace UI.Profile
{
    public partial class MyProfile : System.Web.UI.Page
    {
        int RegID;
        public List<RegisterBOL> displayRegisterationDataObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userLoggedin"] == null)
                Response.Redirect("../Login");
            selectRegisterationData();
            
        }

        private void selectRegisterationData()
        {
            RegisterBLL ob = new RegisterBLL();
            ob.selectRegisterationID(Session["userLoggedin"].ToString());
            displayRegisterationDataObj = ob.selectRegisterationData(RegID);
        }
    }
}