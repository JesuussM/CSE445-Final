<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CSE445_Final.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        
        <nav class="navbar navbar-expand-lg bg-body-secondary mb-5">
          <div class="container-fluid">
            <span class="navbar-brand mb-0 h1">Group 31 Web App</span>
            <div class="navbar-collapse">
              <div class="navbar-nav">
                <a class="nav-link active" aria-current="page" href="#">Home</a>
                <a class="nav-link" href="#">Service Directory</a>
                <a class="nav-link" href="#">Member</a>
                <a class="nav-link" href="#">Staff</a>
              </div>
            </div>
          </div>
        </nav>

        <div class="container-fluid mb-3">
            <div class="row">
                <div class="col-8">
                    <div class="card text-bg-info h-100">
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
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">How to sign up:</h5>
                            <p class="card-text">
                                Users can sign up by clicking the "Sign Up" button below. If users already 
                                have an account, they can click the "Login" button to sign in.
                            </p>
                            <button class="btn btn-primary">Sign Up</button>
                            <button class="btn btn-secondary">Login</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                 <div class="col-12">
                     <div class="card">
                         <div class="card-body">
                             <h5 class="card-title">How to test application:</h5>
                             <p class="card-text">
                                 TODO: Add testing instructions here.
                             </p>
                         </div>
                     </div>
                 </div>
            </div>
        </div>
    </form>
    <script src="~/Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
