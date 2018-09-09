using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BOL
{
    public class ShippingBOL
    {
        public int ShippingID { get; set; }
        public int RegisterID { get; set; }
        public string Email { get; set; }
        public long Mobile { get; set; }
        public string FName { get; set; }
        public string LName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string PostalCode { get; set; }
        public int Price { get; set; }
        public int ShippingCharges { get; set; }
    }
}
