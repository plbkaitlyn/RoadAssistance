function myFunction(x) {
    x.classList.toggle("change");
}

function getPastTransactions() {
    RoadService.GetPastTransactions(onGetPastTransactions);
}

function onGetPastTransactions(result) {
    var transactions = JSON.parse(result);
    displayPastTransactions(transactions);
}

function displayPastTransactions(transactions) {
    var table = document.getElementById("table");
    var index = 0;

    for (var i = 0; i < transactions.length; i++) {
        index++;

        var row = document.createElement("div");
        row.setAttribute("class", "tableRow");

        var idCol = document.createElement("div");
        idCol.setAttribute("class", "tableCell tranID");
        idCol.innerText = transactions[i].TransactionID;
        row.appendChild(idCol);

        var costCol = document.createElement("div");
        costCol.setAttribute("class", "tableCell cost");
        costCol.innerText = "$" + transactions[i].Cost.toFixed(2);
        row.appendChild(costCol);

        var contractorCol = document.createElement("div");
        contractorCol.setAttribute("class", "tableCell contractor");
        contractorCol.innerText = transactions[i].ContractorName;
        row.appendChild(contractorCol);

        var reviewCol = document.createElement("div");
        reviewCol.setAttribute("class", "tableCell review");
        reviewCol.setAttribute("id", "reviewDiv" + index);
        var reviewInput = document.createElement("input");
        reviewInput.setAttribute("type", "text");
        reviewInput.setAttribute("class", "reviewInput");
        reviewInput.setAttribute("id", "review" + index);
        reviewInput.setAttribute("disabled", "true");
        reviewInput.value = transactions[i].Review;
        reviewCol.appendChild(reviewInput);
        row.appendChild(reviewCol);

        var ratingCol = document.createElement("div");
        ratingCol.setAttribute("class", "tableCell rating");
        var ratingInput = document.createElement("input");
        ratingInput.setAttribute("type", "text");
        ratingInput.setAttribute("class", "ratingInput");
        ratingInput.setAttribute("id", "rating" + index);
        ratingInput.setAttribute("disabled", "true");
        ratingInput.value = transactions[i].Rating;
        ratingCol.appendChild(ratingInput);
        row.appendChild(ratingCol);

        var buttonCol = document.createElement("div");
        buttonCol.setAttribute("class", "tableCell");

        var button = document.createElement("button");
        button.setAttribute("class", "btn btn-primary editButton");
        button.innerText = "Edit";
        var edit = true;
        button.addEventListener("click", function () {
            if (edit) {
                edit = false;
                button.innerText = "Save";
                reviewInput.disabled = false;
                reviewInput.style.backgroundColor = "#729393";
                ratingInput.disabled = false;
                ratingInput.style.backgroundColor = "#729393";
                /*var reviews = document.getElementsByClassName("reviewInput");
                for (var k = 0; k < reviews.length; k++) {
                    reviews[k].disabled = false;
                    //reviews[k].style.backgroundColor = "#2D4E4E";
                }*/

                /*
                reviewCol.addEventListener("mouseover", function () {
                    var input = document.getElementById("review" + index);
                    console.log("Input: " + reviewInput);
                    reviewInput.style.backgroundColor = "blue";
                    
                });
                reviewCol.addEventListener("mouseout", function () {
                    reviewInput.style.backgroundColor = "#172547";
                });
                */
            }
            else {
                edit = true;
                button.innerText = "Edit";
                button.addEventListener("click", save(index));
            }
        });
        buttonCol.appendChild(button);

        row.appendChild(buttonCol);
        table.appendChild(row);
    }
}
function save(index) {
    savePastTransaction(index);
    alert("Successfully saved");
}
function savePastTransaction(index) {
    var review = document.getElementById("review" + index);
    review.disabled = true;
    review.style.backgroundColor = "";
    var rating = document.getElementById("rating" + index);    
    rating.disabled = true;
    rating.style.backgroundColor = "";

    if (Number(rating.value)) {
        RoadService.SavePastTransaction(review.value, parseFloat(rating.value), onSavePastTransaction);
    }
}

function onSavePastTransaction(result) {
    if (result === "") {
        window.location.reload;
    }
    else {
        var table = document.getElementById("table");
        var errorMessage = document.getElementById("saveTransactionError");
        if (errorMessage === null) {
            errorMessage = document.createElement("span");
            errorMessage.setAttribute("id", "saveTransactionError");
            errorMessage.setAttribute("class", "errorMessage");
            table.appendChild(document.createElement("br"));
            table.appendChild(document.createElement("br"));
            table.appendChild(errorMessage);
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
    getPastTransactions();
}

/*
function displayPastTransactions(transactions) {
    var table = document.getElementById("tableBody");

    for (var i = 0; i < transactions.length; i++) {
        var row = document.createElement("tr");
        row.setAttribute("class", "tableRow");

        var idCol = document.createElement("td");
        idCol.setAttribute("scope", "row");
        idCol.innerText = transactions[i].TransactionID;
        row.appendChild(idCol);

        var costCol = document.createElement("td");
        costCol.innerText = "$" + transactions[i].Cost;
        row.appendChild(costCol);

        var contractorCol = document.createElement("td");
        var nameInput = document.createElement("input");
        nameInput.setAttribute("type", "text");
        nameInput.setAttribute("class", "contractorInput");
        nameInput.setAttribute("disabled", "true");
        nameInput.value = transactions[i].ContractorName;
        row.appendChild(contractorCol);

        var reviewCol = document.createElement("td");
        var reviewInput = document.createElement("input");
        reviewInput.setAttribute("type", "text");
        reviewInput.setAttribute("class", "reviewInput");
        reviewInput.setAttribute("disabled", "true");
        reviewInput.value = transactions[i].Review;
        row.appendChild(reviewCol);

        var ratingCol = document.createElement("td");
        ratingCol.innerText = transactions[i].Rating;
        row.appendChild(ratingCol);

        var button = document.createElement("button");
        button.setAttribute("class", "btn btn-primary editButton");
        button.innerText = "Edit";
        button.addEventListener("click", function () {
            document.getElementsByClassName("contractorInput").disabled = false;
            document.getElementsByClassName("reviewInput").disabled = false;
            document.getElementsByClassName("ratingInput").disabled = false;
        });

        row.appendChild(button);

        table.appendChild(row);
    }
}*/
