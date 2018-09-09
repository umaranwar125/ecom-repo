using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BOL;


namespace Ecommerce.User_Control_Files
{
    public partial class SideProfile : System.Web.UI.UserControl
    {
        int RegID;
        public List<RegisterBOL> displayRegisterationDataObj;
        protected void Page_Load(object sender, EventArgs e)
        {
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