using System;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
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
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPassword.Text;

            lblLoginError.Visible = false;

            // Check if user is in xml
            string xmlPath = Server.MapPath("~/App_Data/Users.xml");
            if (File.Exists(xmlPath))
            {
                XDocument doc = XDocument.Load(xmlPath);
                var user = doc.Descendants("User")
                              .FirstOrDefault(u => (string)u.Element("Username") == username);
                if (user != null)
                {
                    string storedPassword = (string)user.Element("PasswordHash");
                    string inputHash = HashPassword(password);

                    // If hashes match log in
                    if (string.Equals(storedPassword, inputHash, StringComparison.OrdinalIgnoreCase))
                    {
                        CurrentUser = username;
                        FormsAuthentication.RedirectFromLoginPage(username, false);
                    }
                    else
                    {
                        lblLoginError.Text = "Incorrect username or password.";
                        lblLoginError.Visible = true;
                        return;
                    }
                }
                else
                {
                    lblLoginError.Text = "Incorrect username or password.";
                    lblLoginError.Visible = true;
                    return;
                }
            } 
            else
            {
                lblLoginError.Text = "Could not find xml file";
                lblLoginError.Visible = true;
                return;
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string newUser = txtNewUser.Text.Trim();
            string newPass = txtNewPassword.Text;

            lblSignUpError.Visible = false;

            // Check for empty fields
            if (string.IsNullOrWhiteSpace(newUser) || string.IsNullOrWhiteSpace(newPass))
            {
                lblSignUpError.Text = "Username and password are required.";
                lblSignUpError.Visible = true;
                return;
            }

            string xmlPath = Server.MapPath("~/App_Data/Users.xml");
            try
            {
                lock (FileLock)
                {
                    if (File.Exists(xmlPath))
                    {
                        // Check if username already exists
                        XDocument doc = XDocument.Load(xmlPath);
                        bool exists = doc.Descendants("User")
                                         .Any(u => string.Equals((string)u.Element("Username"), newUser, StringComparison.OrdinalIgnoreCase));
                        
                        if (exists)
                        {
                            lblSignUpError.Text = "Username already exists.";
                            lblSignUpError.Visible = true;
                            return;
                        }

                        string hashed = HashPassword(newPass);

                        var user = new XElement("User",
                            new XElement("Username", newUser),
                            new XElement("PasswordHash", hashed));

                        // Add new user to xml and save
                        doc.Root.Add(user);
                        doc.Save(xmlPath);

                        lblSignUpError.CssClass = "text-success mb-2";
                        lblSignUpError.Text = "Account created successfully.";
                        lblSignUpError.Visible = true;
                        txtNewUser.Text = "";
                        txtNewPassword.Text = "";
                    }
                    else
                    {
                        lblLoginError.Text = "Could not find xml file";
                        lblLoginError.Visible = true;
                        return;
                    }
                }
            }
            catch (Exception ex)
            {
                lblSignUpError.Text = ex.Message;
                lblSignUpError.Visible = true;
            }
        }

        // Hashes password using SHA256 and returns base64 string
        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(password);
                byte[] hash = sha256.ComputeHash(bytes);
                return Convert.ToBase64String(hash);
            }
        }
    }
}