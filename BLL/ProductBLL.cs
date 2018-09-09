using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BOL;
using DAL;

namespace BLL
{
    public class ProductBLL
    {
        ProductsDAL ob = new ProductsDAL();
        public List<ProductBOL> selectAllProducts(int CatID)
        {
            return ob.selectAllProducts(CatID);
        }

        public List<ProductBOL> selectAllProductsForPage(int CatID, int Skip, int totalProducts)
        {
            return ob.selectAllProductsForPage(CatID, Skip, totalProducts);
        }

        public List<ProductBOL> selectTotalProducts(int CatID)
        {
            return ob.selectTotalProducts(CatID);
        }

        public List<ProductBOL> selectPriceForFilteration(int CatID, int LPrice, int HPrice)
        {
            return ob.selectPriceForFilteration(CatID, LPrice, HPrice);
        }

        public List<ProductImagesBOL> selectProductImages(int ProductID)
        {
            return ob.selectProductImages(ProductID);
        }

        public List<ProductBOL> selectProductDetails(int ProductID)
        {
            return ob.selectProductDetails(ProductID);
        }

        public void selectCategoryIDFromProductID(int ProductID)
        {
            ob.selectCategoryIDFromProductID(ProductID);
        }

        public List<ProductBOL> selectSimilarProduct(int CatID)
        {
            return ob.selectSimilarProduct(CatID);
        }

        public void selectTopCategory()
        {
            ob.selectTopCategory();
        }

        public void selectSpecificTopCatID(string Category)
        {
            ob.selectSpecificTopCatID(Category);
        }

        public void selectSpecificCatID(string Category)
        {
            ob.selectSpecificCatID(Category);
        }

        public List<ProductBOL> selectAllProductsForAdminPanel(int CatID)
        {
            return ob.selectAllProductsForAdminPanel(CatID);
        }

        public bool insertProducts(int CatID, string Name, int Price, int OldPrice, string Image)
        {
            return ob.insertProducts(CatID, Name, Price, OldPrice, Image);
        }

        public bool updateProduct(int ProductID, int CatID, string Name, int Price, int OldPrice, string Image)
        {
            return ob.updateProduct(ProductID, CatID, Name, Price, OldPrice, Image);
        }

        public bool deleteProduct(int ProductID)
        {
            return ob.deleteProduct(ProductID);
        }

        public void deleteProductInShoppingCart(int ProductID)
        {
            ob.deleteProductInShoppingCart(ProductID);
        }

        public void deleteProductInOrders(int ProductID)
        {
            ob.deleteProductInOrders(ProductID);
        }

        public void deleteProductInProductImages(int ProductID)
        {
            ob.deleteProductInProductImages(ProductID);
        }

        public List<ProductBOL> searchProductsForAdminPanel(string Name, int CategoryID)
        {
            return ob.searchProductsForAdminPanel(Name, CategoryID);
        }

        public List<ProductImagesBOL> selectAllProductImagesForAdminPanel()
        {
            return ob.selectAllProductImagesForAdminPanel();
        }

        public bool insertProductImages(int ProductID, string Image)
        {
            return ob.insertProductImages(ProductID, Image);
        }

        public bool deleteProductImages(int ImageID)
        {
            return ob.deleteProductImages(ImageID);
        }

        public List<ProductImagesBOL> searchProductImages(int ProductID)
        {
            return ob.searchProductImages(ProductID);
        }

        public List<ProductBOL> selectTotalProducts()
        {
            return ob.selectTotalProducts();
        }

        public List<ProductImagesBOL> selectTotalProductImages()
        {
            return ob.selectTotalProductImages();
        }

    }
}
