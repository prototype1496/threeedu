
function login() {

    //gets the credentials from the index.php login form
    var userName = document.getElementById("user_name").value;
    var password = document.getElementById("pass_word").value;


    $.ajax //ajax server request
            ({
                type: 'post', //data is being sent using the post method
                url: 'controller/UserController.php', //the php receiving the request
                data:
                        {
                            //post data keys and their values
                            userName: userName,
                            password: password,
                            action: "authenticate"
                        },
                dataType: 'json', //a json response is what shall be received after the request has been handled successfully
                success: function (response) { //After successfully completing the request, the response is handled here								
                    if (response.return) { // if there was a response					

                        var res = response["return"]; //here we are getting the value of the key 'return' of the json response

                        if (res === "1") {//Depending on value returned, we will be redirected to the dashboard of the user level of the person logging in. 
                            //The values are the user roles.
                            window.location.href = "admin/index.php?page=dashboard.php";
                        } else {
                            if (res === "2") {
                                window.location.href = "teacher/index.php?page=dashboard.php";
                            } else {
                                if (res === "3") {
                                    window.location.href = "parent/index.php?page=dashboard.php";
                                } else {
                                    if (res === "4") {
                                        window.location.href = "pupil/index.php?page=dashboard.php";
                                    } else {
                                        if (res === "0") {
                                            Alert.render("Incorrect Login Credentials, Try Again!");
                                        } else {
                                            Alert.render("Could not log you in, check your connection settings");
                                        }
                                    }

                                }
                            }
                        }
                    } else {

                    }
                }
            });

    return false;
}
function logout() {
    var value;
    $.ajax //ajax operation

            ({

                type: 'post', //using post method
                url: '../logout.php', //the php file handling the login in
                data:
                        {
                            value: value
                        },
                dataType: 'json', //we are going to get a json response from login_action.php
                success: function (response) {	//if the execution from login_action.php was successful it will execute the contents here	

                    if (response.return) { // if there was a response from login_action.php					

                        var res = response["return"]; //get the value in the json that we've got from login_action.php, which has the key name return

                        if (res == 1) {//if value is 1 redirect to the admin home page
                            window.location.href = "../index.php";
                        } else {

                        }

                    } else { //if there was no response from login_action.php 


                    }

                }
            });

    return false;

}

function addStudent() {
//gets varialbles from the form

    var firstName = document.getElementById("firstName").value;
    var middleName = document.getElementById("middleName").value;
    var lastName = document.getElementById("lastName").value;
    var dateOfBirth = document.getElementById("dateOfBirth").value;

    var gradeIndex = document.getElementById("gender").selectedIndex;
    var genderOptions = document.getElementById("gender").options;
    var gender = genderOptions[gradeIndex].id;

    var gradeIndex = document.getElementById("grade").selectedIndex;
    var gradeOptions = document.getElementById("grade").options;
    var grade = gradeOptions[gradeIndex].id;

    var address = document.getElementById("address").value;

    var fatherName = document.getElementById("fatherName").value;
    var motherName = document.getElementById("motherName").value;
    var guardianNumber = document.getElementById("guardianNumber").value;

    alert("Hello");


    if (firstName === "") {
        alert("First Name empty");
    } else {

        $.ajax
                ({
                    type: 'post',
                    url: '../controller/PupilController.php',
                    data:
                            {
                                firstName: firstName,
                                middleName: middleName,
                                lastName: lastName,
                                dateOfBirth: dateOfBirth,
                                gender: gender,
                                grade: grade,
                                address: address,
                                fatherName: fatherName,
                                motherName: motherName,
                                guardianNumber: guardianNumber,

                                action: "addPupil"
                            },
                    dataType: 'json',
                    success: function (response) {

                        if (response.return) {
                            var res = response["return"];
                            if (res) {
                                window.location.href = "index.php?page=studentProfile.php";
                            } else {
                                alert(res);
                            }

                        } else {

                            Alert.render();
                        }

                    }
                });
    }
    return false;
}




function CustomAlert() {
    this.render = function (dialog) {
        var winW = window.innerWidth;
        var winH = window.innerHeight;
        var dialogoverlay = document.getElementById('dialogoverlay');
        var dialogbox = document.getElementById('dialogbox');
        dialogoverlay.style.display = "block";
        dialogoverlay.style.height = winH + "px";
        dialogbox.style.left = (winW / 2) - (550 * .5) + "px";
        dialogbox.style.top = "100px";
        dialogbox.style.display = "block";
        document.getElementById('dialogboxhead').innerHTML = "Error Occured!";
        document.getElementById('dialogboxbody').innerHTML = dialog;
        document.getElementById('dialogboxfoot').innerHTML = '<button onclick="Alert.ok()">OK</button>';
    }
    this.ok = function () {
        document.getElementById('dialogbox').style.display = "none";
        document.getElementById('dialogoverlay').style.display = "none";
    }
}
var Alert = new CustomAlert();
function CustomConfirm() {
    this.render = function (dialog, op, id) {
        var winW = window.innerWidth;
        var winH = window.innerHeight;
        var dialogoverlay = document.getElementById('dialogoverlay');
        var dialogbox = document.getElementById('dialogbox');
        dialogoverlay.style.display = "block";
        dialogoverlay.style.height = winH + "px";
        dialogbox.style.left = (winW / 2) - (550 * .5) + "px";
        dialogbox.style.top = "100px";
        dialogbox.style.display = "block";
        document.getElementById('dialogboxhead').innerHTML = "Success!";
        document.getElementById('dialogboxbody').innerHTML = dialog;
        document.getElementById('dialogboxfoot').innerHTML = '<button onclick="Confirm.yes(\'' + op + '\',\'' + id + '\')">Yes</button> <button onclick="Confirm.no()">No</button>';
    }
    this.no = function (email) {

        window.location.href = "index.php?page=categories.php";
    }
    this.yes = function (op, id) {

        document.getElementById('dialogbox').style.display = "none";
        document.getElementById('dialogoverlay').style.display = "none";
    }
}
var Confirm = new CustomConfirm();