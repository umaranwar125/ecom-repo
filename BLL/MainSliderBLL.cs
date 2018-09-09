using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BOL;
using DAL;

namespace BLL
{
    public class MainSliderBLL
    {
        MainSliderDAL ob = new MainSliderDAL();
        public List<MainSliderBOL> selectImageSlider()
        {
            return ob.selectImageSlider();
        }

        public bool insertSlider(string text, string btn, string btnText, string btnLink, string Image)
        {
            return ob.insertSlider(text, btn, btnText, btnLink, Image);
        }

        public bool updateSlider(int SliderID, string text, string btn, string btnText, string btnLink, string Image)
        {
            return ob.updateSlider(SliderID, text, btn, btnText, btnLink, Image);
        }

        public bool deleteSlider(int SliderID)
        {
            return ob.deleteSlider(SliderID);
        }
    }
}
