<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceDirectory.aspx.cs" Inherits="CSE445_Final.ServiceDirectory" %>

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
                <asp:HyperLink ID="lnkHome" CssClass="nav-link" Text="Home" NavigateUrl="~/Default.aspx" runat="server" />
                <asp:HyperLink ID="lnkServiceDirectory" CssClass="nav-link active" Text="Service Directory" NavigateUrl="~/ServiceDirectory.aspx" runat="server" />
                <asp:HyperLink ID="lnkMember" CssClass="nav-link" Text="Member" NavigateUrl="~/Member.aspx" runat="server" />
                <asp:HyperLink ID="lnkStaff" CssClass="nav-link" Text="Staff" NavigateUrl="~/Staff.aspx" Enabled="false" runat="server" />
                </div>
            </div>
            </div>
        </nav>

        <!-- Service Directory table -->
        <div class="container-fluid mb-3">
            <div class="card border-info">
                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Provider</th>
                                <th scope="col">Type</th>
                                <th scope="col">Name</th>
                                <th scope="col">Parameters</th>
                                <th scope="col">Return</th>
                                <th scope="col">Description</th>
                                <th scope="col">TryIt</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">Jesus Miranda</th>
                                <td>Restful</td>
                                <td>CAPTCHA Service</td>
                                <td>
                                    <ul>
                                        <li>Length (string)</li>
                                    </ul>
                                </td>
                                <td>
                                    <ul>
                                        <li>Image (base64 string)</li>
                                    </ul>
                                </td>
                                <td>Image Verifier</td>
                                <td>
                                    <a href="https://venus.sod.asu.edu/WSRepository/Services/ImageVerifierSvc/TryIt.aspx">TryIt</a>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">*Member responsible for component*</th>
                                <td>(WSDL service, RESTful service, DLL function, user control, etc.)</td>
                                <td>*Operation name*</td>
                                <td>*Parameters and their types*</td>
                                <td>*Return type*</td>
                                <td>*Function description*</td>
                                <td>*Link to TryIt page*</td>
                            </tr>
                            <tr>
                                <th scope="row">*Member responsible for component*</th>
                                <td>(WSDL service, RESTful service, DLL function, user control, etc.)</td>
                                <td>*Operation name*</td>
                                <td>*Parameters and their types*</td>
                                <td>*Return type*</td>
                                <td>*Function description*</td>
                                <td>*Link to TryIt page*</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
