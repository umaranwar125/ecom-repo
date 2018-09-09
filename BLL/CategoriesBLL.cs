using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using BOL;

namespace BLL
{
    public class CategoriesBLL
    {
        CategoriesDAL ob = new CategoriesDAL();
        public List<CategoriesBOL> selectingCategories()
        {
            return ob.selectingCategories();
        }

        public bool insertCategory(string Category)
        {
            return ob.insertCategory(Category);
        }

        public bool updateCategory(int CatID, string Category)
        {
            return ob.updateCategory(CatID, Category);
        }

        public List<CategoriesBOL> selectTotalCategories()
        {
            return ob.selectTotalCategories();
        }
    }
}
