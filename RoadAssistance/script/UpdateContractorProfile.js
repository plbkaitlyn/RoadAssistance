function myFunction(x) {
    x.classList.toggle("change");
}

function saveChanges() {
    var license = document.getElementById("license");
    var name = document.getElementById("userName");
    var password = document.getElementById("password");
    var email = document.getElementById("email");
    var accName = document.getElementById("accName");
    var accNo = document.getElementById("accNo");
    var bsb = document.getElementById("bsb");
    
    var check = true;

    var errorMessage1 = document.getElementById("error1");

    if (!isInt(license.value)) {
        errorMessage1.innerText = "Please enter a number!";
    }
    else {
        errorMessage1.innerText = "";
    }
    var errorMessage2 = document.getElementById("error2");
    if (!isInt(bsb.value)) {
        errorMessage2.innerText = "Please enter a number!";
    }
    else if ((bsb.value).length != 6) {
        errorMessage2.innerText = "Please enter a 6-digit BSB number!";
        check = false;
    }
    else {
        errorMessage2.innerText = "";
    }
    var errorMessage3 = document.getElementById("error3");
    if (!isInt(accNo.value)) {
        errorMessage3.innerText = "Please enter a number!";
    }
    else if ((accNo.value).length != 9) {
         errorMessage3.innerText = "Please enter a 9-digit account number!";
         check = false;
    }
    else {
         errorMessage3.innerText = "";
    }

    if (isInt(license.value) && isInt(accNo.value) && isInt(bsb.value) && check == true) {
        RoadService.ContractorUpdateProfile(parseInt(license.value), name.value, password.value, email.value, accName.value, parseInt(accNo.value), parseInt(bsb.value), onContractorUpdateProfile);
    }
}/**/

function onContractorUpdateProfile(result) {
    if (result === "") {
        window.location.reload;
    }
    else {
        var registerForm = document.getElementById("details");
        var errorMessage = document.getElementById("contractorUpdateError");
        if (errorMessage === null) {
            errorMessage = document.createElement("span");
            errorMessage.setAttribute("id", "contractorUpdateError");
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
    //return !isNaN(value) &&
    //    parseInt(Number(value)) == value &&
    //    !isNaN(parseInt(value, 10));
}

function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}