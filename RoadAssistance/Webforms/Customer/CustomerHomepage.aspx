<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerHomepage.aspx.cs" Inherits="RoadAssistance.CustomerHomepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Homepage</title>
    <!-- page stylesheet -->   
    <link rel="stylesheet" href="/../css/CustomerHomepage.css" />
    <!-- Bootstrap and Jquery -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="/../script/UpdateContractorProfile.js"></script>
    <!-- Icons -->
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'/>
</head>
<body>
    <!-- Page Header -->
    <div id="navigationBar" class="container-fluid">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" id="header">
            <div class="dropdown">
                <button class="btn btn-outline-primary" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="myFunction(this)">
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

    Welcome to Customer Homepage! <br/><br/>
    <input type="button" class="logoutButton" value="Logout" onclick="logout();" /> <br/>

    <!-- Tables -->
    <div id="tableWrapper">
    <a href="UpdateCustomerProfile.aspx">
    <div class="wrapper" id="updateDetails">      
        <div class="parent" id="update-details-image">
            <i class='fas fa-user-edit' style='font-size:55px; color:lightgray; margin-top: 15px;'></i>
        </div>
        <div class="text"><h4>Update My Details</h4></div>       
    </div>
    </a>

    <a href="#">
    <div class="wrapper">
        <div class="parent" id="manage-subscription-image">
            <i class="fas fa-toolbox" style='font-size:55px; color:lightgray; margin-top: 15px;'></i>
        </div>
        <div class="text"><h4>Manage Subscription</h4></div>
    </div>
    </a>

    <a href="#">
    <div class="wrapper" id="requestService">
        <div class="parent" id="request-service-image">
            <i class="fas fa-tools" style='font-size:55px; color:lightgray; margin-top: 15px;'></i>
        </div>
        <div class="text"><h4>Request Service</h4></div>
    </div>
    </a>
    </div>
        <%--
            <table style="width: 80%;" border="0" id="topTable">
            <tbody>
            <tr>           
                <td id="update-details-image" style="background-color:#172547; ">
                <a href="UpdateCustomerProfile.aspx">
                    <span class="icon"><i class='fas fa-user-edit' style='font-size:55px; color:lightgray;'></i></span>
                </a>
                </td>
                <td style="width:5%; height:50px;"></td>
                <td id="manage-subscription-image" style=" background-color:#172547; ">
                <a href="#">
                    <span class="icon"><i class="fas fa-toolbox" style='font-size:55px; color:lightgray;'></i></span>
                </a>
                </td>
            </tr>
                <tr></tr>
            <tr>
                <td id="update-details-text"> 
                    <h4>Update My Details</h4>
                </td>
                <td style="width:5%"></td>
                <td id="manage-subscription-text"> 
                    <h4>Manage Subscription</h4>
                </td>
            </tr>
        </tbody>
        </table>

        <table id="middleTable" style="width: 60%; text-align: center" border="0">
            <tr>
                <td id="request-service-image">
                <span class="icon"><i class="fas fa-tools" style='font-size:55px; color:lightgray;'></i></span>
                </td>
            </tr>
            <tr>
                <td id="request-service-text" style="width:70%; text-align: center; background-color:lightgray;">   
                    <h4>Request Service</h4> 
                </td>
            </tr>
        </table>--%>

    <form id="form1" runat="server">  
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
               <asp:ServiceReference Path="~/RoadService.svc" />
            </Services>
        </asp:ScriptManager>
    </form>
</body>
</html>
