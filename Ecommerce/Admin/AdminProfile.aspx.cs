using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOL;
using BLL;

namespace Ecommerce.Admin
{
    public partial class AdminProfile : System.Web.UI.Page
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

        protected void AdminProfileUpdate_Click(object sender, EventArgs e)
        {
            AdminBLL ob = new AdminBLL();
            if (Image.HasFile)
            {
                string path = Image.FileName.ToString();
                Image.PostedFile.SaveAs(Server.MapPath("~") + "//Images//" + path);
                string str = "Images/" + path.ToString();
                if (ob.updateAdminProfile(FullName.Value.ToString(), Email.Value.ToString(), Convert.ToInt64(Contact.Value), str))
                {
                    Session["ProfileUpdated"] = "ProfileUpdated";
                    Response.Redirect("AdminProfile.aspx");
                }
            }
            else
            {
                if (ob.updateAdminProfile(FullName.Value.ToString(), Email.Value.ToString(), Convert.ToInt64(Contact.Value), "Images/dp.jpg"))
                {
                    Session["ProfileUpdated"] = "ProfileUpdated";
                    Response.Redirect("AdminProfile.aspx");
                }
            }
        }

        private void sessions()
        {
            if (Session["AdminLoggedin"] == null)
                Response.Redirect("Login.aspx");
            if(Session["ProfileUpdated"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>displaySuccessUpdateMessage();</script>");
                Session.Remove("ProfileUpdated");
            }
        }
    }
}