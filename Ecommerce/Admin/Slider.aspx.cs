using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOL;
using BLL;

namespace Ecommerce.Admin
{
    public partial class Slider : System.Web.UI.Page
    {
        public List<MainSliderBOL> displaySliderobj;
        protected void Page_Load(object sender, EventArgs e)
        {
            displaySlider();
            queryString();
            sessions();
        }

        // Slider
        private void displaySlider()
        {
            MainSliderBLL ob = new MainSliderBLL();
            displaySliderobj = ob.selectImageSlider();
        }

        protected void AddSlide_Click(object sender, EventArgs e)
        {
            MainSliderBLL ob = new MainSliderBLL();
            if (ImageUpload.HasFile)
            {
                string path = ImageUpload.FileName.ToString();
                ImageUpload.PostedFile.SaveAs(Server.MapPath("~") + "//Images//" + path);
                string str = "Images/" + path.ToString();
                if (yesBtn.Checked)
                {
                    if(ob.insertSlider(TitleText.Value.ToString(), yesBtn.Value.ToString(), btnText.Value.ToString(), btnLink.Value.ToString(), str))
                    {
                        Session["SliderInserted"] = "SliderInserted";
                        Response.Redirect("Slider.aspx");
                    }
                }
                else
                {
                    if (ob.insertSlider(TitleText.Value.ToString(), noBtn.Value.ToString(), btnText.Value.ToString(), btnLink.Value.ToString(), str))
                    {
                        Session["SliderInserted"] = "SliderInserted";
                        Response.Redirect("Slider.aspx");
                    }
                }
            }
            else
                ImageChoose.Visible = true;
        }

        protected void UpdateSlide_Click(object sender, EventArgs e)
        {
            MainSliderBLL ob = new MainSliderBLL();
            if (updImageUpload.HasFile)
            {
                string path = updImageUpload.FileName.ToString();
                updImageUpload.PostedFile.SaveAs(Server.MapPath("~") + "//Images//" + path);
                string str = "Images/" + path.ToString();
                if (updYesBtn.Checked)
                {
                    if (ob.updateSlider(Convert.ToInt32(Request.QueryString["Update-Slider-ID"]), updTitleText.Value.ToString(), updYesBtn.Value.ToString(), updbtnText.Value.ToString(), updbtnLink.Value.ToString(), str))
                    {
                        Session["SliderUpdated"] = "SliderUpdated";
                        Response.Redirect("Slider.aspx");
                    }
                }
                else
                {
                    if (ob.updateSlider(Convert.ToInt32(Request.QueryString["Update-Slider-ID"]), updTitleText.Value.ToString(), updNoBtn.Value.ToString(), updbtnText.Value.ToString(), updbtnLink.Value.ToString(), str))
                    {
                        Session["SliderUpdated"] = "SliderUpdated";
                        Response.Redirect("Slider.aspx");
                    }
                }
            }
            else
                ImageChoose.Visible = true;
        }

        private void sessions()
        {
            if (Session["AdminLoggedin"] == null)
                Response.Redirect("Login.aspx");
            if(Session["SliderInserted"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>displaySuccessMessage();</script>");
                Session.Remove("SliderInserted");
            }
            if(Session["SliderUpdated"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>displaySuccessUpdateMessage();</script>");
                Session.Remove("SliderUpdated");
            }
            if (Session["SliderDeleted"] != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "", "<script>displaySuccessDeleteMessage();</script>");
                Session.Remove("SliderDeleted");
            }
        }

        private void queryString()
        {
            if(Request.QueryString["Update-Slider-ID"] != null)
            {
                AddSlider.Visible = false;
                InsertSlider.Visible = false;
                UpdateSlider.Visible = true;
            }

            if (Request.QueryString["Delete-Slider-ID"] != null)
            {
                MainSliderBLL ob = new MainSliderBLL();
                if (ob.deleteSlider(Convert.ToInt32(Request.QueryString["Delete-Slider-ID"])))
                {
                    Session["SliderDeleted"] = "SliderDeleted";
                    Response.Redirect("Slider.aspx");
                }
            }
        }
    }
}