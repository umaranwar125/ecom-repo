using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce.Admin
{
    public partial class ContactVIAEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedin"] == null)
                Response.Redirect("Login.aspx");
        }

        protected void SendMail_Click(object sender, EventArgs e)
        {
            if (isValid(ToText.Value.ToString()))
            {
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("uanwar016@gmail.com", "WebDeveloper125");
                smtp.EnableSsl = true;
                MailMessage msg = new MailMessage();
                msg.Subject = SubjectText.Value.ToString();
                msg.Body = Msg.Value.ToString();
                string toaddress = ToText.Value.ToString();
                msg.To.Add(toaddress);
                string fromaddress = "Ecommerce Shopping <uanwar016@gmail.com>";
                msg.From = new MailAddress(fromaddress);
                try
                {
                    smtp.Send(msg);
                    ClientScript.RegisterStartupScript(GetType(), "", "<script>displayDeleteSuccessMessage();</script>");
                    EmailIncorrect.Visible = false;
                }
                catch
                {
                    throw;
                }
            }
            else
                EmailIncorrect.Visible = true;
        }

        private bool isValid(string email)
        {
            return new EmailAddressAttribute().IsValid(email);
        } 
    }
}