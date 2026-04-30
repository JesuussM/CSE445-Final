# CSE445-Final

This is Group 31's final project for CSE445. 

Webstrar Link: https://webstrarportal.fulton.asu.edu/sites/website31/Page0/Login.aspx

When you first open the page you will see a login page. You can either login with an existing 
account or create a new account.
(The 'TA' account should automatically be created)

This application supports two types of users: Members and Staff.

Staff users have the ability to go to the Staff page, while Members do not. Staff users can view a 
list of all users and their role as well as create new Staff users.

Once you are logged in, you will be taken to the home page.

Jesus Miranda Local Components:
- Login Page (Login.aspx)
- Default Page (Default.aspx)
- Staff Page (Staff.aspx)
- Unauthorized Page (Unauthorized.aspx)
- Event Handler (Global.asax)
- RoleHelper (RoleHelper.cs)
- User XML (Members.xml & Staff.xml)
- UI Control (Captcha form on Login page)
- ImageProcess (ImageProcess.aspx)
- Recent Crime Data (CrimeData.csv)

Jesus Miranda Remote Service:
- CAPTCHA Service (Restful)