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

    public class ShoppingCartDAL
    {
        string strCon;
        SqlConnection con;
        string empty;

        private void connection()
        {
            strCon = ConfigurationManager.ConnectionStrings["myCon"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();
        }

        // Insert Products Into Shopping Cart
        public bool insertProductsIntoCart(string Ipaddr, int ProductID, string Name, int Quanitity, int Price, string Size, int OldPrice, string Image, int TotalPrice)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("insertProductsIntoCart", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@ipAddr", Ipaddr);
            InsertData.Parameters.AddWithValue("@ProductID", ProductID);
            InsertData.Parameters.AddWithValue("@PName", Name);
            InsertData.Parameters.AddWithValue("@PQuantity", Quanitity);
            InsertData.Parameters.AddWithValue("@PPrice", Price);
            InsertData.Parameters.AddWithValue("@PSize", Size);
            InsertData.Parameters.AddWithValue("@POPrice", OldPrice);
            InsertData.Parameters.AddWithValue("@PImage", Image);
            InsertData.Parameters.AddWithValue("@TPrice", TotalPrice);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Selctc Total products in Shopping Cart
        public List<ShoppingCartBOL> selectTotalProductsFromShoppingCart(string ipAddr)
        {
            connection();
            List<ShoppingCartBOL> ls = new List<ShoppingCartBOL>();
            SqlCommand SelectData = new SqlCommand("selectTotalProductsFromCart", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@ipaddr", ipAddr);
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
            {
                ShoppingCartBOL ob = new ShoppingCartBOL();
                ob.CartID = Convert.ToInt32(reader["CartID"]);
                ob.ipAddr = reader["IPaddress"].ToString();
                ob.ProductID = Convert.ToInt32(reader["ProductID"]);
                ob.PName = reader["ProductName"].ToString();
                ob.PQuantity = Convert.ToInt32(reader["ProductQuantity"]);
                ob.PPrice = Convert.ToInt32(reader["ProductPrice"]);
                ob.PSize = reader["ProductSize"].ToString();
                ob.POPrice = Convert.ToInt32(reader["ProductOldPrice"]);
                ob.PImage= reader["ProductImage"].ToString();
                ob.TotalPrice = Convert.ToInt32(reader["TotalPrice"]);
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Delete Products From Shopping Cart
        public bool deleteProductsFromCart(string Ipaddr, int ProductID)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("deleteProductFromCart", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@ipAddr", Ipaddr);
            InsertData.Parameters.AddWithValue("@ProductID", ProductID);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Selctc Total Prices of All products for Ahopping Cart
        public List<ShoppingCartBOL> selectTotalPriceForCart(string ipAddr)
        {
            connection();
            List<ShoppingCartBOL> ls = new List<ShoppingCartBOL>();
            SqlCommand SelectData = new SqlCommand("selectAllProductPricesForCart", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@ipAddr", ipAddr);
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                ShoppingCartBOL ob = new ShoppingCartBOL();
                if (reader["TotalPrice"] == DBNull.Value)
                    empty = string.Empty;
                else
                    ob.TotalPrice = Convert.ToInt32(reader["TotalPrice"]);
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Delete All Products From Shopping Cart
        public bool deleteAllProductsFromCart(string Ipaddr)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("deleteProductsFromShoppingCart", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@ipAddr", Ipaddr);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Delete Products related to specific Category from Cart
        public bool deleteSpecificProductsFromShoppingCart(int ProdID)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("deleteSpecificProductsFromShoppingCart", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@ProductID", ProdID);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }
    }
}
