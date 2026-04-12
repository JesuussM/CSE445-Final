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
                <asp:HyperLink ID="lnkServiceDirectory" CssClass="nav-link" Text="Service Directory" NavigateUrl="~/ServiceDirectory.aspx" runat="server" />
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
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                 <div class="col-12">
                     <!-- Test Card -->
                     <div class="card border-warning">
                         <div class="card-body">
                             <h5 class="card-title">How to test application:</h5>
                             <p class="card-text">
                                 <strong>CAPTCHA Service:</strong> To test the CAPTCHA service, you can try signing 
                                 up with a new username and password. If you enter the correct CAPTCHA text, the account
                                 should be created successfully. If you enter the wrong CAPTCHA text, you should see an 
                                 error message saying the CAPTCHA has failed. You can also click the "Generate new image"
                                 button to get a new image.
                             </p>
                             <p class="card-text">
                                 TODO: Add more testing instructions for the other services once they are implemented.
                             </p>
                         </div>
                     </div>
                 </div>
            </div>
        </div>
    </form>
    <script src='<%= ResolveUrl("~/Scripts/bootstrap.bundle.min.js") %>'></script>
</body>
</html>
