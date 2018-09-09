using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using BOL;

namespace BLL
{
    public class CheckoutBLL
    {
        CheckoutDAL ob = new CheckoutDAL();
        public void selectRegisterationID(string email)
        {
            ob.selectRegisterationID(email);
        }

        public bool insertShippingInformation(int RegID, string Email, long Mobile, string FNmae, string LName, string Address, string City, string PostalCode, int TotalPrice, int ShippingCharges)
        {
            return ob.insertShippingInformation(RegID, Email, Mobile, FNmae, LName, Address, City, PostalCode, TotalPrice, ShippingCharges);
        }

        public void selectShippingID(int RegID)
        {
            ob.selectShippingID(RegID);
        }

        public bool insertInfoToOrderTable(string Ipaddr, int ShipID, int RegID, int ProductID, int Quantity, string Size, DateTime time, string PaymentMethod)
        {
            return ob.insertInfoToOrderTable(Ipaddr, ShipID, RegID, ProductID, Quantity, Size, time, PaymentMethod);
        }

        public List<OrderPlacementBOL> selectOrderIdForMoneyStatusUpdation(int shippingID, string IpAddress, int RegisterID)
        {
            return ob.selectOrderIdForMoneyStatusUpdation(shippingID, IpAddress, RegisterID);
        }
    }
}
