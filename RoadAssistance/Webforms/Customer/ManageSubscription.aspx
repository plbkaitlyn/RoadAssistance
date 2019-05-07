<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageSubscription.aspx.cs" Inherits="RoadAssistance.Webforms.Customer.ManageSubscription" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Change Payment Plan</title>
</head>

<body>
    <script>

        function backgroundchange(boxnum) {
            if (boxnum == 1) {
                document.getElementById('payg').style.backgroundColor = "lightblue";
                document.getElementById('15pm').style.backgroundColor = "lightgrey";
                document.getElementById('100pa').style.backgroundColor = "lightgrey";
            }
            if (boxnum == 2) {
                document.getElementById('payg').style.backgroundColor = "lightgrey";
                document.getElementById('15pm').style.backgroundColor = "lightblue";
                document.getElementById('100pa').style.backgroundColor = "lightgrey";
            }
            if (boxnum == 3) {
                document.getElementById('payg').style.backgroundColor = "lightgrey";
                document.getElementById('15pm').style.backgroundColor = "lightgrey";
                document.getElementById('100pa').style.backgroundColor = "lightblue";
            }
        }

    </script>
                    <!-------------------------------------------CONTENT START----------------------------------------->
                <div align="center" style="width: 100%; max-width: 1000px">
                    <table style="width: 70%; text-align: center; margin: 0px; padding: 0px;" cellspacing="0" cellpadding="0" border="1">
                        <tbody>
                            <tr>
                                <td id="find-work-image" style="width:30%; height: 147px;" border="0" align="center">
                                    <h3> Your Current Payment Plan Is: </h3>
                                    <br/>
                                    <p id="currentPlan">
                                        <u> Pay As You Go </u>
                                    </p>

                                </td>
                            </tr>
                            <tr style="background: grey">
                                <td id="find-work-image1" style="width:30%; height: 147px; background: grey" border="0" align="center">
                                    <h3> <u>Change Payment Plan? </u></h3>
                                </td>
                            </tr>
                            <tr style="background: grey">

                            </tr>
                        </tbody>
                    </table>
                    <table style="width: 70%;  margin: 0px; padding: 5px; background: grey" border="0" align="center" border="0" ;>
                        <tr>
                            <td id="payg" onclick="backgroundchange(1);" style="width: 33%; text-align: center; background: lightgrey">
                                <br/>
                                <img src="https://img.icons8.com/dusk/64/000000/fiat-500.png"/>
                                <h4>Pay As You Go</h4>
                            </td>
                            <td id="15pm" onclick="backgroundchange(2);" style=" width: 33%; text-align: center; height: 38px; background: lightgrey">
                                <br/>
                                <img src="https://img.icons8.com/dusk/64/000000/the-pope.png" />
                                <h4>$15 Monthly</h4>
                            </td>
                            <td id="100pa" onclick="backgroundchange(3);" style="width: 33%; text-align: center; height: 38px; background: lightgrey">
                                <br/>
                                <img src="https://img.icons8.com/dusk/64/000000/the-pope.png" />
                                <h4>$100 Yearly</h4>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 70%; background: grey">
                        <tr>
                            <td style="width: 100%; text-align: center" align="center">
                                <button>confirm change</button>
                            </td>
                        </tr>
                    </table>
                    </div>
                    <!------------------------------------------CONTENT END-------------------------------------------->
                
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
