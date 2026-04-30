<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="CSE445_Final.Member" %>

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
                <asp:HyperLink ID="lnkMember" CssClass="nav-link active" Text="Member" NavigateUrl="~/Member.aspx" runat="server" />
                <asp:HyperLink ID="lnkStaff" CssClass="nav-link" Text="Staff" NavigateUrl="~/Staff.aspx" runat="server" />
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
                            <h5 class="card-title">What does this page offer?</h5>
                            <p class="card-text">
                                This page offers a search feature for users to find recent crimes in their area by entering a ZIP code. 
                                As well their overall safety score and their primary hazard. The results are displayed in a grid format, 
                                showing the date, type of crime, address, and ZIP code. This allows users to stay informed about crime 
                                activity in their neighborhood and take necessary precautions. (Crime Data is from 2025 and below)
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid mb-3">
            <div class="row">
                <!-- ZipCode field -->
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <div class="row align-items-end">
                                <div class="col-4">
                                    <asp:Label ID="lblZip" runat="server" AssociatedControlID="txtZip"><strong>Enter ZIP Code</strong></asp:Label>
                                    <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" />
                                </div>
                                <div class="col-4">
                                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                                    <asp:Label ID="lblSearchError" runat="server" CssClass="text-danger ml-2" Visible="false" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Safety Score and Hazard -->
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <div class="row text-center">
                                <h5><strong>Safety Score:</strong></h5>
                                <asp:Label ID="lblScore" runat="server" />
                            </div>
                            <div class="row text-center">
                                <h5><strong>Primary Hazard:</strong></h5>
                                <asp:Label ID="lblHazard" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Crimes Grid -->
        <div class="container-fluid mb-3">
            <div class="row">
                <div class="col">
                    <div class="card border-danger">
                        <h3 class="text-center">Latest Crimes</h3>
                        <asp:GridView ID="gvCrimes" runat="server" AutoGenerateColumns="false" CssClass="table table-striped" EmptyDataText="No crimes found.">
                            <Columns>
                                <asp:BoundField DataField="OccurredOn" HeaderText="Occured On" DataFormatString="{0:g}" HtmlEncode="false" />
                                <asp:BoundField DataField="Crime" HeaderText="Crime" />
                                <asp:BoundField DataField="Address" HeaderText="Address" />
                                <asp:BoundField DataField="Zipcode" HeaderText="Zipcode" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
