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
    public class MainSliderDAL
    {
        string strCon;
        SqlConnection con;
        string empty;

        // SQL Connection.
        private void connection()
        {
            strCon = ConfigurationManager.ConnectionStrings["myCon"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();
        }

        // Select Image Slider.
        public List<MainSliderBOL> selectImageSlider()
        {
            List<MainSliderBOL> ls = new List<MainSliderBOL>();
            connection();
            SqlCommand SelectData = new SqlCommand("selectSliderForMainPage", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
            {
                MainSliderBOL ob = new MainSliderBOL();
                ob.SliderID = Convert.ToInt32(reader["SliderID"]);
                ob.Text = reader["Text"].ToString();
                ob.Button = reader["Button"].ToString();
                ob.BtnText = reader["BtnText"].ToString();
                ob.BtnLink = reader["BtnLink"].ToString();
                ob.Image = reader["Image"].ToString();
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Insert SLider
        public bool insertSlider(string text, string btn, string btnText, string btnLink, string Image)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("insertSlider", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@text", text);
            InsertData.Parameters.AddWithValue("@btn", btn);
            InsertData.Parameters.AddWithValue("@btnText", btnText);
            InsertData.Parameters.AddWithValue("@btnLink", btnLink);
            InsertData.Parameters.AddWithValue("@Image", Image);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Update SLider
        public bool updateSlider(int SliderID, string text, string btn, string btnText, string btnLink, string Image)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("updateSlider", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@SliderID", SliderID);
            InsertData.Parameters.AddWithValue("@text", text);
            InsertData.Parameters.AddWithValue("@btn", btn);
            InsertData.Parameters.AddWithValue("@btnText", btnText);
            InsertData.Parameters.AddWithValue("@btnLink", btnLink);
            InsertData.Parameters.AddWithValue("@Image", Image);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Dekete SLider
        public bool deleteSlider(int SliderID)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("deleteSlider", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@SliderID", SliderID);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }
    }
}
