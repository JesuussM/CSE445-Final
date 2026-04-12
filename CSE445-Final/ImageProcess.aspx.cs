using System;
using System.IO;
using System.Drawing.Imaging;

namespace CSE445_Final
{
    public partial class ImageProcess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Clear();
            CAPTCHAService.ServiceClient fromService = new CAPTCHAService.ServiceClient("BasicHttpsBinding_IService");

            string myString;
            string userLength = "5";
            if (Session["generatedString"] == null)
            {
                myString = fromService.GetVerifierString(userLength);
                Session["generatedString"] = myString;
            }
            else
            {
                myString = Session["generatedString"].ToString();
            }

            Stream myStream = fromService.GetImage(myString);
            System.Drawing.Image myImage = System.Drawing.Image.FromStream(myStream);
            Response.ContentType = "image/jpeg";
            myImage.Save(Response.OutputStream, ImageFormat.Jpeg);
        }
    }
}