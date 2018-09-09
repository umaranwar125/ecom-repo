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
    public class ShippingDAL
    {
        string strCon;
        SqlConnection con;
        private void connection()
        {
            strCon = ConfigurationManager.ConnectionStrings["myCon"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();
        }

        // Selecting All Shiping Addresses
        public List<ShippingBOL> selectAllShippingAddresses()
        {
            connection();
            List<ShippingBOL> ls = new List<ShippingBOL>();
            SqlCommand SelectData = new SqlCommand("selectAllShippingAddress", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
            {
                ShippingBOL ob = new ShippingBOL();
                ob.ShippingID = Convert.ToInt32(reader["ShippingID"]);
                ob.RegisterID = Convert.ToInt32(reader["RegisterID"]);
                ob.Email = reader["Email"].ToString();
                ob.Mobile = Convert.ToInt64(reader["Mobile"]);
                ob.FName = reader["FName"].ToString();
                ob.LName = reader["LName"].ToString();
                ob.Address = reader["Address"].ToString();
                ob.City = reader["City"].ToString();
                ob.PostalCode = reader["PostalCode"].ToString();
                ob.Price = Convert.ToInt32(reader["TotalPrice"]);
                ob.ShippingCharges = Convert.ToInt32(reader["ShippingCharges"]);
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Search Specific Shiping Addresses
        public List<ShippingBOL> searchSpecificShipping(int ShippingID)
        {
            connection();
            List<ShippingBOL> ls = new List<ShippingBOL>();
            SqlCommand SelectData = new SqlCommand("searchShippingID", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@ShippingID", ShippingID);
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
            {
                ShippingBOL ob = new ShippingBOL();
                ob.ShippingID = Convert.ToInt32(reader["ShippingID"]);
                ob.RegisterID = Convert.ToInt32(reader["RegisterID"]);
                ob.Email = reader["Email"].ToString();
                ob.Mobile = Convert.ToInt64(reader["Mobile"]);
                ob.FName = reader["FName"].ToString();
                ob.LName = reader["LName"].ToString();
                ob.Address = reader["Address"].ToString();
                ob.City = reader["City"].ToString();
                ob.PostalCode = reader["PostalCode"].ToString();
                ob.Price = Convert.ToInt32(reader["TotalPrice"]);
                ob.ShippingCharges = Convert.ToInt32(reader["ShippingCharges"]);
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }
    }
}
