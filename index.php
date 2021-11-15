<?php
require_once './controller/super/SessionStart.php';
require_once './db_connection/dbconfig.php';
require_once './model/LoginModel.php';
require_once './entities/User.php';


//test



$LoginModel = new Login();

$db = new Connection();

$requestMethod = $_SERVER["REQUEST_METHOD"];
$userId = null;
if (isset($uri[2])) {
    $userId = (int) $uri[2];
}

$studentApi = new StudentController($db,$requestMethod,$userId);
$studentApi->init();

include_once './view/Login.php';
if ($LoginModel->check_login_state()) {
    $user_name = $_COOKIE['username'];
    $password = $_COOKIE['password'];
    $dencripted_username = Login::encription_data($user_name, 'd');
    $dencripted_password = Login::encription_data($password, 'd');
    echo '
    <script type="text/javascript">
   document.getElementById("user_name").value = "' . $dencripted_username . '";
       document.getElementById("password-field").value = "' . $dencripted_password . '";
     </script>';

}
?>

<!--<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <form method="POST" action="/controller/Login.php">
    <center>
       <br><br><br><br> <input type="text" name="username"/><br>
        <input type="password" name="password"/><br>
        <input type="submit" name="btn_login" value="Submit"/>
        
        </center>
            
            </form>
    </body>
</html>-->
