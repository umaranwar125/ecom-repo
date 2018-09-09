using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;

namespace Ecommerce
{
    public class Global : System.Web.HttpApplication
    {
        public static void register(RouteCollection route)
        {
            route.MapPageRoute("ContactPage", "Contact-Us", "~/Contact.aspx");
            route.MapPageRoute("DefaultPage", "index/Cat-ID=1", "~/Default.aspx");
            route.MapPageRoute("LogintPage", "login", "~/Login.aspx");
            route.MapPageRoute("RegisterPage", "register", "~/Register.aspx");
            route.MapPageRoute("ForgotPasswordPage", "Forgot_Password", "~/ForgotPassword.aspx");
            route.MapPageRoute("ShoppingCartPage", "cart", "~/ShoppingCart.aspx");
            route.MapPageRoute("CheckoutPage", "checkout", "~/Checkout.aspx");
            route.MapPageRoute("SuccessPage", "order-success", "~/OrderSuccess.aspx");
            route.MapPageRoute("FailurePage", "order-failed", "~/OrderFail.aspx");
            route.MapPageRoute("JazzcashPage", "Payment/Jazzcash/", "~/Jazzcash.aspx");
            route.MapPageRoute("AboutPage", "about", "~/About.aspx");
            route.MapPageRoute("ProfilePage", "Profile/User_Profile", "~/Profile/MyProfile.aspx");
            route.MapPageRoute("OrderPage", "Profile/User_Orders", "~/Profile/MyOrders.aspx");
            route.MapPageRoute("EditProfilePage", "Profile/Edit_Profile", "~/Profile/EditProfile.aspx");
        }

        protected void Application_Start(object sender, EventArgs e)
        {
            register(RouteTable.Routes);
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}