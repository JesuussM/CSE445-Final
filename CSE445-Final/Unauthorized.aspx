<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Unauthorized.aspx.cs" Inherits="CSE445_Final.Unauthorized" %>

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
                <asp:HyperLink ID="lnkMember" CssClass="nav-link" Text="Member" NavigateUrl="~/Member.aspx" runat="server" />
                <asp:HyperLink ID="lnkStaff" CssClass="nav-link active" Text="Staff" NavigateUrl="~/Staff.aspx" runat="server" />
                </div>
            </div>
            </div>
        </nav>
        <div class="container-fluid mb-3">
            <h1 class="text-danger">Unauthorized Access</h1>
            <p>You do not have permission to access this page. Please log in with an account that has the appropriate privileges.</p>
        </div>
    </form>
</body>
</html>
