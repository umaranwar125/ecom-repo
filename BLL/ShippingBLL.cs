using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BOL;
using DAL;

namespace BLL
{
    public class ShippingBLL
    {
        ShippingDAL ob = new ShippingDAL();
        public List<ShippingBOL> selectAllShippingAddresses()
        {
            return ob.selectAllShippingAddresses();
        }

        public List<ShippingBOL> searchSpecificShipping(int ShippingID)
        {
            return ob.searchSpecificShipping(ShippingID);
        }
    }
}
