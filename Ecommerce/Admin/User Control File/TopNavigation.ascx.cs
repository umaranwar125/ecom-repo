using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOL;
using BLL;

namespace Ecommerce.Admin.User_Control_File
{
    public partial class TopNavigation : System.Web.UI.UserControl
    {
        public List<ContactsBOL> displayContactObj;
        public List<AdminBOL> displayAdminDataObj;
        public List<OrderPlacementBOL> displayProductsObj;
        public List<RegisterBOL> displayUserDataObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            displayAdminData();
            displayContacts();
            selectAllProducts();
        }

        private void displayAdminData()
        {
            AdminBLL ob = new AdminBLL();
            displayAdminDataObj = ob.selectAdminData();
        }

        private void displayContacts()
        {
            ContactBLL ob = new ContactBLL();
            displayContactObj = ob.selectAllContacts();
        }

        private void selectAllProducts()
        {
            OrderPlacementBLL ob = new OrderPlacementBLL();
            displayProductsObj = ob.selectAllOrdersForNotification();
        }
    }
}