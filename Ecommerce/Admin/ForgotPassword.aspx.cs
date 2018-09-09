using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel.DataAnnotations;
using System.Net;
using System.Net.Mail;
using System.Web.Security;
using BOL;
using BLL;

namespace Ecommerce.Admin
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        double numb;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool isValid(string email)
        {
            return new EmailAddressAttribute().IsValid(email);
        }

        protected void Forgot_Click(object sender, EventArgs e)
        {
            Random rand = new Random();
            numb = rand.Next(10000, 99999);
            AdminBLL ob1 = new AdminBLL();
            RegisterBLL ob = new RegisterBLL();
            if (isValid(ForgotEmail.Value.ToString()))
            {
                if (ob1.checkExistingEmailForForgotPassword(ForgotEmail.Value.ToString()))
                {
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.Credentials = new System.Net.NetworkCredential("uanwar016@gmail.com", "WebDeveloper125");
                    smtp.EnableSsl = true;
                    MailMessage msg = new MailMessage();
                    msg.Subject = "Varification Code";
                    msg.Body = "You varification code is " + numb;
                    string toaddress = ForgotEmail.Value.ToString();
                    msg.To.Add(toaddress);
                    string fromaddress = "Ecommerce Shopping <uanwar016@gmail.com>";
                    msg.From = new MailAddress(fromaddress);
                    try
                    {
                        smtp.Send(msg);
                        ClientScript.RegisterStartupScript(GetType(), "", "<script>userRegisterationSuccessfull();</script>");
                        Session["VarificationEmail"] = ForgotEmail.Value.ToString();
                        ob.insertVarificationCode(Session["VarificationEmail"].ToString(), Convert.ToInt64(numb));
                        showEmail.Visible = false;
                        Varification.Visible = true;
                    }
                    catch
                    {
                        throw;
                    }
                }
                else
                {
                    EmailNotExist.Visible = true;
                    EmailIncorrect.Visible = false;
                }
            }
            else
            {
                EmailIncorrect.Visible = true;
                EmailNotExist.Visible = false;
            }
        }

        protected void Varify_Click(object sender, EventArgs e)
        {
            RegisterBLL ob = new RegisterBLL();
            if (ob.varifyingCode(Session["VarificationEmail"].ToString(), Convert.ToInt64(CodeText.Value)))
            {
                Varification.Visible = false;
                ChangePassword.Visible = true;
                ClientScript.RegisterStartupScript(GetType(), "", "<script>userRegisterationSuccessfull();</script>");
            }
            else
                CodeIncorrect.Visible = true;
        }

        protected void Change_Click(object sender, EventArgs e)
        {
            AdminBLL ob1 = new AdminBLL();
            RegisterBLL ob = new RegisterBLL();
            string pwd1 = FormsAuthentication.HashPasswordForStoringInConfigFile(Pwd.Value.ToString(), "MD5");
            string pwd2 = FormsAuthentication.HashPasswordForStoringInConfigFile(ConPwd.Value.ToString().ToString(), "MD5");
            if (ob1.updateUsernameAndPasswordFromForgotPassword(pwd1, pwd2))
            {
                Session["PasswordUpdated"] = "PasswordUpdated";
                ob.deleteVarificationCode(Session["VarificationEmail"].ToString());
                Session.Remove("VarificationEmail");
                Response.Redirect("Login.aspx");
            }
        }
    }
}