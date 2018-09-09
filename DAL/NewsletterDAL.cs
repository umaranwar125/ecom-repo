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
    public class NewsletterDAL
    {
        string strCon;
        SqlConnection con;

        // SQL Connection.
        private void connection()
        {
            strCon = ConfigurationManager.ConnectionStrings["myCon"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();
        }

        // Inserting Newsletter  Data
        public bool insertNewsletterData(string email)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("insertNewsletter", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@Email", email);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Select Newsletter Emails
        public List<NewsletterBOL> selectAllNewsletter()
        {
            connection();
            List<NewsletterBOL> ls = new List<NewsletterBOL>();
            SqlCommand SelectData = new SqlCommand("selectAllNewsletter", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
            {
                NewsletterBOL ob = new NewsletterBOL();
                ob.ID = Convert.ToInt32(reader["NewsLetterID"]);
                ob.Email = reader["Email"].ToString();
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Deleting Newsletter Email
        public bool deleteNewsletterEmail(int ID)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("deleteNewsletter", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@ID", ID);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Select TOtal Newsletter for Dashbpard
        public List<NewsletterBOL> selectTotalNewsletter()
        {
            connection();
            List<NewsletterBOL> ls = new List<NewsletterBOL>();
            SqlCommand SelectData = new SqlCommand("selectTotalNewsletterForDashboard", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                NewsletterBOL ob = new NewsletterBOL();
                ob.ID = Convert.ToInt32(reader["NewsLetterID"]);
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }
    }
}
