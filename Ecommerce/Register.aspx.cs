using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.ComponentModel.DataAnnotations;
using BLL;

namespace Ecommerce
{
    public partial class Register : System.Web.UI.Page
    {
        RegisterBLL userObj = new RegisterBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Email Validation.
        public bool IsValidEmail(string source)
        {
            return new EmailAddressAttribute().IsValid(source);
        }

        protected void UserRegisteration_Click(object sender, EventArgs e)
        {
            string pwd = FormsAuthentication.HashPasswordForStoringInConfigFile(pwdText.Value.ToString(), "MD5");
            string email = FormsAuthentication.HashPasswordForStoringInConfigFile(emailText.Value.ToString(), "MD5");
            if (IsValidEmail(emailText.Value.ToString()))
            {
                if (userObj.checkExistingEmail(email))
                {
                    if (userObj.userRegisteration(fNameText.Value.ToString(), lNameText.Value.ToString(), email, pwd))
                    {
                        Session["Registeration"] = emailText.Value.ToString();
                        Response.Redirect("Login.aspx");
                    }
                }
                else
                    ClientScript.RegisterStartupScript(GetType(), "", "<script>error();</script>");
            }
            else
                ClientScript.RegisterStartupScript(GetType(), "", "<script>error1();</script>");
        }
    }
}