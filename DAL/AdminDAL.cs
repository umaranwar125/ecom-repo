using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using BOL;

namespace DAL
{
    public class AdminDAL
    {
        string strCon;
        SqlConnection con;

        // Connection.
        private void connection()
        {
            strCon = ConfigurationManager.ConnectionStrings["myCon"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();
        }

        // Select Data for Admin Login
        public bool AdminLogin(string Username, string Pwd1, string Pwd2)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("selectDataForAdminLogin", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@username", Username);
            SelectData.Parameters.AddWithValue("@pwd1", Pwd1);
            SelectData.Parameters.AddWithValue("@pwd2", Pwd2);
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                con.Close();
                reader.Close();
                return true;
            }
            else
            {
                con.Close();
                reader.Close();
                return false;
            }
        }

        // Select All Data for Display
        public List<AdminBOL> selectAdminData()
        {
            connection();
            List<AdminBOL> ls = new List<AdminBOL>();
            SqlCommand SelectData = new SqlCommand("selectAdminInformation", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                AdminBOL ob = new AdminBOL();
                ob.FullName = reader["FullName"].ToString();
                ob.Email = reader["Email"].ToString();
                ob.Contact = Convert.ToInt64(reader["Contact"]);
                ob.Image = reader["Image"].ToString();
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Update Admin Profile
        public bool updateAdminProfile(string Name, string Email, long Contact, string Image)
        {
            connection();
            SqlCommand UpdateData = new SqlCommand("updateAdminProfile", con);
            UpdateData.CommandType = CommandType.StoredProcedure;
            UpdateData.Parameters.AddWithValue("@Name", Name);
            UpdateData.Parameters.AddWithValue("@Email", Email);
            UpdateData.Parameters.AddWithValue("@Contact", Contact);
            UpdateData.Parameters.AddWithValue("@Image", Image);
            UpdateData.ExecuteNonQuery();
            con.Close();
            return true;
        }
        
        // Select Username and Password for Validation.
        public bool selectUsernameAndPassword(string Username, string Password)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("selectAdminPassword", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@Username", Username);
            SelectData.Parameters.AddWithValue("@Pwd1", Password);
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                con.Close();
                reader.Close();
                return true;
            }
            else
            {
                con.Close();
                reader.Close();
                return false;
            }
        }

        // Update Admin Username And Password.
        public bool updateUsernameAndPassword(string Username, string Pwd1, string Pwd2)
        {
            connection();
            SqlCommand UpdateData = new SqlCommand("updateAdminPassword", con);
            UpdateData.CommandType = CommandType.StoredProcedure;
            UpdateData.Parameters.AddWithValue("@Username", Username);
            UpdateData.Parameters.AddWithValue("@Pwd1", Pwd1);
            UpdateData.Parameters.AddWithValue("@Pwd2", Pwd2);
            UpdateData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Update Admin Username And Password From ForgotPassword.
        public bool updateUsernameAndPasswordFromForgotPassword(string Pwd1, string Pwd2)
        {
            connection();
            SqlCommand UpdateData = new SqlCommand("updatePasswordFromForgotPassword", con);
            UpdateData.CommandType = CommandType.StoredProcedure;
            UpdateData.Parameters.AddWithValue("@Pwd1", Pwd1);
            UpdateData.Parameters.AddWithValue("@Pwd2", Pwd2);
            UpdateData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Checking Existing Email for FOrgot Password.
        public bool checkExistingEmailForForgotPassword(string email)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("selectAdminEmailForFOrgotPassword", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@Email", email);
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                con.Close();
                reader.Close();
                return true;
            }
            else
            {
                con.Close();
                reader.Close();
                return false;
            }
        }
    }
}
