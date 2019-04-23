<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateContractorProfile.aspx.cs" Inherits="Road_Assistance.UpdateContractorProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="css/UpdateContractorProfile.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="Scripts/UpdateContractorProfile.js"></script>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'/>
</head>
<body>
    <div id="navigationBar" class="container-fluid">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" id="header">
            <div class="dropdown">
                <button class="btn btn-secondary" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="myFunction(this)">
                    <div class="container">
                        <div class="bar1"></div>
                        <div class="bar2"></div>
                        <div class="bar3"></div>
                    </div>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="#">Dashboard</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Profile</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Logout</a>
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
            <td id="nameLabel">Name:&nbsp&nbsp</td>
            <td class="rightBorder"><input type="text"/></td>
            <td id="accountNumberLabel">Account Number:&nbsp&nbsp</td>
            <td><input type="text"/></td>
        </tr>
        <tr>
            <td class="detailsLabelLeftBottom">Email:&nbsp&nbsp</td>
            <td id="emailInput"><input type="text"/></td>
            <td class="detailsLabelLeftBottom">Bank BSB:&nbsp&nbsp</td>
            <td id="bsbInput"><input type="text"/></td>
        </tr>
        <tr><td colspan="4" id="workPreferences"><h2><span class="underlinedText">Work Preferences:<span class="icon"><i class='far fa-edit' style='font-size:36px'></i></span></span></h2></td></tr>
    </table>
    <table id="bottomTable">
        <tr><td id="serviceDistanceLabel">Service Distance:</td><td id="serviceDistanceInput"><input type="text"/></td><td id="consultationFeeLabel">Consultation Fee:&nbsp&nbsp</td><td id="consultationFeeInput"><input type="text"/></td></tr>
        <tr><td class="text-center" id="buttonTD" colspan="4"><button class="btn btn-primary" id="saveChangesButton" type="submit">Save Changes</button></td></tr>
    </table>
</body>
</html>
