using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using BOL;

namespace DAL
{
    public class OrderPlacementDAL
    {
        int Reg_ID;
        string empty;
        string strCon;
        SqlConnection con;

        // SQL Connection.
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

        // Selecting Product Details
        public List<ProductBOL> selectProductDetailsForProfile(int ProductID)
        {
            connection();
            List<ProductBOL> ls = new List<ProductBOL>();
            SqlCommand SelectData = new SqlCommand("selectProductInfo", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@ProductID", ProductID);
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                ProductBOL ob = new ProductBOL();
                ob.ProductID = Convert.ToInt32(reader["ProductID"]);
                ob.CategoryID = Convert.ToInt32(reader["CategoryID"]);
                ob.Name = reader["Name"].ToString();
                ob.Price = Convert.ToInt32(reader["Price"]);
                if (reader["OldPrice"] == DBNull.Value)
                    empty = string.Empty;
                else
                    ob.OldPrice = Convert.ToInt32(reader["OldPrice"]);
                ob.Image = reader["Image"].ToString();
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Selecting Product Details
        public List<OrderPlacementBOL> selectShippingInfo(int RegisterID)
        {
            connection();
            List<OrderPlacementBOL> ls = new List<OrderPlacementBOL>();
            SqlCommand SelectData = new SqlCommand("selectShippingInfoForProfile", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@registerID", Reg_ID);
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
            {
                OrderPlacementBOL ob = new OrderPlacementBOL();
                ob.OrderID = Convert.ToInt32(reader["OrderID"]);
                ob.ShippingID = Convert.ToInt32(reader["ShippingID"]);
                ob.RegisterID = Convert.ToInt32(reader["RegisterID"]);
                ob.ProductID = Convert.ToInt32(reader["ProductID"]);
                ob.Quantity = Convert.ToInt32(reader["Quantity"]);
                if (reader["Size"] == DBNull.Value)
                    empty = string.Empty;
                else
                    ob.Size = reader["Size"].ToString();
                ob.Time = Convert.ToDateTime(reader["Time"]);
                ob.Status = reader["Status"].ToString();
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Selecting Total Orders for Dashbpard
        public List<OrderPlacementBOL> selectTotalOrders()
        {
            connection();
            List<OrderPlacementBOL> ls = new List<OrderPlacementBOL>();
            SqlCommand SelectData = new SqlCommand("selectTotalOrderForDashboard", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                OrderPlacementBOL ob = new OrderPlacementBOL();
                ob.OrderID = Convert.ToInt32(reader["OrderID"]);
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Selecting All Orders
        public List<OrderPlacementBOL> selectAllOrders()
        {
            connection();
            List<OrderPlacementBOL> ls = new List<OrderPlacementBOL>();
            SqlCommand SelectData = new SqlCommand("selectAllOrders", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
            {
                OrderPlacementBOL ob = new OrderPlacementBOL();
                ob.OrderID = Convert.ToInt32(reader["OrderID"]);
                ob.IpAddress = reader["IpAddress"].ToString();
                ob.ShippingID = Convert.ToInt32(reader["ShippingID"]);
                ob.RegisterID = Convert.ToInt32(reader["RegisterID"]);
                ob.ProductID = Convert.ToInt32(reader["ProductID"]);
                ob.Quantity = Convert.ToInt32(reader["Quantity"]);
                if (reader["Size"] == DBNull.Value)
                    empty = string.Empty;
                else
                    ob.Size = reader["Size"].ToString();
                ob.Time = Convert.ToDateTime(reader["Time"]);
                ob.Status = reader["Status"].ToString();
                ob.PaymentMethod = reader["PaymentMethod"].ToString();
                ob.PaymentStatus = reader["MoneyStatus"].ToString();
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Approving Order.
        public bool approveOrders(int OrderID)
        {
            connection();
            SqlCommand UpdateData = new SqlCommand("updateOrderByApprove", con);
            UpdateData.CommandType = CommandType.StoredProcedure;
            UpdateData.Parameters.AddWithValue("@OrderID", OrderID);
            UpdateData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Search Register ID For Orders
        public List<OrderPlacementBOL> searchRegisterIDForOrders(int RegisterID)
        {
            connection();
            List<OrderPlacementBOL> ls = new List<OrderPlacementBOL>();
            SqlCommand SelectData = new SqlCommand("searchRegisterIDFromOrders", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@RegisterID", RegisterID);
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
            {
                OrderPlacementBOL ob = new OrderPlacementBOL();
                ob.OrderID = Convert.ToInt32(reader["OrderID"]);
                ob.IpAddress = reader["IpAddress"].ToString();
                ob.ShippingID = Convert.ToInt32(reader["ShippingID"]);
                ob.RegisterID = Convert.ToInt32(reader["RegisterID"]);
                ob.ProductID = Convert.ToInt32(reader["ProductID"]);
                ob.Quantity = Convert.ToInt32(reader["Quantity"]);
                if (reader["Size"] == DBNull.Value)
                    empty = string.Empty;
                else
                    ob.Size = reader["Size"].ToString();
                ob.Time = Convert.ToDateTime(reader["Time"]);
                ob.Status = reader["Status"].ToString();
                ob.PaymentMethod = reader["PaymentMethod"].ToString();
                ob.PaymentStatus = reader["MoneyStatus"].ToString();
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Selecting All Orders For Notification
        public List<OrderPlacementBOL> selectAllOrdersForNotification()
        {
            connection();
            List<OrderPlacementBOL> ls = new List<OrderPlacementBOL>();
            SqlCommand SelectData = new SqlCommand("selectAllProductsForNotification", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
            {
                OrderPlacementBOL ob = new OrderPlacementBOL();
                ob.OrderID = Convert.ToInt32(reader["OrderID"]);
                ob.ShippingID = Convert.ToInt32(reader["ShippingID"]);
                ob.RegisterID = Convert.ToInt32(reader["RegisterID"]);
                ob.ProductID = Convert.ToInt32(reader["ProductID"]);
                ob.Quantity = Convert.ToInt32(reader["Quantity"]);
                if (reader["Size"] == DBNull.Value)
                    empty = string.Empty;
                else
                    ob.Size = reader["Size"].ToString();
                ob.Time = Convert.ToDateTime(reader["Time"]);
                ob.Status = reader["Status"].ToString();
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Select Orders For Printout
        public List<OrderPlacementBOL> selectOrderForPrintout(int OrderID)
        {
            connection();
            List<OrderPlacementBOL> ls = new List<OrderPlacementBOL>();
            SqlCommand SelectData = new SqlCommand("selectOrdersForPrintOut", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@OrderID", OrderID);
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
            {
                OrderPlacementBOL ob = new OrderPlacementBOL();
                ob.OrderID = Convert.ToInt32(reader["OrderID"]);
                ob.IpAddress = reader["IpAddress"].ToString();
                ob.ShippingID = Convert.ToInt32(reader["ShippingID"]);
                ob.RegisterID = Convert.ToInt32(reader["RegisterID"]);
                ob.ProductID = Convert.ToInt32(reader["ProductID"]);
                ob.Quantity = Convert.ToInt32(reader["Quantity"]);
                if (reader["Size"] == DBNull.Value)
                    empty = string.Empty;
                else
                    ob.Size = reader["Size"].ToString();
                ob.Time = Convert.ToDateTime(reader["Time"]);
                ob.Status = reader["Status"].ToString();
                ob.PaymentStatus = reader["MoneyStatus"].ToString();
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Update MoneyStatus of Order
        public void updateMoneyStatus(int OrderID)
        {
            connection();
            SqlCommand UpdateData = new SqlCommand("updateMoneyStatusofOrder", con);
            UpdateData.CommandType = CommandType.StoredProcedure;
            UpdateData.Parameters.AddWithValue("@OrderID", OrderID);
            UpdateData.ExecuteNonQuery();
            con.Close();
        }
    }
}
