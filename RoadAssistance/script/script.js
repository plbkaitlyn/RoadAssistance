function login() {
    var username = document.getElementById("userName");
    var password = document.getElementById("userPassword");
    RoadService.Login(username.value, password.value, onLogin);
}

function onLogin(result) {
    if (result === "contractor") {
        window.location = "Contractor/ContractorHomepage.aspx";
    }
    else if (result === "customer") {
       window.location = "Customer/CustomerHomepage.aspx";
    }
    else {
        var loginForm = document.getElementById("loginForm");
        var errorMessage = document.getElementById("loginError");
        if (errorMessage === null) {
            errorMessage = document.createElement("span");
            errorMessage.setAttribute("id", "loginError");
            errorMessage.setAttribute("class", "errorMessage");
            loginForm.appendChild(document.createElement("br"));
            loginForm.appendChild(document.createElement("br"));
            loginForm.appendChild(errorMessage);
        }
        errorMessage.innerText = result;
    }
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

function logout() {
    RoadService.Logout(onLogout);
}

function onLogout() {
    window.location = "../Login.aspx";
}


function registerAsCustomer() {
    window.location = "Customer/CustomerRegistration.aspx";
}

function registerAsContractor() {
    window.location = "Contractor/ContractorRegistration.aspx";
}

function backToLogin() {
    window.location = "../Login.aspx";
}

function customerRegister() {
    var fullname = document.getElementById("name");
    var username = document.getElementById("userName");
    var password = document.getElementById("password");
    var email = document.getElementById("email");
    var regNo = document.getElementById("regNo");
    var make = document.getElementById("make");
    var model = document.getElementById("model");
    var color = document.getElementById("color");
    var cardName = document.getElementById("cardName");
    var cardNo = document.getElementById("cardNo");
    var expDate = document.getElementById("expDate").value;
    var expMonth = expDate.split("/")[0];
    var expYear = expDate.split("/")[1];
    
    var cvv = document.getElementById("cvv");
    
    var check = true;

    var errorMessage = document.getElementById("error");
    if (fullname.value == "" || username.value == "" || password.value == "" || email.value == "" || regNo.value == "" || make.value == "" || model.value == "" ||
        color.value == "" || cardName.value == "" || cardNo.value == "" || expDate == "" || cvv.value == "") {
        errorMessage.innerText = "No field is empty!";
        check = false;
    }
    else {
        errorMessage.innerText = "";
        
        var errorMessage1 = document.getElementById("error1");
        if (!validateEmail(email.value)) {
            errorMessage1.innerText = "Please enter a valid email address!";
            check = false;
        }
        else {
            errorMessage1.innerText = "";
        }
        var errorMessage2 = document.getElementById("error2");
        if (!isInt(cardNo.value)) {
            errorMessage2.innerText = "Please enter a number!";
        }
        else if ((cardNo.value).length != 16) {
            errorMessage2.innerText = "Please enter a 16-digit card number!";
            check = false;
        }
        else {
            errorMessage2.innerText = "";
        }
        var dateError = document.getElementById("dateError");
        if (!validateDate(expDate)) {
            dateError.innerText = "Please enter the right format MM/YY!";
            check = false;
        }
        else {
            dateError.innerText = "";
        }
        var errorMessage3 = document.getElementById("error3");
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
    }
    //trim cardNo and expDate
    //var date = new Date(expDate.value); // ('MM-DD')
    //var month = date.getMonth() || date.getDate()
    //C#: DateTime moment = new DateTIme(,,,);
    //int day = moment.Day; || moment.Month;
    
    if (isInt(cardNo.value) && isInt(cvv.value) && check == true) {
        RoadService.CustomerRegister(fullname.value, username.value, password.value, email.value, regNo.value, make.value, model.value, color.value,
            cardName.value, Number(cardNo.value), parseInt(expMonth), parseInt(expYear), parseInt(cvv.value), onCustomerRegister);
    }
}

function onCustomerRegister(result) {
    if (result === "") {
        window.location = "../Login.aspx";
    }
    else {
        var registerForm = document.getElementById("customerRegisterForm");
        var errorMessage = document.getElementById("customerRegisterError");
        if (errorMessage === null) {
            errorMessage = document.createElement("span");
            errorMessage.setAttribute("id", "customerRegisterError");
            errorMessage.setAttribute("class", "errorMessage");
            registerForm.appendChild(document.createElement("br"));
            registerForm.appendChild(document.createElement("br"));
            registerForm.appendChild(errorMessage);
        }
        errorMessage.innerText = result;
    }
}

function contractorRegister() {
    var fullname = document.getElementById("name");
    var license = document.getElementById("license");
    var username = document.getElementById("userName");
    var password = document.getElementById("password");
    var email = document.getElementById("email");
    var accName = document.getElementById("accName");
    var accNo = document.getElementById("accNo");
    var bsb = document.getElementById("bsb");

    //var contractorForm = document.getElementById("contractorRegisterForm");
    var check = true;

    var errorMessage = document.getElementById("error");
    if (fullname.value == "" || license.value == "" || username.value == "" || password.value == "" || email.value == "" || accName.value == "" || accNo.value == "" || bsb.value == "") {
        errorMessage.innerText = "No field is empty!";
        check = false;
    }
    else {
        errorMessage.innerText = "";

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

        var emailError = document.getElementById("emailError");
        if (!validateEmail(email.value)) {
            emailError.innerText = "Please enter a valid email address!";
            check = false;
        }
        else {
            emailError.innerText = "";
        }
    }

    if (isInt(license.value) && isInt(accNo.value) && isInt(bsb.value) && check == true) {
        RoadService.ContractorRegister(fullname.value, parseInt(license.value), username.value, password.value, email.value, accName.value, parseInt(accNo.value), parseInt(bsb.value), onContractorRegister);
    }
}

function onContractorRegister(result) {
    if (result === "") {
        window.location = "../Login.aspx";
    }
    else {
        var registerForm = document.getElementById("contractorRegisterForm");
        var errorMessage = document.getElementById("contractorRegisterError");
        if (errorMessage === null) {
            errorMessage = document.createElement("span");
            errorMessage.setAttribute("id", "contractorRegisterError");
            errorMessage.setAttribute("class", "errorMessage");
            registerForm.appendChild(document.createElement("br"));
            registerForm.appendChild(document.createElement("br"));
            registerForm.appendChild(errorMessage);
        }
        errorMessage.innerText = result;
    }
}
    /*
    var contractor = function () {
        this._license = license.value;
        this._userName = name.value;
        this._userPassword = password.value;
        this._userEmail = email.value;
        this._accName = accName.value;
        this._accNo = accNo.value;
        this._bsb = bsb.value;
    };
    var contractorObj = new contractor();
    console.log("Object: " + contractorObj.license);
    var newContractor = JSON.stringify(contractorObj);
    console.log("JSON string: " + newContractor);*/

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

function validateDate(expDate) {
    return /^(0[1-9]|1[0-2])\/\d{2}$/.test(expDate);
}


