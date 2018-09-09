using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BOL
{
    public class ShoppingCartBOL
    {
        public int CartID { get; set; }
        public string ipAddr { get; set; }
        public int ProductID { get; set; }
        public string PName { get; set; }
        public int PQuantity { get; set; }
        public int PPrice { get; set; }
        public string PSize { get; set; }
        public int POPrice { get; set; }
        public string PImage { get; set; }
        public int TotalPrice { get; set; }
    }
}
