<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewJobDetails.aspx.cs" Inherits="RoadAssistance.Webforms.Contractor.ViewJobDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Job Details</title>
    <!-- page stylesheet -->
    <link rel="stylesheet" href="/../css/ViewJobDetails.css" />
    <!-- Bootstrap and Jquery -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="/../script/ViewJobDetails.js"></script>
    
    <!-- Icons -->
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'/>
  </head>
<body>
    <!-- Page Header -->
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
                    <a class="dropdown-item" href="ContractorHomepage.aspx">Dashboard</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="UpdateContractorProfile.aspx">Profile</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Past Transactions</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="../Login.aspx">Logout</a>
                </div>
            </div>
            <a class="navbar-brand" href="Default" id="logo">
                <img src="Images/official_logo.gif" width="60" height="60"/><span id="logoText">Daedalus</span>
            </a>
        </nav>
    </div>
    <div id="spacing"></div>

    <!-- details -->
    <table id="details">
        <tr>
            <td id="jobDetails" colspan="2"><h2><span class="underlinedText">Job Details:</span><span class="icon"><i class="fas fa-toolbox" style='font-size:36px; padding-right:10px;'></i></span></h2></td>
            <td id="carDetails" colspan="2"><h2><span class="underlinedText">Car Details:</span><span class="icon"><i class='fas fa-car' style='font-size:36px; padding-right:10px;'></i></span></h2></td>
        </tr>
        <tr>
            <td class="jobDetailsLabels">Issue type:&nbsp&nbsp</td>
            <td class="borderRight" id="issueText"><span ></span></td>
            <td class="jobDetailsLabels">Make:&nbsp&nbsp</td>
            <td id="makeText"></td>
        </tr>
        <tr>
            <td class="jobDetailsLabels">Location:&nbsp&nbsp</td>
            <td class="borderRight">36 Kenneth St Wollongong</td>
            <td class="jobDetailsLabels">Model:&nbsp&nbsp</td>
            <td id="cardExpiryInput"><span id="modelText"></span><%--Astra--%></td>
        </tr>
        <tr>
            <td class="jobDetailsLabels">Distance:&nbsp&nbsp</td>
            <td class="borderRight">5 Km</td>
            <td class="jobDetailsLabels">Colour:&nbsp&nbsp</td>
            <td id="colourText"><%--Silver--%></td>
        </tr>
        <tr>
            <td class="bottomLabel">Customer:&nbsp&nbsp</td>
            <td id="customerText"><%--Jenny Craig--%></td>
            <td class="bottomLabel">Registration:&nbsp&nbsp</td>
            <td id="registrationText"><%--AQB93W--%></td>
        </tr>
        <tr>
            <td colspan="4" id="descriptionHeader"><h2><span class="underlinedText">Description:<span class="icon"><i class='far fa-clipboard' style='font-size:36px; padding-right:10px;'></i></span></span></h2></td>
        </tr>
        <tr>
            <td colspan="4"><textarea id="descriptionText"></textarea></td>
        </tr>
    </table>
    <table id="bottomTable">
        <tr><td class="text-center" id="buttonTD" colspan="4"><button class="btn btn-primary" id="selectJobButton" type="submit">Select Job</button></td></tr>
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
