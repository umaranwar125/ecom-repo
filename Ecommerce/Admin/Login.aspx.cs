using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BLL;
using BOL;

namespace Ecommerce.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["PasswordUpdated"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>Success();</script>");
                Session.Remove("PasswordUpdated");
            }
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            AdminBLL ob = new AdminBLL();
            string user = FormsAuthentication.HashPasswordForStoringInConfigFile(UsernameLogin.Value.ToString(), "MD5");
            string pwd1 = FormsAuthentication.HashPasswordForStoringInConfigFile(PasswornOneLogin.Value.ToString(), "MD5");
            string pwd2 = FormsAuthentication.HashPasswordForStoringInConfigFile(PasswordTwoLogin.Value.ToString(), "MD5");
            if(ob.AdminLogin(user, pwd1, pwd2))
            {
                Session["AdminLoggedin"] = user;
                Incorrect.Visible = true;
                Response.Redirect("Dashboard.aspx");
            }
            else
                Incorrect.Visible = true;
        }
    }
}