using System;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Xml.Linq;

namespace CSE445_Final
{
    public partial class Login : System.Web.UI.Page
    {
        private static readonly object FileLock = new object();
        public static string CurrentUser { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            // If already authenticated, send to default page
            if (Request.IsAuthenticated)
            {
                Response.Redirect(FormsAuthentication.DefaultUrl);
            }
            else
            {
                lblLoginError.Visible = false;
                lblSignUpError.Visible = false;

                imgCaptcha.ImageUrl = "~/ImageProcess.aspx";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPassword.Text;

            lblLoginError.Visible = false;

            // Check if user is in staff.xml
            string staffPath = Server.MapPath("~/App_Data/Staff.xml");
            string memberPath = Server.MapPath("~/App_Data/Members.xml");

            // Check if at least one of the files exists before trying to read
            if (!File.Exists(staffPath) && !File.Exists(memberPath))
            {
                lblLoginError.Text = "Could not find xml file";
                lblLoginError.Visible = true;
                return;
            }

            XElement found = null;
            string foundRole = string.Empty;
            string storedPassword = null;

            if (File.Exists(staffPath))
            {
                var staffDoc = XDocument.Load(staffPath);
                found = staffDoc.Descendants("Staff")
                                .FirstOrDefault(u => string.Equals((string)u.Element("Username"), username, StringComparison.OrdinalIgnoreCase));
                if (found != null)
                {
                    foundRole = "Staff";
                    storedPassword = (string)found.Element("PasswordHash");
                }
            }

            if (found == null && File.Exists(memberPath))
            {
                var memberDoc = XDocument.Load(memberPath);
                found = memberDoc.Descendants("Member")
                                 .FirstOrDefault(u => string.Equals((string)u.Element("Username"), username, StringComparison.OrdinalIgnoreCase));
                if (found != null)
                {
                    foundRole = "Member";
                    storedPassword = (string)found.Element("PasswordHash");
                }
            }

            if (found == null)
            {
                lblLoginError.Text = "Incorrect username or password.";
                lblLoginError.Visible = true;
                return;
            }

            string inputHash = RoleHelper.HashPassword(password);
            if (!string.Equals(storedPassword, inputHash, StringComparison.OrdinalIgnoreCase))
            {
                lblLoginError.Text = "Incorrect username or password.";
                lblLoginError.Visible = true;
                return;
            }

            CurrentUser = username;
            string role = !string.IsNullOrEmpty(foundRole) ? foundRole : RoleHelper.GetUserRole(username);

            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                1,
                username,
                DateTime.Now,
                DateTime.Now.AddMinutes(30),
                false,
                role ?? string.Empty
            );
            string encryptedTicket = FormsAuthentication.Encrypt(ticket);
            var authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket)
            {
                HttpOnly = true,
            };
            Response.Cookies.Add(authCookie);

            string redirectUrl = FormsAuthentication.GetRedirectUrl(username, false);
            Response.Redirect(redirectUrl);
        }

        protected void btnCaptcha_Click(object sender, EventArgs e)
        {
            CAPTCHAService.ServiceClient fromService = new CAPTCHAService.ServiceClient("BasicHttpBinding_IService");
            string userLength = "5";
            Session["userLength"] = userLength;
            String myString = fromService.GetVerifierString(userLength);
            Session["generatedString"] = myString;
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string newUser = txtNewUser.Text.Trim();
            string newPass = txtNewPassword.Text;
            string captcha = txtCaptcha.Text.Trim();

            lblSignUpError.Visible = false;

            // Check for empty fields
            if (string.IsNullOrWhiteSpace(newUser) || string.IsNullOrWhiteSpace(newPass))
            {
                lblSignUpError.Text = "Username and password are required.";
                lblSignUpError.Visible = true;
                return;
            }
            else if (string.IsNullOrWhiteSpace(captcha))
            {
                lblSignUpError.Text = "Complete the CAPTCHA";
                lblSignUpError.Visible = true;
                return;
            }

            if (!Session["generatedString"].Equals(captcha))
            {
                lblSignUpError.Text = "CAPTCHA Verification failed.";
                lblSignUpError.Visible = true;
                txtCaptcha.Text = "";
                return;
            }

            try
            {
                RoleHelper.AddMember(newUser, newPass);
                lblSignUpError.CssClass = "text-success mb-2";
                lblSignUpError.Text = "Account created successfully.";
                lblSignUpError.Visible = true;
                txtNewUser.Text = "";
                txtNewPassword.Text = "";
                txtCaptcha.Text = "";
            } catch (Exception ex)
            {
                lblSignUpError.Text = ex.Message;
                lblSignUpError.Visible = true;
                return;
            }
        }
    }
}