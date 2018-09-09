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
    public class ProductsDAL
    {
        string empty, topCategory;
        int CategoryID;
        int Cat_ID;
        int totalProducts;
        string strCon;
        SqlConnection con;

        // SQL Connection.
        private void connection()
        {
            strCon = ConfigurationManager.ConnectionStrings["myCon"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();
        }

        // Selecting all Products.
        public List<ProductBOL> selectAllProducts(int CatID)
        {
            connection();
            List<ProductBOL> ls = new List<ProductBOL>();
            SqlCommand SelectData = new SqlCommand("selectAllProducts", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@CategoryID", CatID);
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
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

        // Selecting all Products for Pagination.
        public List<ProductBOL> selectAllProductsForPage(int CatID, int skip, int totalProducts)
        {
            connection();
            List<ProductBOL> ls = new List<ProductBOL>();
            SqlCommand SelectData = new SqlCommand("selectProductForPagincation", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@CategoryID", CatID);
            SelectData.Parameters.AddWithValue("@Skip", skip);
            SelectData.Parameters.AddWithValue("@totalProducts", totalProducts);
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
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

        // Selecting Total Products
        public List<ProductBOL> selectTotalProducts(int CatID)
        {
            List<ProductBOL> ls = new List<ProductBOL>();
            connection();
            SqlCommand SelectData = new SqlCommand("selectTotalProductsFromEachCategory", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@CategoryID", CatID);
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                ProductBOL ob = new ProductBOL();
                ob.ProductID = Convert.ToInt32(reader["TotalProducts"]);
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Filter for Products.
        public List<ProductBOL> selectPriceForFilteration(int CatID, int LPrice, int HPrice)
        {
            connection();
            List<ProductBOL> ls = new List<ProductBOL>();
            SqlCommand SelectData = new SqlCommand("selectPriceForProductFilteration", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@CategoryID", CatID);
            SelectData.Parameters.AddWithValue("@Lowest", LPrice);
            SelectData.Parameters.AddWithValue("@Highest", HPrice);
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
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

        // Selecting Product Images
        public List<ProductImagesBOL> selectProductImages(int ProductID)
        {
            connection();
            List<ProductImagesBOL> ls = new List<ProductImagesBOL>();
            SqlCommand SelectData = new SqlCommand("selectProductImages", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@ProductID", ProductID);
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
            {
                ProductImagesBOL ob = new ProductImagesBOL();
                ob.ImageID = Convert.ToInt32(reader["ImageID"]);
                ob.ProductID = Convert.ToInt32(reader["ProductID"]);
                ob.Image = reader["Image"].ToString();
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Selecting Product Details
        public List<ProductBOL> selectProductDetails(int ProductID)
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

        // Select Category ID Form Product ID
        public void selectCategoryIDFromProductID(int ProductID)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("selectProductNameFromProductID", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@ProductID", ProductID);
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                CategoryID = Convert.ToInt32(reader["CategoryID"]);
            }
            con.Close();
            reader.Close();
        }

        // Selecting Similar Product
        public List<ProductBOL> selectSimilarProduct(int CatID)
        {
            connection();
            List<ProductBOL> ls = new List<ProductBOL>();
            SqlCommand SelectData = new SqlCommand("selectSimilarProducts", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@catrgoryID", CategoryID);
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
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

        // Selecting Only Top Category.
        public void selectTopCategory()
        {
            connection();
            SqlCommand SelectData = new SqlCommand("selectTopOneCategory", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
                topCategory = reader["Category"].ToString();
            con.Close();
            reader.Close();

        }

        // Select Specific Top Category Id for display Products.
        public void selectSpecificTopCatID(string Category)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("selectSpecificCategoryID", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@Category", topCategory);
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
                Cat_ID = Convert.ToInt32(reader["CategoryID"]);
            con.Close();
            reader.Close();
        }

        // Select Specific Category Id for display Products.
        public void selectSpecificCatID(string Category)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("selectSpecificCategoryID", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@Category", Category);
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
                Cat_ID = Convert.ToInt32(reader["CategoryID"]);
            con.Close();
            reader.Close();
        }

        // Selecting all Products for AdminPanel
        public List<ProductBOL> selectAllProductsForAdminPanel(int CatID)
        {
            connection();
            List<ProductBOL> ls = new List<ProductBOL>();
            SqlCommand SelectData = new SqlCommand("selectAllProductsForAdminPanel", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@CategoryID", Cat_ID);
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
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

        // Insert Products.
        public bool insertProducts(int CatID, string Name, int Price, int OldPrice, string Image)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("insertProducts", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@CatID", Cat_ID);
            InsertData.Parameters.AddWithValue("@Name", Name);
            InsertData.Parameters.AddWithValue("@Price", Price);
            InsertData.Parameters.AddWithValue("@OPrice", OldPrice);
            InsertData.Parameters.AddWithValue("@Image", Image);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Update Products.
        public bool updateProduct(int ProductID, int CatID, string Name, int Price, int OldPrice, string Image)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("updateProducts", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@ProductID", ProductID);
            SelectData.Parameters.AddWithValue("@CatID", Cat_ID);
            SelectData.Parameters.AddWithValue("@Name", Name);
            SelectData.Parameters.AddWithValue("@Price", Price);
            SelectData.Parameters.AddWithValue("@OPrice", OldPrice);
            SelectData.Parameters.AddWithValue("@Image", Image);
            SelectData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Delete Products.
        public bool deleteProduct(int ProductID)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("deleteProduct", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@ProductID", ProductID);
            SelectData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Delete Products from Shopping Cart.
        public void deleteProductInShoppingCart(int ProductID)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("deleteProductFromShoppingCart", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@ProductID", ProductID);
            SelectData.ExecuteNonQuery();
            con.Close();
        }

        // Delete Products from Order Placement Table.
        public void deleteProductInOrders(int ProductID)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("deleteProductFromOrders", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@ProductID", ProductID);
            SelectData.ExecuteNonQuery();
            con.Close();
        }

        // Delete Products from Product Images Table.
        public void deleteProductInProductImages(int ProductID)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("deleteProductFromProductImages", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@ProductID", ProductID);
            SelectData.ExecuteNonQuery();
            con.Close();
        }

        // Search Products
        public List<ProductBOL> searchProductsForAdminPanel(string Name, int CategoryID)
        {
            connection();
            List<ProductBOL> ls = new List<ProductBOL>();
            SqlCommand SelectData = new SqlCommand("searchProductIDInProducts", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@Name", Name);
            SelectData.Parameters.AddWithValue("@CategoryID", Cat_ID);
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
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

        // Selecting all ProductImages for AdminPanel
        public List<ProductImagesBOL> selectAllProductImagesForAdminPanel()
        {
            connection();
            List<ProductImagesBOL> ls = new List<ProductImagesBOL>();
            SqlCommand SelectData = new SqlCommand("selectAllProductImagesForAdminPanel", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
            {
                ProductImagesBOL ob = new ProductImagesBOL();
                ob.ImageID = Convert.ToInt32(reader["ImageID"]);
                ob.ProductID = Convert.ToInt32(reader["ProductID"]);
                ob.Image = reader["Image"].ToString();
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Insert Products Images.
        public bool insertProductImages(int ProductID, string Image)
        {
            connection();
            SqlCommand InsertData = new SqlCommand("insertImageForProducts", con);
            InsertData.CommandType = CommandType.StoredProcedure;
            InsertData.Parameters.AddWithValue("@ProductID", ProductID);
            InsertData.Parameters.AddWithValue("@Image", Image);
            InsertData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Delete Product Images.
        public bool deleteProductImages(int ImageID)
        {
            connection();
            SqlCommand SelectData = new SqlCommand("deleteProductImage", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@ImageID", ImageID);
            SelectData.ExecuteNonQuery();
            con.Close();
            return true;
        }

        // Search Specific Product Images.
        public List<ProductImagesBOL> searchProductImages(int ProductID)
        {
            connection();
            List<ProductImagesBOL> ls = new List<ProductImagesBOL>();
            SqlCommand SelectData = new SqlCommand("searchProductIDInProductImages", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SelectData.Parameters.AddWithValue("@ProductID", ProductID);
            SqlDataReader reader = SelectData.ExecuteReader();
            while (reader.Read())
            {
                ProductImagesBOL ob = new ProductImagesBOL();
                ob.ImageID = Convert.ToInt32(reader["ImageID"]);
                ob.ProductID = Convert.ToInt32(reader["ProductID"]);
                ob.Image = reader["Image"].ToString();
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Select Total Products for Dashboard
        public List<ProductBOL> selectTotalProducts()
        {
            connection();
            List<ProductBOL> ls = new List<ProductBOL>();
            SqlCommand SelectData = new SqlCommand("selectTotalProductsForDashboard", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                ProductBOL ob = new ProductBOL();
                ob.ProductID = Convert.ToInt32(reader["ProductID"]);
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }

        // Selecting Total ProductImages for Dashbpard
        public List<ProductImagesBOL> selectTotalProductImages()
        {
            connection();
            List<ProductImagesBOL> ls = new List<ProductImagesBOL>();
            SqlCommand SelectData = new SqlCommand("selectTotalImagesForDashboard", con);
            SelectData.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = SelectData.ExecuteReader();
            if (reader.Read())
            {
                ProductImagesBOL ob = new ProductImagesBOL();
                ob.ImageID = Convert.ToInt32(reader["ImageID"]);
                ls.Add(ob);
            }
            con.Close();
            reader.Close();
            return ls;
        }
    }
}
