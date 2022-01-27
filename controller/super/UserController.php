<?php

if (session_id() == '' || !isset($_SESSION)) {
    session_start();
}

include_once "../includes/db_connection.php";
include_once "../model/MUser.php";

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require_once '../PHPMailer-master/src/Exception.php';
require_once '../PHPMailer-master/src/PHPMailer.php';
require_once '../PHPMailer-master/src/SMTP.php';

class UserController extends Database {

    public function mainFunc() {

        $action = $_POST['action'];
        //$action = "updatePassword";


        if ($action == "updatePassword") {

            $oldPassword = $_POST["oldPassword"];
            $newPassword = $_POST["newPassword"];


            $result = $this->updatePassword($oldPassword, $newPassword);

            echo die(json_encode(array('return' => json_encode($result))));
        }

        if ($action == "authenticate") {
            $this->authenticateUser();
        }
    }

    public function updatePassword($oldPassword, $newPassword) {
        $currentUser = unserialize($_SESSION["currentUser"]);
        $stmt = $this->pdo->prepare("SELECT * FROM users_tb WHERE email = ? AND password = ?");
        $userName = $currentUser->getEmail();
        $password = $oldPassword;

        $arr = array($userName, md5($password));
        $stmt->execute($arr);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        $userId = $user['user_id'];
        if ($userId) {

            $sql = "UPDATE users_tb SET password = ? WHERE user_id = ?";

            $stmt = $this->pdo->prepare($sql);
            $arr = array(md5($newPassword), $userId);
            $stmt->execute($arr);

            return 3;
        } else {
            return 4;
        }
    }

    public function authenticateUser() {


        $stmt = $this->pdo->prepare("SELECT * FROM credentials_tb WHERE username = ? AND password = ?");
        $userName = filter_input(INPUT_POST, 'userName');
        $password = filter_input(INPUT_POST, 'password');


        //$arr = array($userName, md5($password));
        $arr = array($userName, $password);
        $stmt->execute($arr);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        $result = $user['userType'];

        if ($result == 1) {
            $userId = $user['userId'];
            $userObj = $this->getUser($userId);

            $_SESSION["currentUser"] = serialize($userObj);
            $result = $user["userType"];

            die(json_encode(array('return' => $result)));
        } else {
            if ($result == 2) {
                $userId = $user['userId'];
                $userObj = $this->getUser($userId);

                $_SESSION["currentUser"] = serialize($userObj);
                $result = $user["userType"];

                die(json_encode(array('return' => $result)));
            } else {
                $result = "0";
                die(json_encode(array('return' => $result)));
            }
        }
    }

    public function getUser($id) {

        $userObj = new MUser();

        $stmt = $this->pdo->prepare("SELECT * FROM user_tb WHERE userId = ?");
        $arr = array($id);
        $stmt->execute($arr);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        $userObj->setUserId($user['userId']);
        $userObj->setFirstName($user['firstName']);
        $userObj->setLastName($user['lastName']);
        $userObj->setEmail($user['email']);
        $userObj->setPhone($user['phone']);
        $userObj->setUserType($user['userType']);

        return $userObj;
    }

    public function getUserByEmail($id) {

        $userObj = new MUser();

        $stmt = $this->pdo->prepare("SELECT * FROM user_tb WHERE email = ?");
        $arr = array($id);
        $stmt->execute($arr);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        $userObj->setUserId($user['userId']);
        $userObj->setFirstName($user['firstName']);
        $userObj->setLastName($user['lastName']);
        $userObj->setEmail($user['email']);
        $userObj->setPhone($user['phone']);
        $userObj->setUserType($user['userType']);

        return $userObj;
    }

    public function getAllUsers() {

        $sql = "SELECT * FROM users_tb";
        $query = mysqli_query($this->con, $sql);
        $results = array();

        try {

            while ($rows = mysqli_fetch_assoc($query)) {
                $results[] = $rows;
            }
        } catch (PDOException $e) {
            die($e->getMessage());
        }

        return $results;
    }

