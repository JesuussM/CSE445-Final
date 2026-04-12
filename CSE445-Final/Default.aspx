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
                <a class="nav-link active" aria-current="page" href="#">Home</a>
                <a class="nav-link disabled" href="#">Service Directory</a>
                <a class="nav-link disabled" href="#">Member</a>
                <a class="nav-link disabled" href="#">Staff</a>
              </div>
            </div>
          </div>
        </nav>

        <!-- Sign Up Modal -->
        <div class="modal fade" id="signUpModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Sign Up</h5>
              </div>
              <div class="modal-body">
                <div class="container-fluid">
                    <div class="row mb-3">
                        <label for="newUsername" class="form-label">Username</label>
                        <input type="text" class="form-control" id="newUsername" placeholder="Enter username" />
                    </div>
                    <div class="row mb-3">
                        <label for="newPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="newPassword" placeholder="Enter password" />
                    </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Create Account</button>
              </div>
            </div>
          </div>
        </div>

        <!-- Login Modal -->
        <div class="modal fade" id="loginModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Login</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <div class="container-fluid">
                    <div class="row mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" placeholder="Enter username" />
                    </div>
                    <div class="row mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" placeholder="Enter password" />
                    </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Login</button>
              </div>
            </div>
          </div>
        </div>

        <div class="container-fluid mb-3">
            <div class="row">
                <div class="col-8">
                    <!-- Info Card -->
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
                    <!-- Sign Up / Login Card -->
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">How to sign up:</h5>
                            <p class="card-text">
                                Users can sign up by clicking the "Sign Up" button below. If users already 
                                have an account, they can click the "Login" button to sign in.
                            </p>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#signUpModal">Sign Up</button>
                            <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#loginModal">Login</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                 <div class="col-12">
                     <!-- Test Card -->
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
    <script src='<%= ResolveUrl("~/Scripts/bootstrap.bundle.min.js") %>'></script>
</body>
</html>
