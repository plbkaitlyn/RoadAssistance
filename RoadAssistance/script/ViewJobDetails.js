window.onload = function () {
    var customerID = localStorage['cusID'];
    localStorage.removeItem('cusID'); //get data from FindWork.aspx page
    RoadService.GetJobDetails(Number(customerID), onGetJobDetails);
}
function onGetJobDetails(result) {
    if (parseJSON(result)) {
        var request = JSON.parse(result);
        displayJobDetailsPage(request);
    }
    else {
        var errorPlaceholder = document.getElementById("errorPlaceholder");
        var errorMessage = document.getElementById("displayJobDetailsError");
        if (errorMessage === null) {
            errorMessage = document.createElement("span");
            errorMessage.setAttribute("id", "displayJobDetailsError");
            errorMessage.setAttribute("class", "errorMessage");
            errorPlaceholder.appendChild(document.createElement("br"));
            errorPlaceholder.appendChild(document.createElement("br"));
            errorPlaceholder.appendChild(errorMessage);
        }
        errorMessage.innerText = result;
    }
}

function displayJobDetailsPage(request) {
    document.getElementById("issueText").innerText = request.IssueType;
    document.getElementById("makeText").innerText = request.Make;
    document.getElementById("modelText").innerText = request.Model;
    document.getElementById("customerText").innerText = request.CustomerName;
    document.getElementById("colourText").innerText = request.Color;
    document.getElementById("registrationText").innerText = request.RegNo; 
    document.getElementById("descriptionText").innerText = request.Description;
}

function parseJSON(jsonString) {
    try {
        var obj = JSON.parse(jsonString);
        if (obj && typeof obj === "object")
            return obj;
    }
    catch (e) { }
    return false;
}