using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BOL;
using DAL;

namespace BLL
{
    public class OrderPlacementBLL
    {
        OrderPlacementDAL ob = new OrderPlacementDAL();
        public void selectRegisterationID(string email)
        {
            ob.selectRegisterationID(email);
        }

        public List<ProductBOL> selectProductDetailsForProfile(int ProductID)
        {
            return ob.selectProductDetailsForProfile(ProductID);
        }

        public List<OrderPlacementBOL> selectShippingInfo(int RegisterID)
        {
            return ob.selectShippingInfo(RegisterID);
        }

        public List<OrderPlacementBOL> selectTotalOrders()
        {
            return ob.selectTotalOrders();
        }

        public List<OrderPlacementBOL> selectAllOrders()
        {
            return ob.selectAllOrders();
        }

        public bool approveOrders(int OrderID)
        {
            return ob.approveOrders(OrderID);
        }

        public List<OrderPlacementBOL> searchRegisterIDForOrders(int RegisterID)
        {
            return ob.searchRegisterIDForOrders(RegisterID);
        }

        public List<OrderPlacementBOL> selectAllOrdersForNotification()
        {
            return ob.selectAllOrdersForNotification();
        }

        public List<OrderPlacementBOL> selectOrderForPrintout(int OrderID)
        {
            return ob.selectOrderForPrintout(OrderID);
        }

        public void updateMoneyStatus(int OrderID)
        {
            ob.updateMoneyStatus(OrderID);
        }
    }
}
