using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BOL
{
    public class OrderPlacementBOL
    {
        public int OrderID { get; set; }
        public string IpAddress { get; set; }
        public int ShippingID { get; set; }
        public int RegisterID { get; set; }
        public int ProductID { get; set; }
        public int Quantity { get; set; }
        public string Size { get; set; }
        public DateTime Time { get; set; }
        public string Status { get; set; }
        public string PaymentMethod { get; set; }
        public string PaymentStatus { get; set; }
    }
}
