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
    public class CategoriesDAL
    {
        string strCon;
        SqlConnection con;
        private void connection()
        {
            strCon = ConfigurationManager.ConnectionStrings["myCon"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();
        }

        // Selecting Categories from DB.
        public List<CategoriesBOL> selectingCategories()
        {
            connection();
            List<CategoriesBOL> ls = new List<CategoriesBOL>();
            SqlCommand SelectData = new SqlCommand("selectAllCategories", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
            {
                CategoriesBOL ob = new CategoriesBOL();
                ob.CategoryID = Convert.ToInt32(reader["CategoryID"]);
                ob.Category = reader["Category"].ToString();
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
            
        }

        // Add Category
        public bool insertCategory(string Category)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("insertCatregories", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@category", Category);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Update Category
        public bool updateCategory(int CatID, string Category)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("updateCategory", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@CategoryID", CatID);
            InsertData.Parameters.AddWithValue("@Category", Category);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Select Total Ctegories For Dashboard
        public List<CategoriesBOL> selectTotalCategories()
        {
            connection();
            List<CategoriesBOL> ls = new List<CategoriesBOL>();
            SqlCommand SelectData = new SqlCommand("selectTotalCategoriesForDashboard", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                CategoriesBOL ob = new CategoriesBOL();
                ob.CategoryID = Convert.ToInt32(reader["CategoryID"]);
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;

        }

    }
}
