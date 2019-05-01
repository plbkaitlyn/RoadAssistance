<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FindWork.aspx.cs" Inherits="RoadAssistance.Webforms.Contractor.FindWork" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Find Work</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="/../css/FindWork.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="/../script/FindWork.js"></script>
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
                    <a class="dropdown-item" href="ContractorHomepage.aspx">Dashboard</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="UpdateContractorProfile.aspx">Profile</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Ratings and Reviews</a>
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

    <div id="table" class="table table-hover table-dark">
        <div class="tableRow">
            <div class="tableHead workID">#</div>
            <div class="tableHead distance">Distance:</div>
            <div class="tableHead customer">Customer Name:</div>
            <div class="tableHead issue">Issue type:</div>
        </div>
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
