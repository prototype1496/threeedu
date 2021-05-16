<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<?php 
require_once './db_connection/dbconfig.php';
require_once './model/LoginModel.php';

$LoginModel = new Login();

if($LoginModel->check_login_state()){
   
    include_once './view/Login.php';
    
   $user_name = $_COOKIE['username'];  
   $password = $_COOKIE['password'];  
     
  $dencripted_username = Login::encription_data($user_name, 'd');
             
   $dencripted_password = Login::encription_data($password, 'd');
   
      echo '
    <script type="text/javascript">
   document.getElementById("user_name").value = "'.$dencripted_username.'";
       document.getElementById("password").value = "'.$dencripted_password.'";
     </script>';

}else{
    include_once './view/Login.php';
    
    
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
