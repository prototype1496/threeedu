<?php

if (session_id() == '' || !isset($_SESSION)) {
    session_start();
}

include_once "../includes/db_connection.php";
include_once "../model/MPupil.php";
include_once "../model/MUser.php";
//include_once "UserController.php";

class PupilController extends Database {

    public function addPupil($firstName, $middleName, $lastName, $dateOfBirth, $gender, $grade, $address, $fatherName, $motherName, $guardianNumber) {

        $valueArr = array(
            "firstName" => $firstName,
            "middleName" => $middleName,
            "lastName" => $lastName,
            "dateOfbirth" => $dateOfBirth,
            "gender" => $gender,
            "grade" => $grade,
            "address" => $address,
            "fatherName" => $fatherName,
            "motherName" => $motherName,
            "guardianNumber" => $guardianNumber
        );

        $sql = "INSERT INTO pupil_tb";
        $sql .= " (" . implode(",", array_keys($valueArr)) . ") VALUES ";
        $sql .= "('" . implode("','", array_values($valueArr)) . "')";

        $query = $this->pdo->exec($sql);
        if ($query) {
            $result = true;
        } else {
            $result = mysqli_error($this->con);
        }

        return $result;
    }

}

$controller = new PupilController();
$firstName = "";
$middleName = "";
$lastName = "";
$dateOfBirth = "";
$gender = "";
$grade = "";
$address = "";
$fatherName = "";
$motherName = "";
$guardianNumber = "";

//$controller->addPupil($firstName, $middleName, $lastName, $dateOfBirth, $gender, $grade, $address, $fatherName, $motherName, $guardianNumber);

if (isset($_POST['action'])) {

    if ($_POST['action'] == "addPupil") {
        $firstName = $_POST['firstName'];
        $middleName = $_POST['middleName'];
        $lastName = $_POST['lastName'];
        $dateOfBirth = $_POST['dateOfBirth'];
        $gender = $_POST['gender'];
        $grade = $_POST['grade'];
        $address = $_POST['address'];
        $fatherName = $_POST['fatherName'];
        $motherName = $_POST['motherName'];
        $guardianNumber = $_POST['guardianNumber'];

        $result = $controller->addPupil($firstName, $middleNme, $lastName, $dateOfBirth, $gender, $grade, $address, $fatherName, $motherName, $guardianNumber);
        echo die(json_encode(array('return' => json_encode($result))));
    }
}
?>