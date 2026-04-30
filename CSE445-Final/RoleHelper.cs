using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Xml.Linq;

namespace CSE445_Final
{
    public class RoleHelper
    {
        private static readonly object FileLock = new object();


        // Get user role by checking both Staff and Members XML files
        public static string GetUserRole(string username)
        {
            if (string.IsNullOrEmpty(username))
            {
                return string.Empty;
            }

            try
            {
                string staffPath = HttpContext.Current.Server.MapPath("~/App_Data/Staff.xml");
                if (File.Exists(staffPath))
                {
                    var doc = XDocument.Load(staffPath);
                    var staff = doc.Descendants("Staff")
                                   .FirstOrDefault(s => (string)s.Element("Username") == username);
                    if (staff != null)
                    {
                        return "Staff";
                    }
                }

                string memberPath = HttpContext.Current.Server.MapPath("~/App_Data/Members.xml");
                if (File.Exists(memberPath)) 
                {
                    var doc = XDocument.Load(memberPath);
                    var member = doc.Descendants("Member")
                                   .FirstOrDefault(m => (string)m.Element("Username") == username);
                    if (member != null)
                    {
                        return "Member";
                    }
                }
            }
            catch
            {

            }

            return string.Empty;
        }

        // Function to check if user is in specified role
        public static bool IsUserInRole(string username, string role)
        {
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(role))
            {
                return false;
            }
            string userRole = GetUserRole(username);
            return string.Equals(userRole, role, StringComparison.OrdinalIgnoreCase);
        }

        public static void AddMember(string username, string password)
        {
            string memberPath = HttpContext.Current.Server.MapPath("~/App_Data/Members.xml");

            lock (FileLock)
            {
                if (File.Exists(memberPath))
                {
                    // Check if username already exists
                    XDocument doc = XDocument.Load(memberPath);
                    bool exists = doc.Descendants("Member")
                                     .Any(m => string.Equals((string)m.Element("Username"), username, StringComparison.OrdinalIgnoreCase));

                    if (exists)
                    {
                        throw new Exception("Username already exists.");
                    }

                    string hashed = HashPassword(password);

                    var user = new XElement("Member",
                        new XElement("Username", username),
                        new XElement("PasswordHash", hashed));

                    // Add new user to xml and save
                    doc.Root.Add(user);
                    doc.Save(memberPath);
                }
            }
        }

        public static void AddStaff(string username, string password)
        {
            string staffPath = HttpContext.Current.Server.MapPath("~/App_Data/Staff.xml");
            lock (FileLock)
            {
                if (File.Exists(staffPath))
                {
                    // Check if username already exists
                    XDocument doc = XDocument.Load(staffPath);
                    bool exists = doc.Descendants("Staff")
                                     .Any(s => string.Equals((string)s.Element("Username"), username, StringComparison.OrdinalIgnoreCase));
                    if (exists)
                    {
                        throw new Exception("Username already exists.");
                    }
                    string hashed = HashPassword(password);
                    var user = new XElement("Staff",
                        new XElement("Username", username),
                        new XElement("PasswordHash", hashed));
                    // Add new user to xml and save
                    doc.Root.Add(user);
                    doc.Save(staffPath);
                }
            }
        }

        // Hashes password using SHA256 and returns base64 string
        public static string HashPassword(string password)
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