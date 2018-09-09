using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using BOL;
using BLL;

namespace Ecommerce.Admin
{
    public partial class Newsletter : System.Web.UI.Page
    {
        public List<NewsletterBOL> displayNewsletterObj; 
        protected void Page_Load(object sender, EventArgs e)
        {
            displayNewsletter();
            deleteNewsletter();
            sessions();
        }

        private void displayNewsletter()
        {
            NewsletterBLL ob = new NewsletterBLL();
            displayNewsletterObj = ob.selectAllNewsletter();
        }

        // Delete Newsletter
        private void deleteNewsletter()
        {
            if (Request.QueryString["Delete-Newsletter-ID"] != null)
            {
                NewsletterBLL ob = new NewsletterBLL();
                if (ob.deleteNewsletterEmail(Convert.ToInt32(Request.QueryString["Delete-Newsletter-ID"])))
                {
                    Session["NewsletterDeleted"] = "NewsletterDeleted";
                    Response.Redirect("Newsletter.aspx");
                }
            }
        }

        // Sessions
        private void sessions()
        {
            if (Session["AdminLoggedin"] == null)
                Response.Redirect("Login.aspx");
            if (Session["NewsletterDeleted"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>displayDeleteSuccessMessage();</script>");
                Session.Remove("NewsletterDeleted");
            }
        }

        protected void AddMsg_Click(object sender, EventArgs e)
        {
            foreach (var data in displayNewsletterObj)
            {
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("uanwar016@gmail.com", "WebDeveloper125");
                smtp.EnableSsl = true;
                MailMessage msg = new MailMessage();
                msg.Subject = SubjectText.Value.ToString();
                msg.Body = MsgText.Value.ToString();
                string toaddress = data.Email;
                msg.To.Add(toaddress);
                string fromaddress = "Ecommerce Shopping <uanwar016@gmail.com>";
                msg.From = new MailAddress(fromaddress);
                try
                {
                    smtp.Send(msg);
                    ClientScript.RegisterStartupScript(GetType(), "", "<script>displaySuccessMessage();</script>");
                }
                catch
                {
                    throw;
                }
            }
        }
    }
}