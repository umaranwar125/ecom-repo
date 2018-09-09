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
    public class RegisterDAL
    {
        string strCon;
        SqlConnection con;
        int Reg_ID;
        string empty;

        // SQL Connection.
        private void connection()
        {
            strCon = ConfigurationManager.ConnectionStrings["myCon"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();
        }

        // Inserting User Registeration
        public bool userRegisteration(string fName, string lName, string email, string password)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("insertRegisterationData", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@Fname", fName);
            InsertData.Parameters.AddWithValue("@Lname", lName);
            InsertData.Parameters.AddWithValue("@Email", email);
            InsertData.Parameters.AddWithValue("@Password", password);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Checking Existing Email.
        public bool checkExistingEmail(string email)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("selectExstingEmailForUserRegisterationValidation", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@email", email);
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                con.Close();
                reader.Close();
                return false;
            }
            else
            {
                con.Close();
                reader.Close();
                return true;
            }
        }

        // Login User Data.
        public bool userLogin(string email, string pwd)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("selectRegisterationDataForLogin", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@Email", email);
            SelectData.Parameters.AddWithValue("@pwd", pwd);
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

        // Selecting Registeration ID of Loggedin User.
        public void selectRegisterationID(string email)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("selectRegisterationID", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@Email", email);
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                Reg_ID = Convert.ToInt32(reader["ResgisterID"]);
            }
            con.Close();
            reader.Close();
        }

        // Selecting User Data.
        public List<RegisterBOL> selectRegisterationData(int RegID)
        {
            List<RegisterBOL> ls = new List<RegisterBOL>();
            connection();
            SqlCommand SelectData = new SqlCommand("selectUserRegisterationData", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@RegID", Reg_ID);
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                RegisterBOL ob = new RegisterBOL();
                ob.RegisterID = Convert.ToInt32(reader["ResgisterID"]);
                ob.FName = reader["FName"].ToString();
                ob.LName = reader["LName"].ToString();
                ob.Email = reader["Email"].ToString();
                ob.Pwd = reader["Password"].ToString();
                if (reader["Title"] == DBNull.Value)
                    empty = string.Empty;
                else
                    ob.Title = reader["Title"].ToString();
                if (reader["Contact"] == DBNull.Value)
                    empty = string.Empty;
                else
                    ob.Contact = Convert.ToInt64(reader["Contact"]);
                if (reader["Image"] == DBNull.Value)
                    empty = string.Empty;
                else
                    ob.Image = reader["Image"].ToString();
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;

        }

        // Update User Profile
        public bool updateUserProfile(int RegisterID, string FName, string LNname, string Pwd, string Title, long Contact, string Image)
        {
            connection();
            SqlCommand UpdateData = new SqlCommand("updateUserProfile", con);
            UpdateData.CommandType = CommandType.StoredProcedure;
            UpdateData.Parameters.AddWithValue("@RegisterationID", Reg_ID);
            UpdateData.Parameters.AddWithValue("@FName", FName);
            UpdateData.Parameters.AddWithValue("@LName", LNname);
            UpdateData.Parameters.AddWithValue("@pwd", Pwd);
            UpdateData.Parameters.AddWithValue("@Title", Title);
            UpdateData.Parameters.AddWithValue("@Contact", Contact);
            UpdateData.Parameters.AddWithValue("@Image", Image);
            UpdateData.ExecuteNonQuery();
            return true;
        }

        // Selecting User Data for Admin Panel.
        public List<RegisterBOL> selectRegisterationDataForAdminPanel()
        {
            List<RegisterBOL> ls = new List<RegisterBOL>();
            connection();
            SqlCommand SelectData = new SqlCommand("selectRegisteredUsers", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
            {
                RegisterBOL ob = new RegisterBOL();
                ob.RegisterID = Convert.ToInt32(reader["ResgisterID"]);
                ob.FName = reader["FName"].ToString();
                ob.LName = reader["LName"].ToString();
                ob.Email = reader["Email"].ToString();
                if (reader["Title"] == DBNull.Value)
                    empty = string.Empty;
                else
                    ob.Title = reader["Title"].ToString();
                if (reader["Contact"] == DBNull.Value)
                    empty = string.Empty;
                else
                    ob.Contact = Convert.ToInt64(reader["Contact"]);
                if (reader["Image"] == DBNull.Value)
                    empty = string.Empty;
                else
                    ob.Image = reader["Image"].ToString();
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Selecting Total Registeration for Dashbpard.
        public List<RegisterBOL> selectTotalRegisteration()
        {
            List<RegisterBOL> ls = new List<RegisterBOL>();
            connection();
            SqlCommand SelectData = new SqlCommand("selectTotalregisterationForDashboard", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                RegisterBOL ob = new RegisterBOL();
                ob.RegisterID = Convert.ToInt32(reader["ResgisterID"]);
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Selecting User Data for Notification.
        public List<RegisterBOL> selectRegisterationDataForNotification(int RegID)
        {
            List<RegisterBOL> ls = new List<RegisterBOL>();
            connection();
            SqlCommand SelectData = new SqlCommand("selectUserRegisterationData", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@RegID", RegID);
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                RegisterBOL ob = new RegisterBOL();
                ob.RegisterID = Convert.ToInt32(reader["ResgisterID"]);
                ob.FName = reader["FName"].ToString();
                ob.LName = reader["LName"].ToString();
                ob.Email = reader["Email"].ToString();
                ob.Pwd = reader["Password"].ToString();
                if (reader["Title"] == DBNull.Value)
                    empty = string.Empty;
                else
                    ob.Title = reader["Title"].ToString();
                if (reader["Contact"] == DBNull.Value)
                    empty = string.Empty;
                else
                    ob.Contact = Convert.ToInt64(reader["Contact"]);
                if (reader["Image"] == DBNull.Value)
                    empty = string.Empty;
                else
                    ob.Image = reader["Image"].ToString();
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Checking Existing Email for Forgot Password.
        public bool checkExistingEmailForForgotPassword(string email)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("selectEmailForFOrgotPassword", con);
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

        // Insert Varification COde
        public bool insertVarificationCode(string Email, long Code)
        {
            connection();
            SqlCommand UpdateData = new SqlCommand("insertVarificationCode", con);
            UpdateData.CommandType = CommandType.StoredProcedure;
            UpdateData.Parameters.AddWithValue("@Email", Email);
            UpdateData.Parameters.AddWithValue("@Code", Code);
            UpdateData.ExecuteNonQuery();
            return true;
        }

        // Varifying Code.
        public bool varifyingCode(string email, long Code)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("selectVarificationCode", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@Email", email);
            SelectData.Parameters.AddWithValue("@Code", Code);
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

        // Update ForgotPassword
        public bool updateForgotPassword(string Email, string password)
        {
            connection();
            SqlCommand UpdateData = new SqlCommand("updateForgotPassword", con);
            UpdateData.CommandType = CommandType.StoredProcedure;
            UpdateData.Parameters.AddWithValue("@Email", Email);
            UpdateData.Parameters.AddWithValue("@Pwd", password);
            UpdateData.ExecuteNonQuery();
            return true;
        }

        // Delete Varifiacation Code.
        public bool deleteVarificationCode(string Email)
        {
            connection();
            SqlCommand UpdateData = new SqlCommand("deleteVarificationCode", con);
            UpdateData.CommandType = CommandType.StoredProcedure;
            UpdateData.Parameters.AddWithValue("@Email", Email);
            UpdateData.ExecuteNonQuery();
            return true;
        }
    }
}
