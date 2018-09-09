using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using BOL;
using BLL;


namespace Ecommerce.Admin
{
    public partial class OrderInvoice : System.Web.UI.Page
    {
        public List<OrderPlacementBOL> displayOrderforPrintObj; 
        public List<ShippingBOL> displayShippingforPrintObj;
        public List<ProductBOL> displayProductforPrintObj;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedin"] == null)
                Response.Redirect("Login.aspx");
            displayOrderforPrint();
        }
        
        protected void DisplayOrder_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Panel1.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }

        private void displayOrderforPrint()
        {
            OrderPlacementBLL ob = new OrderPlacementBLL();
            displayOrderforPrintObj = ob.selectOrderForPrintout(Convert.ToInt32(Request.QueryString["Print"]));
        }
    }
}