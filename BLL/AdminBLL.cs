using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BOL;
using DAL;

namespace BLL
{
    public class AdminBLL
    {
        AdminDAL ob = new AdminDAL();
        public bool AdminLogin(string Username, string Pwd1, string Pwd2)
        {
            return ob.AdminLogin(Username, Pwd1, Pwd2);
        }

        public List<AdminBOL> selectAdminData()
        {
            return ob.selectAdminData();
        }

        public bool updateAdminProfile(string Name, string Email, long Contact, string Image)
        {
            return ob.updateAdminProfile(Name, Email, Contact, Image);
        }

        public bool selectUsernameAndPassword(string Username, string Password)
        {
            return ob.selectUsernameAndPassword(Username, Password);
        }

        public bool updateUsernameAndPassword(string Username, string Pwd1, string Pwd2)
        {
            return ob.updateUsernameAndPassword(Username, Pwd1, Pwd2);
        }

        public bool updateUsernameAndPasswordFromForgotPassword(string Pwd1, string Pwd2)
        {
            return ob.updateUsernameAndPasswordFromForgotPassword(Pwd1, Pwd2);
        }

        public bool checkExistingEmailForForgotPassword(string email)
        {
            return ob.checkExistingEmailForForgotPassword(email);
        }
    }
}
