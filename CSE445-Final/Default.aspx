<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CSE445_Final.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Group 31</title>
    <link href="~/Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-body-secondary mb-5">
          <div class="container-fluid">
            <span class="navbar-brand mb-0 h1">Group 31 Web App</span>
            <div class="navbar-collapse">
              <div class="navbar-nav">
                <asp:HyperLink ID="lnkHome" CssClass="nav-link active" Text="Home" NavigateUrl="~/Default.aspx" runat="server" />
                <asp:HyperLink ID="lnkMember" CssClass="nav-link" Text="Member" NavigateUrl="~/Member.aspx" runat="server" />
                <asp:HyperLink ID="lnkStaff" CssClass="nav-link" Text="Staff" NavigateUrl="~/Staff.aspx" runat="server" />
              </div>
            </div>
          </div>
        </nav>

        <div class="container-fluid mb-3">
            <div class="row">
                <div class="col">
                    <!-- Info Card -->
                    <div class="card border-info h-100">
                        <div class="card-body">
                            <h5 class="card-title">What does this application offer?</h5>
                            <p class="card-text">
                                An application where users can easily find the risks of a location, 
                                after entering a zip code, users can see crime stats, natural hazard risks,
                                and an overall safety score for the area. This can be used by people looking
                                to move to a new area, or just want to know the risks of their current location.
                                <br />This application supports two types of users: Members and Staff. Staff users 
                                have the ability to go to the Staff page, while Members do not. Staff users can view a 
                                list of all users and their role as well as create new Staff users.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid mb-3">
            <div class="row">
                 <div class="col-12">
                     <!-- Test Card -->
                     <div class="card border-success">
                         <div class="card-body">
                             <h5 class="card-title">How to test application:</h5>
                             <p class="card-text">
                                 <strong>CAPTCHA Service:</strong> To test the CAPTCHA service, you can try signing 
                                 up with a new username and password. If you enter the correct CAPTCHA text, the account
                                 should be created successfully. If you enter the wrong CAPTCHA text, you should see an 
                                 error message saying the CAPTCHA has failed. You can also click the "Generate new image"
                                 button to get a new image. <strong>Note:</strong> Since you already logged in, cookies are used to bypass 
                                 the login page the next time you visit the site, so you may need to clear your browser cookies to see
                                 the login page again and test the CAPTCHA service.
                             </p>
                             <p class="card-text">
                                 TODO: Add more testing instructions for the other services once they are implemented.
                             </p>
                         </div>
                     </div>
                 </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                 <div class="col-12">
                     <!-- Component Summary Card -->
                     <div class="card border-warning">
                         <div class="card-body">
                             <h5 class="card-title">Application and Components Summary Table</h5>
                             <p>Percentage of overall contribution: Jesus Miranda Marquez: 50%, Emilio Valencia Ballesteros: 50%</p>
                             <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Provider</th>
                                        <th scope="col">Type</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Parameters</th>
                                        <th scope="col">Return</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Resources</th>
                                        <th scope="col">TryIt</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">Jesus Miranda</th>
                                        <td>Aspx page and User control</td>
                                        <td>Login.aspx</td>
                                        <td>N/A</td>
                                        <td>N/A</td>
                                        <td>The login page to sign in or create new member account along with a captcha. Authentication verification.</td>
                                        <td>GUI design and C# code behind GUI. Linked to the Default page</td>
                                        <td>N/A</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Jesus Miranda</th>
                                        <td>Aspx page and User control</td>
                                        <td>Default.aspx</td>
                                        <td>N/A</td>
                                        <td>N/A</td>
                                        <td>The public Default page that calls and links all other pages.</td>
                                        <td>GUI design and C# code behind GUI.</td>
                                        <td>N/A</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Jesus Miranda</th>
                                        <td>Aspx page and User control</td>
                                        <td>Staff.aspx</td>
                                        <td>N/A</td>
                                        <td>N/A</td>
                                        <td>The staff page that allows staff users to view registered users and create staff accounts.</td>
                                        <td>GUI design and C# code behind GUI.</td>
                                        <td>N/A</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Jesus Miranda</th>
                                        <td>Aspx page and User control</td>
                                        <td>Unauthorized.aspx</td>
                                        <td>N/A</td>
                                        <td>N/A</td>
                                        <td>The page that displays when an non-staff user trys to access Staff.aspx.</td>
                                        <td>GUI design. Linked to Staff.aspx</td>
                                        <td>N/A</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Jesus Miranda</th>
                                        <td>Global file</td>
                                        <td>Global.aspx</td>
                                        <td>N/A</td>
                                        <td>N/A</td>
                                        <td>Application start event handler. Ensures xml files are created and TA account exists.</td>
                                        <td>C# code as script in Global.asax file.</td>
                                        <td>N/A</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Jesus Miranda</th>
                                        <td>Helper file</td>
                                        <td>RoleHelper.cs</td>
                                        <td>Username/Password</td>
                                        <td>Role</td>
                                        <td>Various functions that are able to retrieve info on current User. As well as creating member/staff accounts.</td>
                                        <td>C# code as script in file. Edits the member.xml/staff.xml files</td>
                                        <td>N/A</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Jesus Miranda</th>
                                        <td>User file</td>
                                        <td>Staff.xml/Members.xml</td>
                                        <td>N/A</td>
                                        <td>N/A</td>
                                        <td>The file to store user acccounts, separated by role.</td>
                                        <td>XML code in file. Used in RoleHelper.cs</td>
                                        <td>N/A</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Jesus Miranda</th>
                                        <td>Restful</td>
                                        <td>CAPTCHA Service</td>
                                        <td>Length (string)</td>
                                        <td>Image (base64 string)</td>
                                        <td>Image Verifier</td>
                                        <td>Linked to Login page as a required step to creating an account.</td>
                                        <td>
                                            <a href="https://venus.sod.asu.edu/WSRepository/Services/ImageVerifierSvc/TryIt.aspx">TryIt</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Jesus Miranda</th>
                                        <td>Aspx page</td>
                                        <td>ImageProcess.aspx</td>
                                        <td>N/A</td>
                                        <td>N/A</td>
                                        <td>Stores Captcha image</td>
                                        <td>Linked to Captcha Service and Login page to display captcha image</td>
                                        <td>N/A</td>
                                    </tr>
                                </tbody>
                            </table>
                         </div>
                     </div>
                 </div>
            </div>
        </div>
    </form>
    <script src='<%= ResolveUrl("~/Scripts/bootstrap.bundle.min.js") %>'></script>
</body>
</html>
