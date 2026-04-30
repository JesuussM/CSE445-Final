using System;
using System.Collections.Generic;
using System.Data;
using System.EnterpriseServices;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSE445_Final
{
    public partial class Staff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = User?.Identity?.Name ?? string.Empty;

            // Check if user is in "Staff" role
            if (!RoleHelper.IsUserInRole(username, "Staff"))
            {
                Response.Redirect("~/Unauthorized.aspx");
                return;
            }

            if (!IsPostBack)
            {
                BindUsers();
            }
        }
        
        // Bind Users from XML to Grid
        private void BindUsers()
        {
            try
            {
                string memberPath = Server.MapPath("~/App_Data/Members.xml");
                string staffPath = Server.MapPath("~/App_Data/Staff.xml");

                var dataSet = new DataTable();
                dataSet.Columns.Add("Username", typeof(string));
                dataSet.Columns.Add("Role", typeof(string));

                Action<string, string> addUsersFromXml = (path, role) =>
                {
                    if (!File.Exists(path))
                    {
                        return;
                    }

                    var data = new DataSet();
                    data.ReadXml(path);

                    DataTable usersTable = null;
                    if (data.Tables.Contains("Member")) usersTable = data.Tables["Member"];
                    else if (data.Tables.Contains("Staff")) usersTable = data.Tables["Staff"];
                    else if (data.Tables.Contains("User")) usersTable = data.Tables["User"];
                    else if (data.Tables.Count > 0) usersTable = data.Tables[0];

                    if (usersTable == null || !usersTable.Columns.Contains("Username")) return;

                    foreach (DataRow row in usersTable.Rows)
                    {
                        string name = Convert.ToString(row["Username"]);
                        if (string.IsNullOrWhiteSpace(name)) continue;
                        DataRow existing = null;
                        foreach (DataRow item in dataSet.Rows)
                        {
                            if (string.Equals(Convert.ToString(item["Username"]), name, StringComparison.OrdinalIgnoreCase))
                            {
                                existing = item;
                                break;
                            }
                        }

                        if (existing != null)
                        {
                            if (!string.Equals(Convert.ToString(existing["Role"]), "Staff", StringComparison.OrdinalIgnoreCase)
                                && string.Equals(role, "Staff", StringComparison.OrdinalIgnoreCase))
                            {
                                existing["Role"] = role;
                            }
                        }
                        else
                        {
                            var newRow = dataSet.NewRow();
                            newRow["Username"] = name;
                            newRow["Role"] = role;
                            dataSet.Rows.Add(newRow);
                        }
                    }

                };

                addUsersFromXml(memberPath, "Member");
                addUsersFromXml(staffPath, "Staff");

                if (dataSet.Rows.Count > 0)
                {
                    gvUsers.DataSource = dataSet;
                }
                else
                {
                    gvUsers.DataSource = null;
                }

                gvUsers.DataBind();
            }
            catch (Exception ex)
            {
                gvUsers.DataSource = null;
                gvUsers.DataBind();
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


            // Create new staff account
            try
            {
                RoleHelper.AddStaff(newUser, newPass);
                lblSignUpError.CssClass = "text-success mb-2";
                lblSignUpError.Text = "Account created successfully.";
                lblSignUpError.Visible = true;
                txtNewUser.Text = "";
                txtNewPassword.Text = "";
            }
            catch (Exception ex)
            {
                lblSignUpError.Text = ex.Message;
                lblSignUpError.Visible = true;
                return;
            }
        }
    }
}