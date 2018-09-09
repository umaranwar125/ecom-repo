using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BOL;
using DAL;

namespace BLL
{
    public class NewsletterBLL
    {
        NewsletterDAL obj = new NewsletterDAL();
        public bool insertNewsletterData(string email)
        {
            return obj.insertNewsletterData(email);
        }

        public List<NewsletterBOL> selectAllNewsletter()
        {
            return obj.selectAllNewsletter();
        }

        public bool deleteNewsletterEmail(int ID)
        {
            return obj.deleteNewsletterEmail(ID);
        }

        public List<NewsletterBOL> selectTotalNewsletter()
        {
            return obj.selectTotalNewsletter();
        }
    }
}
