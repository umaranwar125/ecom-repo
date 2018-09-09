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
    public partial class Contact : System.Web.UI.Page
    {
        public List<ContactsBOL> displayContactObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            displayContacts();
            deleteContact();
            sessions();
        }

        private void displayContacts()
        {
            ContactBLL ob = new ContactBLL();
            displayContactObj = ob.selectAllContacts();
        }

        // Delete Contact
        private void deleteContact()
        {
            if(Request.QueryString["Delete-Contact-ID"] != null)
            {
                ContactBLL ob = new ContactBLL();
                if (ob.deleteContactData(Convert.ToInt32(Request.QueryString["Delete-Contact-ID"])))
                {
                    Session["ContactDeleted"] = "ContactDeleted";
                    Response.Redirect("Contact.aspx");
                }
            }
        }

        // Sessions
        private void sessions()
        {
            if (Session["AdminLoggedin"] == null)
                Response.Redirect("Login.aspx");
            if (Session["ContactDeleted"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>displayDeleteSuccessMessage();</script>");
                Session.Remove("ContactDeleted");
            }
        }
    }
}