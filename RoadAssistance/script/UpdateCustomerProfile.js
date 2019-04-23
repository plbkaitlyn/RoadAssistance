function myFunction(x) {
    x.classList.toggle("change");
}

function saveChanges() {
    var name = document.getElementById("userName");
    var password = document.getElementById("password");
    var email = document.getElementById("email");
    var cardName = document.getElementById("cardName");
    var cardNo = document.getElementById("cardNo");
    var expDate = document.getElementById("expDate").value;
    var expMonth = expDate.split("/")[0];
    var expYear = expDate.split("/")[1];
    var cvv = document.getElementById("cvv");
    var make = document.getElementById("make");
    var model = document.getElementById("model");
    var color = document.getElementById("color");
    var regNo = document.getElementById("regNo");

    var check = true;

    var errorMessage1 = document.getElementById("cardError");
    if (!isInt(cardNo.value)) {
        errorMessage1.innerText = "Please enter a number!";
    }
    else if ((cardNo.value).length != 16) {
        errorMessage1.innerText = "Please enter a 16-digit card number!";
        check = false;
    }
    else {
        errorMessage1.innerText = "";
    }
    var errorMessage2 = document.getElementById("dateError");
    if (!validateDate(expDate)) {
        errorMessage2.innerText = "Please enter the right format MM/YY!";
        check = false;
    }
    else {
        errorMessage2.innerText = "";
    }
    var errorMessage3 = document.getElementById("cvvError");
    if (!isInt(cvv.value)) {
        errorMessage3.innerText = "Please enter a number!";
    }
    else if ((cvv.value).length != 3) {
        errorMessage3.innerText = "Please enter a 3-digit CVV number!";
        check = false;
    }
    else {
        errorMessage3.innerText = "";
    }

    if (isInt(cardNo.value) && isInt(cvv.value) && check == true) {
        RoadService.CustomerUpdateProfile(name.value, password.value, email.value, regNo.value, make.value, model.value, color.value, cardName.value, Number(cardNo.value), parseInt(expMonth), parseInt(expYear), parseInt(cvv.value), onCustomerUpdateProfile);
        //RoadService.CustomerUpdateProfile(Number(cardNo.value), name.value, password.value, email.value, accName.value, parseInt(accNo.value), parseInt(bsb.value), onCustomerUpdateProfile);
    }
}/**/

function onCustomerUpdateProfile(result) {
    if (result === "") {
        window.location.reload;
    }
    else {
        var registerForm = document.getElementById("details");
        var errorMessage = document.getElementById("customerUpdateError");
        if (errorMessage === null) {
            errorMessage = document.createElement("span");
            errorMessage.setAttribute("id", "customerUpdateError");
            errorMessage.setAttribute("class", "errorMessage");
            registerForm.appendChild(document.createElement("br"));
            registerForm.appendChild(document.createElement("br"));
            registerForm.appendChild(errorMessage);
        }
        errorMessage.innerText = result;

    }
}

function isInt(value) {
    return /^\d+$/.test(value);
}

function validateDate(expDate) {
    return /^(0[1-9]|1[0-2])\/\d{2}$/.test(expDate);
}