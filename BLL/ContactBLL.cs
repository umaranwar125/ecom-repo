using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BOL;
using DAL;
namespace BLL
{
    public class ContactBLL
    {
        ContactDAL obj = new ContactDAL();
        public bool insertContactData(string name, string email, string message)
        {
            return obj.insertContactData(name, email, message);
        }

        public List<ContactsBOL> selectAllContacts()
        {
            return obj.selectAllContacts();
        }

        public bool deleteContactData(int ContactID)
        {
            return obj.deleteContactData(ContactID);
        }

        public List<ContactsBOL> selectTotalContacts()
        {
            return obj.selectTotalContacts();
        }
    }
}
