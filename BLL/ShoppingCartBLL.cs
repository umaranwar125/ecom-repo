using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using BOL;

namespace BLL
{
    public class ShoppingCartBLL
    {
        ShoppingCartDAL ob = new ShoppingCartDAL();
        public bool insertProductsIntoCart(string Ipaddr, int ProductID, string Name, int Quanitity, int Price, string Size, int OldPrice, string Image, int TotalPrice)
        {
            return ob.insertProductsIntoCart(Ipaddr, ProductID, Name, Quanitity, Price, Size, OldPrice, Image, TotalPrice);
        }

        public List<ShoppingCartBOL> selectTotalProductsFromShoppingCart(string ipAddr)
        {
            return ob.selectTotalProductsFromShoppingCart(ipAddr);
        }

        public bool deleteProductsFromCart(string Ipaddr, int ProductID)
        {
            return ob.deleteProductsFromCart(Ipaddr, ProductID);
        }

        public List<ShoppingCartBOL> selectTotalPriceForCart(string ipAddr)
        {
            return ob.selectTotalPriceForCart(ipAddr);
        }

        public bool deleteAllProductsFromCart(string Ipaddr)
        {
            return ob.deleteAllProductsFromCart(Ipaddr);
        }
    }
}
