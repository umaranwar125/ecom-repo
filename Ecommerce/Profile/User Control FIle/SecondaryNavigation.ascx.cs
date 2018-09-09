using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce.Profile.User_Control_FIle
{
    public partial class SecondaryNavigation : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Url.AbsolutePath.EndsWith("Profile/User_Profile"))
                Profiles.Attributes.Add("class", "active");
            else if (Request.Url.AbsolutePath.EndsWith("Profile/User_Orders"))
                Orders.Attributes.Add("class", "active");
            else if (Request.Url.AbsolutePath.EndsWith("Profile/Edit_Profile"))
                Edit.Attributes.Add("class", "active");
        }
    }
}