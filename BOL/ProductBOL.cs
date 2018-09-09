using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BOL
{
    public class ProductBOL
    {
        public int ProductID { get; set; }
        public int CategoryID { get; set; }
        public string Name { get; set; }
        public int Price { get; set; }
        public int OldPrice { get; set; }
        public string Image { get; set; }
    }
}
