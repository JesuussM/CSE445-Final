<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CSE445_Final.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login</title>
    <link href="~/Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <!-- Login Section -->
                        <h5 class="card-title mb-3">Login</h5>
                        <div class="mb-3">
                            <label for="txtUser" class="form-label">Username</label>
                            <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" Placeholder="Enter Username..." />
                        </div>
                        <div class="mb-3">
                            <label for="txtPassword" class="form-label">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Enter Password..." />
                        </div>
                        <asp:Label ID="lblLoginError" runat="server" CssClass="text-danger mb-2" Visible="false" />
                        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary w-100 mb-3" Text="Login" OnClick="btnLogin_Click" />

                        <h6 class="text-center">or</h6>

                        <!-- Sign Up Section -->
                        <h5 class="card-title mb-3">Sign Up</h5>
                        <div class="mb-3">
                            <label for="txtNewUser" class="form-label">Username</label>
                            <asp:TextBox ID="txtNewUser" runat="server" CssClass="form-control" Placeholder="Enter Username..." />
                        </div>
                        <div class="mb-3">
                            <label for="txtNewPassword" class="form-label">Password</label>
                            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Enter Password..." />
                        </div>
                        <div class="container-fluid mb-3">
                            <div class="row mb-1">
                                <div class="col p-0">
                                    <asp:Image ID="imgCaptcha" runat="server" />
                                </div>
                                <div class="col-8 p-0">
                                    <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control" Placeholder="Enter CAPTCHA..." />
                                </div>
                            </div>
                            <div class="row">
                                <asp:Button ID="btnCaptcha" runat="server" CssClass="btn btn-outline-secondary m-0" Text="Generate new image" />
                            </div>
                        </div>
                        <asp:Label ID="lblSignUpError" runat="server" CssClass="text-danger mb-2" Visible="false" />
                        <asp:Button ID="btnSignUp" runat="server" CssClass="btn btn-outline-primary w-100" Text="Create Account" OnClick="btnSignUp_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src='<%= ResolveUrl("~/Scripts/bootstrap.bundle.min.js") %>'></script>
</body>
</html>