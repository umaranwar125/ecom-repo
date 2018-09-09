using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BLL;

namespace Ecommerce.Profile
{
    public partial class EditProfile : System.Web.UI.Page
    {
        int Reg_ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["userLoggedin"] == null)
                Response.Redirect("../Login");
            if(Session["ProfileUpdated"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>alert_Congrats();</script>");
                Session.Remove("ProfileUpdated");
            }
        }

        protected void UpdateNow_Click(object sender, EventArgs e)
        {
            RegisterBLL ob = new RegisterBLL();
            string paswrd = FormsAuthentication.HashPasswordForStoringInConfigFile(con_p.Value.ToString(), "MD5");
            ob.selectRegisterationID(Session["userLoggedin"].ToString());
            if (img.HasFile)
            {
                string path = img.FileName.ToString();
                img.PostedFile.SaveAs(Server.MapPath("~") + "//Images//" + path);
                string str = "Images/" + path.ToString();
                if (ob.updateUserProfile(Reg_ID, FName.Value.ToString(), LName.Value.ToString(), paswrd, Titl.Value.ToString(), Convert.ToInt64(contact_n.Value.ToString()), str))
                {
                    Session["ProfileUpdated"] = "ProfileUpdated";
                    Response.Redirect("EditProfile.aspx");
                }
            }
            else
                alert_image.Visible = true;
        }
    }
}