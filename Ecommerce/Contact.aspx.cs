using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel.DataAnnotations;
using BLL;

namespace Ecommerce
{
    public partial class Contact : System.Web.UI.Page
    {
        ContactBLL obj = new ContactBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Email Validation.
        public bool IsValidEmail(string source)
        {
            return new EmailAddressAttribute().IsValid(source);
        }

        protected void ContactBtn_Click(object sender, EventArgs e)
        {
            if (IsValidEmail(emailText.Value.ToString()))
            {
                if (obj.insertContactData(nameText.Value.ToString(), emailText.Value.ToString(), msgText.Value.ToString()))
                {
                    ClientScript.RegisterStartupScript(GetType(), "", "<script>Success();</script>");
                    nameText.Value = "";
                    emailText.Value = "";
                    msgText.Value = "";
                }
            }
            else
                ClientScript.RegisterStartupScript(GetType(), "", "<script>error1();</script>");
        }
    }
}