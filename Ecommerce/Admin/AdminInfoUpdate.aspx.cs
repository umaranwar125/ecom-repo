using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BOL;
using BLL;

namespace Ecommerce.Admin
{
    public partial class AdminInfoUpdate : System.Web.UI.Page
    {
        public List<AdminBOL> displayAdminDataObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            sessions();
            displayAdminData();
        }

        private void displayAdminData()
        {
            AdminBLL ob = new AdminBLL();
            displayAdminDataObj = ob.selectAdminData();
        }

        protected void AdminPwdUpdate_Click(object sender, EventArgs e)
        {
            AdminBLL ob = new AdminBLL();
            string OUser = FormsAuthentication.HashPasswordForStoringInConfigFile(UsernameOldText.Value.ToString(), "MD5");
            string NUser = FormsAuthentication.HashPasswordForStoringInConfigFile(UsernameText.Value.ToString(), "MD5");
            string OPWD1 = FormsAuthentication.HashPasswordForStoringInConfigFile(Pwd1OldText.Value.ToString(), "MD5");
            string NPWD1 = FormsAuthentication.HashPasswordForStoringInConfigFile(Pwd1Text.Value.ToString(), "MD5");
            string NPWD2 = FormsAuthentication.HashPasswordForStoringInConfigFile(Pwd2Text.Value.ToString(), "MD5");
            if (ob.selectUsernameAndPassword(OUser, OPWD1))
            {
                Incorrect.Visible = false;
                if (ob.updateUsernameAndPassword(NUser, NPWD1, NPWD2))
                {
                    Session["PasswordUpdated"] = "PasswordUpdated";
                    Response.Redirect("AdminInfoUpdate.aspx");
                }
            }
            else
            {
                Caution.Visible = false;
                Incorrect.Visible = true;
            }
        }

        private void sessions()
        {
            if (Session["AdminLoggedin"] == null)
                Response.Redirect("Login.aspx");
            if(Session["PasswordUpdated"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>displaySuccessUpdateMessage();</script>");
                Session.Remove("PasswordUpdated");
            }
        }
    }
}