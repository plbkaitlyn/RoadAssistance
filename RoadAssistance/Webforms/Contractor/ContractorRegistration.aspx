<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractorRegistration.aspx.cs" Inherits="RoadAssistance.ContractorRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contractor Registration</title>
    <link rel="stylesheet" href="/../css/Registration.css" />
    <script src="/../script/script.js"></script>
</head>
<body>
    
    <div id="contractorRegisterForm">
    <span>Account Details</span><br/>
    <span>Motor tradeperson certificate number:</span><br/><input type="text" id="license" /> 
        <span id="error1" class="errorMessage"></span>
        <br /> <%--Needed for identity verification --%>
    <span>Full Name:</span><br/><input type="text" id="name" /> <br />
    <span>Username:</span><br/><input type="text" id="userName" /> <br />
    <span>Password:</span><br/><input type="password" id="password" />
        <br />
    <span>Email address:</span><br/><input type="text" id="email" /> 
        <span id="emailError" class="errorMessage"></span>
    <br />    
    <br/>

    <span>Bank Details</span><br/>
    <span>Account name:</span><br/><input type="text" id="accName" /> <br />
    <span>BSB:</span><br/><input type="text" id="bsb" /> 
        <span id="error2" class="errorMessage"></span>
    <br />
    <span>Account number:</span><br/><input type="text" id="accNo" />
        <span id="error3" class="errorMessage"></span>
    <br />

    <input type="button" class="signupButton" value="Sign Up" onclick="contractorRegister();" />
    <input type="button" class="backButton" value="Back" onclick="backToLogin();" />
    <br/>
    <span id="error" class="errorMessage"></span>
    </div>

    <form id="form1" runat="server">
        <asp:scriptmanager runat="server">
            <Services>
                <asp:ServiceReference Path="~/RoadService.svc" />
            </Services>
        </asp:scriptmanager>
    </form>
</body>
</html>