    public function addUser($firstName, $lastName, $email, $phone, $userType) {
        $userId = 0;
        $password = $this->getRandomWord();
        
        $valueArr = array(
          "firstName" => $firstName,
          "lastName" => $lastName,
          "email" => $email,
          "phone" => $phone,
          "userType" => $userType
          );
        
        $sql = "INSERT INTO user_tb";
        $sql .= " (" . implode(",", array_keys($valueArr)) . ") VALUES ";
        $sql .= "('" . implode("','", array_values($valueArr)) . "')";
        $query = $this->pdo->exec($sql);


        $stmt = $this->pdo->prepare("SELECT MAX(userId) AS 'id' FROM user_tb");

        $arr = array();
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        $userId = $user["id"];

        $valueArr = array(
            "userId" => $userId,
            "username" => $email,
            "password" => $password,
            "userType" => $userType
        );

        $sql = "INSERT INTO credentials_tb";
        $sql .= " (" . implode(",", array_keys($valueArr)) . ") VALUES ";
        $sql .= "('" . implode("','", array_values($valueArr)) . "')";
        $query = $this->pdo->exec($sql);

        $_SESSION["newUserName"] = $email;
        $_SESSION["newPassword"] = $password;
        $_SESSION["newFirstName"] = $firstName;
        $_SESSION["newLastName"] = $lastName;
        $_SESSION["newPhone"] = $phone;
      
        if ($userType == 2) {
            $_SESSION["newUserType"] = "Teacher";
        }
        if ($userType == 3) {
            $_SESSION["newUserType"] = "Parent";
        }

        return $userId;
        /* if ($this->sendEmail($email, $password, $firstName, $lastName)) {
          $valueArr = array(
          "firstName" => $firstName,
          "lastName" => $lastName,
          "email" => $email,
          "phone" => $phone,
          "userType" => $userType
          );

          $sql = "INSERT INTO user_tb";
          $sql .= " (" . implode(",", array_keys($valueArr)) . ") VALUES ";
          $sql .= "('" . implode("','", array_values($valueArr)) . "')";
          $query = $this->pdo->exec($sql);


          $stmt = $this->pdo->prepare("SELECT MAX(userId) AS 'id' FROM user_tb");

          $arr = array();
          $stmt->execute();
          $user = $stmt->fetch(PDO::FETCH_ASSOC);

          $userId = $user["id"];

          $valueArr = array(
          "userId" => $userId,
          "username" => $email,
          "password" => $password,
          "userType" => $userType
          );

          $sql = "INSERT INTO credentials_tb";
          $sql .= " (" . implode(",", array_keys($valueArr)) . ") VALUES ";
          $sql .= "('" . implode("','", array_values($valueArr)) . "')";
          $query = $this->pdo->exec($sql);
          return $userId;
          } else {

          return $userId;
          } */
    }

    public function getRandomWord($len = 6) {
        $word = array_merge(range('a', 'z'), range('A', 'Z'));
        shuffle($word);
        return substr(implode($word), 0, $len);
    }

    public function sendEmail($emailAddress, $password, $firstName, $lastName) {
        $mail = new PHPMailer();
        $mail->IsSmtp();
        $mail->Mailer = "smtp";

        //$mail->SMTPDebug = 2;
        $mail->SMTPAuth = TRUE;
        $mail->SMTPSecure = "StartTLS";
        $mail->Port = 587;
        $mail->Host = "smtp.gmail.com";
        $mail->Username = "appbtestemail@gmail.com";
        $mail->Password = "Weare@appb123";
        $mail->SMTPOptions = array(
            'ssl' => array(
                'verify_peer' => false,
                'verify_peer_name' => false,
                'allow_self_signed' => true
            )
        );

        $mail->IsHTML(true);
        $mail->AddAddress($emailAddress, $firstName . " " . $lastName);
        $mail->SetFrom("appbtestemail@gmail.com", "Extra-Curricular Management System");
//$mail->AddReplyTo("reply-to-email@domain", "reply-to-name");
//$mail->AddCC("cc-recipient-email@domain", "cc-recipient-name");
        $mail->Subject = "Registration";
        $content = "<b>You have been registered successfully. Please login with the current credentials:</b>"
                . "<br>"
                . "<p>Username: " . $emailAddress . "</p>"
                . "<p>Password: " . $password . "</p>";

        $mail->MsgHTML($content);
        if (!$mail->Send()) {
            //echo "Error while sending Email.";
            return false;
        } else {
            return true;
        }
    }

}

$userController = new UserController;
//echo $userController->sendEmail("hopeamtheone@gmail.com", "Hjpojw", "H", "M");

if (isset($_POST['action'])) {

    if ($_POST['action'] == "authenticate") {

        $userController->authenticateUser();
    }
}
?>