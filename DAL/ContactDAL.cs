using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BOL;

namespace DAL
{
    public class ContactDAL
    {
        string conStr;
        SqlConnection con;

        private void connection()
        {
            conStr = ConfigurationManager.ConnectionStrings["myCon"].ConnectionString;
            con = new SqlConnection(conStr);
            con.Open();
        }

        // Inserting Contact Data
        public bool insertContactData(string name, string email, string message)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("insertContactData", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@Name", name);
            InsertData.Parameters.AddWithValue("@Email", email);
            InsertData.Parameters.AddWithValue("@Message", message);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Select Contacts Data
        public List<ContactsBOL> selectAllContacts()
        {
            connection();
            List<ContactsBOL> ls = new List<ContactsBOL>();
            SqlCommand SelectData = new SqlCommand("selectAllContacts", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
            {
                ContactsBOL ob = new ContactsBOL();
                ob.ContactID = Convert.ToInt32(reader["ContactID"]);
                ob.Name = reader["Name"].ToString();
                ob.Email = reader["Email"].ToString();
                ob.Message= reader["Message"].ToString();
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Deleting Contact Data
        public bool deleteContactData(int ContactID)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("deleteContact", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@ContactID", ContactID);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // SelectTotal Contacts For Dashboard
        public List<ContactsBOL> selectTotalContacts()
        {
            connection();
            List<ContactsBOL> ls = new List<ContactsBOL>();
            SqlCommand SelectData = new SqlCommand("selectTotalContactsForDashboard", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                ContactsBOL ob = new ContactsBOL();
                ob.ContactID = Convert.ToInt32(reader["ContactID"]);
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }
    }
}
