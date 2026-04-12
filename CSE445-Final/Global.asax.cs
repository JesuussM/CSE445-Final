using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Xml.Linq;

namespace CSE445_Final
{
    public class Global : System.Web.HttpApplication
    {
        private static readonly object FileLock = new object();

        // Ensure the Users.xml file exists on application start
        protected void Application_Start(object sender, EventArgs e)
        {
            CheckUsersXml();
        }

        private void CheckUsersXml()
        {
            string path = Server.MapPath("~/App_Data/Users.xml");

            lock (FileLock)
            {
                var dir = Path.GetDirectoryName(path);
                if (!Directory.Exists(dir))
                    Directory.CreateDirectory(dir);

                // If file doesn't exist, create it with TA user
                if (!File.Exists(path))
                {
                    var doc = new XDocument(
                        new XElement("Users",
                            new XElement("User",
                                new XElement("Username", "TA"),
                                new XElement("PasswordHash", Login.HashPassword("Cse445!"))
                            )
                        )
                    );
                    doc.Save(path);
                }
                else
                {
                    // If file exists but TA is missing, add it
                    var doc = XDocument.Load(path);
                    bool adminExists = doc.Descendants("User")
                        .Any(u => string.Equals((string)u.Element("Username"), "TA", StringComparison.OrdinalIgnoreCase));

                    if (!adminExists)
                    {
                        doc.Root.Add(
                            new XElement("User",
                                new XElement("Username", "TA"),
                                new XElement("PasswordHash", Login.HashPassword("Cse445!"))
                            )
                        );
                        doc.Save(path);
                    }
                }
            }
        }
    }
}