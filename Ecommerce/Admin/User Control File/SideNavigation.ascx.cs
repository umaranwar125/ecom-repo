using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce.Admin.User_Control_File
{
    public partial class SideNavigation : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Url.AbsolutePath.EndsWith("Dashboard.aspx"))
                DashboardActive.Attributes.Add("class", "active");
            if (Request.Url.AbsolutePath.EndsWith("Profile.aspx"))
                MyProfile.Attributes.Add("class", "active");
            if (Request.Url.AbsolutePath.EndsWith("Slider.aspx"))
                Slider.Attributes.Add("class", "active");
            if (Request.Url.AbsolutePath.EndsWith("Categories.aspx"))
                Categories.Attributes.Add("class", "active");
            if (Request.Url.AbsolutePath.EndsWith("Contact.aspx"))
                Contact.Attributes.Add("class", "active");
            if (Request.Url.AbsolutePath.EndsWith("ContactVIAEmail.aspx"))
                ContactVIAEmail.Attributes.Add("class", "active");
            if (Request.Url.AbsolutePath.EndsWith("Newsletter.aspx"))
                Newsletter.Attributes.Add("class", "active");
            if (Request.Url.AbsolutePath.EndsWith("Products.aspx"))
                Products.Attributes.Add("class", "active");
            if (Request.Url.AbsolutePath.EndsWith("ProductImages.aspx"))
                ProductImages.Attributes.Add("class", "active");
            if (Request.Url.AbsolutePath.EndsWith("RegisteredUsers.aspx"))
                Registeration.Attributes.Add("class", "active");
            if (Request.Url.AbsolutePath.EndsWith("Orders.aspx"))
                Orders.Attributes.Add("class", "active");
            if (Request.Url.AbsolutePath.EndsWith("Shipping.aspx"))
                Shipping.Attributes.Add("class", "active");
            if (Request.Url.AbsolutePath.EndsWith("Reports.aspx"))
                Reports.Attributes.Add("class", "active");
        }
    }
}