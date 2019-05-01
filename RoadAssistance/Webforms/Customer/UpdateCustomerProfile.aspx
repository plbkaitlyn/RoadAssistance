<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCustomerProfile.aspx.cs" Inherits="RoadAssistance.UpdateCustomerProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="/../css/UpdateCustomerProfile.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="/../script/UpdateCustomerProfile.js"></script>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'/>
    <style type="text/css">
        .auto-style1 {
            text-align: right;
            padding-bottom: 0.5em;
            height: 53px;
        }
        .auto-style2 {
            height: 53px;
        }
    </style>
</head>
<body>
    <div id="navigationBar" class="container-fluid">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" id="header">
            <div class="dropdown">
                <button class="btn btn-primary" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="myFunction(this)">
                    <div class="container">
                        <div class="bar1"></div>
                        <div class="bar2"></div>
                        <div class="bar3"></div>
                    </div>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="CustomerHomepage.aspx">Dashboard</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="UpdateCustomerProfile.aspx">Profile</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="ViewPastTransactions.aspx">Past Transactions</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="../Login.aspx" onclick="logout();">Logout</a>
                </div>
            </div>
            <a class="navbar-brand" href="Default" id="logo">
                <img src="Images/official_logo.gif" width="60" height="60"/><span id="logoText">Daedalus</span>
            </a>
        </nav>
    </div>
    <div id="spacing"></div>
    <table id="details">
        <tr>
            <td id="detailsHeaderLeft" colspan="2"><h2><span class="underlinedText">Personal Details:</span><span class="icon"><i class='far fa-edit' style='font-size:36px'></i></span></h2></td>
            <td id="detailsHeaderRight" colspan="2"><h2><span class="underlinedText">Payment Details:</span><span class="icon"><i class='far fa-edit' style='font-size:36px'></i></span></h2></td>
        </tr>
        <tr>
            <td id="nameLabel">Full Name:&nbsp&nbsp</td>
            <td class="rightBorder"><input runat="server" id="name" type="text"/></td>
            <td id="cardNameLabel">Cardholder's name:&nbsp&nbsp</td>
            <td id="cardNameInput"><input runat="server" id="cardName" type="text"/></td>
        </tr>
        <tr>
            <td id="usernameLabel">Username:&nbsp&nbsp</td>
            <td class="rightBorder"><input runat="server" id="userName" type="text"/></td>
            <td id="cardNumberLabel" class="auto-style2">Card Number:&nbsp&nbsp</td>
            <td id="cardNumberInput" class="auto-style2"><input runat="server" id="cardNo" type="text"/><br/><span id="cardError"></span></td>
        </tr>
        <tr>
            <td class="auto-style1">Email:&nbsp&nbsp</td>
            <td id="emailInput" class="auto-style2"><input runat="server" id="email" type="text" disabled/><br/></td>
            <td id="expiryLabel" class="auto-style2">Card Expiry:&nbsp&nbsp</td>
            <td id="cardExpiryInput" class="auto-style2"><input runat="server" id="expDate" type="text"/><br/><span id="dateError"></span></td>
        </tr>
        <tr>
            <td id="passwordLabel" class="auto-style2">Password:&nbsp&nbsp</td>
            <td id="passwordInput" class="auto-style2"><input runat="server" id="password" type="text"/></td>
            <td id="cvvLabel">CVV:</td>
            <td class="detailsLabelLeftBottom" id="cvvInput"><input runat="server" id="cvv" type="text"/><br/><span id="cvvError"></span></td>
        </tr>

        <tr>
            <td colspan="4" id="carDetails">
                <h2><span class="underlinedText">Car Details:<span class="icon"><i class='far fa-edit' style='font-size:36px'></i></span></span></h2>
            </td>
        </tr>
    </table>
    <table id="bottomTable">
        <tr><td id="makeLabel">Make:</td><td id="makeInput"><input runat="server" id="make" type="text"/></td><td id="colorLabel">Color:&nbsp&nbsp</td><td id="colorInput"><input runat="server" id="color" type="text"/></td></tr>
        <tr><td id="modelLabel">Model:</td><td id="modelInput"><input runat="server" id="model" type="text"/></td><td id="registrationLabel">Registration:</td><td id="registrationInput"><input runat="server" id="regNo" type="text"/></td></tr>
        <tr><td class="text-center" id="buttonTD" colspan="4"><button class="btn btn-primary" id="saveChangesButton" type="submit" onclick="saveChanges();">Save Changes</button></td></tr>
    </table>

    <form id="form1" runat="server">   
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/RoadService.svc" />
            </Services>
        </asp:ScriptManager>    
    </form>
</body>
</html>
