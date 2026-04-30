<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="CSE445_Final.Staff" %>

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
        <!-- Info Card -->
        <div class="container-fluid mb-3">
            <div class="row">
                <div class="col">
                    <div class="card border-info h-100">
                        <div class="card-body">
                            <h5 class="card-title">Staff Page</h5>
                            <p class="card-text">
                                This page is only accessible to users with Staff roles. It displays a list of all registered users in the system.
                                This page is meant to demonstrate that the TA user has special privileges and can access information 
                                that regular members cannot see. Staff users can create more accounts with Staff roles.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Users Grid -->
        <div class="container-fluid mb-3">
            <div class="row">
                <div class="col">
                    <div class="card border-danger">
                        <h3 class="text-center">Registered Users</h3>
                        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="false" CssClass="table table-striped" EmptyDataText="No users found.">
                            <Columns>
                                <asp:BoundField DataField="Username" HeaderText="Username" />
                                <asp:BoundField DataField="Role" HeaderText="Role" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div class="col">
                    <div class="card border-success">
                        <div class="card-body">
                            <h5 class="card-title">Register new Staff User</h5>
                            <div class="mb-3">
                                <label for="txtNewUser" class="form-label">Username</label>
                                <asp:TextBox ID="txtNewUser" runat="server" CssClass="form-control" Placeholder="Enter Username..." />
                            </div>
                            <div class="mb-3">
                                <label for="txtNewPassword" class="form-label">Password</label>
                                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Enter Password..." />
                            </div>
                            <asp:Label ID="lblSignUpError" runat="server" CssClass="text-danger mb-2" Visible="false" />
                            <asp:Button ID="btnSignUp" runat="server" CssClass="btn btn-outline-primary w-100" Text="Create Account" OnClick="btnSignUp_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
