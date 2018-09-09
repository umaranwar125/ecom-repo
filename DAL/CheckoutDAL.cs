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
    public class CheckoutDAL
    {
        string strCon;
        SqlConnection con;
        int Reg_ID, Ship_ID;

        private void connection()
        {
            strCon = ConfigurationManager.ConnectionStrings["myCon"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();
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

        // Insert Shippinf Information
        public bool insertShippingInformation(int RegID, string Email, long Mobile, string FNmae, string LName, string Address, string City, string PostalCode, int TotalPrice, int ShippingCharges)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("insertShippingInfo", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@RegisterID", Reg_ID);
            InsertData.Parameters.AddWithValue("@Email", Email);
            InsertData.Parameters.AddWithValue("@Mobile", Mobile);
            InsertData.Parameters.AddWithValue("@Fname", FNmae);
            InsertData.Parameters.AddWithValue("@Lname", LName);
            InsertData.Parameters.AddWithValue("@adrs", Address);
            InsertData.Parameters.AddWithValue("@City", City);
            InsertData.Parameters.AddWithValue("@Postal", PostalCode);
            InsertData.Parameters.AddWithValue("@TotalPrice", TotalPrice);
            InsertData.Parameters.AddWithValue("@Shipping", ShippingCharges);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Select SHippingID
        public void selectShippingID(int RegID)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("selectShippingID", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@RegisterID", Reg_ID);
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                Ship_ID = Convert.ToInt32(reader["ShippingID"]);
            }
            con.Close();
            reader.Close();
        }

        // Insert All Information To Order Table
        public bool insertInfoToOrderTable(string ipaddr, int ShipID, int RegID, int ProductID, int Quantity, string Size, DateTime time, string PaymentMethod)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("insertAllInfoToOrderTable", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@Ipaddr", ipaddr);
            InsertData.Parameters.AddWithValue("@ShippingID", Ship_ID);
            InsertData.Parameters.AddWithValue("@RegisterID", Reg_ID);
            InsertData.Parameters.AddWithValue("@ProductID", ProductID);
            InsertData.Parameters.AddWithValue("@Quantity", Quantity);
            InsertData.Parameters.AddWithValue("@Size", Size);
            InsertData.Parameters.AddWithValue("@Time", time);
            InsertData.Parameters.AddWithValue("@PMethod", PaymentMethod);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Select Order ID  
        public List<OrderPlacementBOL> selectOrderIdForMoneyStatusUpdation(int shippingID, string IpAddress, int RegisterID)
        {
            connection();
            List<OrderPlacementBOL> ls = new List<OrderPlacementBOL>();
            SqlCommand SelectData = new SqlCommand("selectOrderIdForMoneyStatusUpdation", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@ShippingID", Ship_ID);
            SelectData.Parameters.AddWithValue("@ipaddress", IpAddress);
            SelectData.Parameters.AddWithValue("@registerID", Reg_ID);
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
            {
                OrderPlacementBOL ob = new OrderPlacementBOL();
                ob.OrderID = Convert.ToInt32(reader["OrderID"]);
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }
    }
}
