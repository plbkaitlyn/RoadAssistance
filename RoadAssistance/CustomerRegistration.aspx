<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerRegistration.aspx.cs" Inherits="RoadAssistance.CustomerRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Register</title>
    <link rel="stylesheet" href="css/Registration.css" />
    <script src="script/script.js"></script>
</head>
<body>
    <div id="customerRegisterForm">
    <span>Account Details</span><br/>
    <span>Username:</span><br/><input type="text" id="userName" /> <br />
    <span>Password:</span><br/><input type="password" id="password" /> <br />
    <span>Email address:</span><br/><input type="text" id="email" /> 
        <span id="error1" class="errorMessage"></span><br />    
    <br/>

    <span>Vehicle Details</span><br/>
        <span>Registration number:</span><br/><input type="text" id="regNo" /> <br />
        <span>Make:</span><br/><input type="text" id="make" /> <br />
        <span>Model:</span><br/><input type="text" id="model" /> <br/> 
        <span>Color:</span><br/><input type="text" id="color" /> <br /> <!--Unncessary-->
    
    <br/>
    <span>Credit Card Details</span><br/>
        <span>Card holder's name:</span><br/><input type="text" id="cardName" /> <br />
        <span>Card number:</span><br/><input type="text" id="cardNo" maxlength="16" title="" placeholder="0000-0000-0000-0000"/> 
            <span id="error2" class="errorMessage"></span><br />
        <span>Expiry date:</span><br/><input type="text" title="" pattern="(?:0[1-9]|1[0-2])/[0-9]{2}" id="expDate" placeholder="MM/YY"/> 
            <span id="dateError" class="errorMessage"></span> <br />
        <span>CVV:</span><br/><input type="text" id="cvv" /> 
            <span id="error3" class="errorMessage"></span><br/> 
        

    <input type="button" class="signupButton" value="Sign Up" onclick="customerRegister();" />
    <input type="button" class="backButton" value="Back" onclick="backToLogin();" /> <br/>

    <span id="error" class="errorMessage"></span>
    </div>
    
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
               <asp:ServiceReference Path="~/RoadService.svc" />
            </Services>
        </asp:ScriptManager>
    </form>
</body>
</html>
