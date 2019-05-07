<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RoadAssistance.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Roadside Assistance Service</title>
    <link rel="stylesheet" href="/css/Login.css" />
    <script src="/script/script.js"></script>
</head>
<body>
    <div id="loginForm">
    <span>Username:</span> <br/>
    <input type="text" id="userName"/> <br/><br/>
    <span>Password</span> <br/>
    <input type="password" id="userPassword" /> <br/><br/>
    <input type="button" class="loginButton" value="Login" onclick="login();" />

    <input type="button" class="registerButton" value="Register as a Customer" onclick="registerAsCustomer();" />
    <input type="button" class="registerButton" value="Register as a Contractor" onclick="registerAsContractor();" />
    </div>

    <%--<input type="button" value="Contractor Profile" onclick="window.location='UpdateContractorProfile.aspx'" />--%>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
               <asp:ServiceReference Path="~/RoadService.svc" />
            </Services>
        </asp:ScriptManager>
    </form>
</body>
</html>
