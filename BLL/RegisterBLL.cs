using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using BOL;

namespace BLL
{
    public class RegisterBLL
    {
        RegisterDAL obj = new RegisterDAL();
        public bool userRegisteration(string fName, string lName, string email, string password)
        {
            return obj.userRegisteration(fName, lName, email, password);
        }

        public bool checkExistingEmail(string email)
        {
            return obj.checkExistingEmail(email);
        }

        public bool userLogin(string email, string pwd)
        {
            return obj.userLogin(email, pwd);
        }

        public void selectRegisterationID(string email)
        {
            obj.selectRegisterationID(email);
        }

        public List<RegisterBOL> selectRegisterationData(int RegID)
        {
            return obj.selectRegisterationData(RegID);
        }

        public bool updateUserProfile(int RegisterID, string FName, string LNname, string Pwd, string Title, long Contact, string Image)
        {
            return obj.updateUserProfile(RegisterID, FName, LNname, Pwd, Title, Contact, Image);
        }

        public List<RegisterBOL> selectRegisterationDataForAdminPanel()
        {
            return obj.selectRegisterationDataForAdminPanel();
        }

        public List<RegisterBOL> selectTotalRegisteration()
        {
            return obj.selectTotalRegisteration();
        }

        public List<RegisterBOL> selectRegisterationDataForNotification(int RegID)
        {
            return obj.selectRegisterationDataForNotification(RegID);
        }

        public bool checkExistingEmailForForgotPassword(string email)
        {
            return obj.checkExistingEmailForForgotPassword(email);
        }

        public bool insertVarificationCode(string Email, long Code)
        {
            return obj.insertVarificationCode(Email, Code);
        }

        public bool varifyingCode(string email, long Code)
        {
            return obj.varifyingCode(email, Code);
        }

        public bool updateForgotPassword(string Email, string password)
        {
            return obj.updateForgotPassword(Email, password);
        }

        public bool deleteVarificationCode(string Email)
        {
            return obj.deleteVarificationCode(Email);
        }
    }
}
