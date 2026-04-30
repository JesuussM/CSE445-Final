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

        // Ensure the Members.xml and Staff.xml files exists on application start
        protected void Application_Start(object sender, EventArgs e)
        {
            CheckMembersXml();
            CheckStaffXml();
        }

        private void CheckMembersXml()
        {
            string path = Server.MapPath("~/App_Data/Members.xml");
            lock (FileLock)
            {
                var dir = Path.GetDirectoryName(path);
                if (!Directory.Exists(dir))
                    Directory.CreateDirectory(dir);
                // If file doesn't exist, create it
                if (!File.Exists(path))
                {
                    var doc = new XDocument(new XElement("Members"));
                    doc.Save(path);
                }
            }
        }

        private void CheckStaffXml()
        {
            string path = Server.MapPath("~/App_Data/Staff.xml");

            lock (FileLock)
            {
                var dir = Path.GetDirectoryName(path);
                if (!Directory.Exists(dir))
                    Directory.CreateDirectory(dir);

                // If file doesn't exist, create it with TA user
                if (!File.Exists(path))
                {
                    var doc = new XDocument(
                        new XElement("Staffs",
                            new XElement("Staff",
                                new XElement("Username", "TA"),
                                new XElement("PasswordHash", RoleHelper.HashPassword("Cse445!"))
                            )
                        )
                    );
                    doc.Save(path);
                }
                else
                {
                    // If file exists but TA is missing, add it
                    var doc = XDocument.Load(path);
                    bool adminExists = doc.Descendants("Staff")
                        .Any(u => string.Equals((string)u.Element("Username"), "TA", StringComparison.OrdinalIgnoreCase));

                    if (!adminExists)
                    {
                        doc.Root.Add(
                            new XElement("Staff",
                                new XElement("Username", "TA"),
                                new XElement("PasswordHash", RoleHelper.HashPassword("Cse445!"))
                            )
                        );
                        doc.Save(path);
                    }
                }
            }
        }
    }
}