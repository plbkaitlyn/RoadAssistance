function myFunction(x) {
    x.classList.toggle("change");
}

function findWork() {
    RoadService.FindWork(onFindWork);
}

function onFindWork(result) {
    var jobs = JSON.parse(result);
    displayWork(jobs);
}

function displayWork(jobs) {
    var table = document.getElementById("table");

    for (var i = 0; i < jobs.length; i++) {
        var row = document.createElement("div");
        row.setAttribute("class", "tableRow");

        var idCol = document.createElement("div");
        idCol.setAttribute("class", "tableCell workID");
        idCol.innerText = jobs[i].WorkID;
        row.appendChild(idCol);

        var distanceCol = document.createElement("div");
        distanceCol.setAttribute("class", "tableCell distance");
        distanceCol.innerText = jobs[i].Distance.toFixed(1) + " km";
        row.appendChild(distanceCol);

        var customerCol = document.createElement("div");
        customerCol.setAttribute("class", "tableCell customer");
        customerCol.innerText = jobs[i].CustomerName;
        row.appendChild(customerCol);

        var issueCol = document.createElement("div");
        issueCol.setAttribute("class", "tableCell issue");
        issueCol.innerText = jobs[i].IssueType;
        row.appendChild(issueCol);

        var buttonCol = document.createElement("div");
        buttonCol.setAttribute("class", "tableCell");

        var job = jobs[i];

        var viewButton = document.createElement("button");
        viewButton.setAttribute("class", "btn btn-primary viewButton");
        viewButton.innerText = "View Description";
        viewButton.addEventListener("click", function () {
            displayJobDetails(job);
        });
        buttonCol.appendChild(viewButton);
        row.appendChild(buttonCol);
        table.appendChild(row);
    }
}

function displayJobDetails(job) {
    var customerID = job.CustomerID;
    localStorage.setItem('cusID', customerID);
    window.location = "ViewJobDetails.aspx";
}

function onGetJobDetails(result) {
    if (parseJSON(result)) {
        window.location = "ViewJobDetails.aspx";
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

function logout() {
    RoadService.Logout(onLogout);
}

function onLogout() {
    window.location = "../Login.aspx";
}

window.onload = function () {
    findWork();
}