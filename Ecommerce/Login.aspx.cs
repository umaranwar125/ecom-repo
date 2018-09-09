using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel.DataAnnotations;
using System.Web.Security;
using BLL;

namespace Ecommerce
{
    public partial class Login : System.Web.UI.Page
    {
        RegisterBLL obj = new RegisterBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Registeration"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>userRegisterationSuccessfull();</script>");
                Session.Remove("Registeration");
            }

            if (Session["ShoppingLogin"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>LoginError();</script>");
            }
            if(Session["PasswordUpdated"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>Success();</script>");
                Session.Remove("PasswordUpdated");
            }
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            string pwd = FormsAuthentication.HashPasswordForStoringInConfigFile(pwdText.Value.ToString(), "MD5");
            string email = FormsAuthentication.HashPasswordForStoringInConfigFile(emailText.Value.ToString(), "MD5");
            if (obj.userLogin(email, pwd))
            {
                Session["userLoggedin"] = email;
                if (Session["ShoppingLogin"] != null)
                {
                    Session.Remove("ShoppingLogin");
                    Response.Redirect("Checkout");
                }
                else
                    Response.Redirect("Default.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>error();</script>");
            }
        }
    }
}