<?php
require_once '../../db_connection/dbconfig.php';

     require_once '../../Model/RecoverPasswordModel.php';
       require_once '../../Entities/Token.php';
       require_once '../../Entities/User.php';
     
     require('../../lib/PHPMailer/src/PHPMailer.php');
     require('../../lib/PHPMailer/src/SMTP.php');
     
    // \PHPMailer\PHPMailer\PHPMailer(TRUE);
     
     $passwordRecoveryModel = new RecoverPasswordModel();


if (isset($_POST['email'])) {
    
    $email = strip_tags(trim(filter_input(INPUT_POST, 'email', FILTER_SANITIZE_STRING)));
    
    
     
     
     if($passwordRecoveryModel->check_email_exists($email)){
       $token = $passwordRecoveryModel->createToken();  
         
    try {
         $mail = new \PHPMailer\PHPMailer\PHPMailer(TRUE);
        //Server settings
        $mail->isSMTP();                                      // Set mailer to use SMTP
        $mail->Host = 'smtp.gmail.com';                       // Specify main and backup SMTP servers
        $mail->SMTPAuth = true;                               // Enable SMTP authentication
        $mail->Username = 'mu2014adevelopers@gmail.com';      // SMTP username
        $mail->Password = 'mulungushi';                       // SMTP password
        $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
        $mail->Port = 587;                                    // TCP port to connect to
        
        //Recipients
        $mail->setFrom($email, 'Password Reset Request');
        $mail->addAddress($email, 'FWPP');

        $mail->isHTML(TRUE);
        $mail->Subject = 'Password Reset Request';
        $mail->Body = 'If you did not make this request please login  and change your password or contact addmin otherwise click below #help group (: '. 
                '<br>Reset Link: '.$token['token'];

        $mail->send();
        
        $passwordRecoveryModel->add_reset_details(new Token($email, $token['hushed_token'], $_SERVER["REQUEST_TIME"]));
//        echo 'Message has been sent'; 
//        echo '<script> $(document).ready(function(){$("#myModal").modal("toggle"); });</script>';
    } catch (Exception $e) {
        echo 'erro in sending msg';
//        echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
//        echo '<script> $(document).ready(function(){$("#myModal1").modal("toggle"); });</script>';
    }
         
             header("Location:/OnlineDataBase/View/PasswordRecovery/index.php");
     }else {
         
         
     }
    

    
    
}else if (isset($_POST["reset"]) && isset($_POST["password"])) {
    
    
    $token = $_POST["reset"];
     $token_hash = hash('sha256',$token );
    $token_expiration_time = 86400;
 $password = strip_tags(trim(filter_input(INPUT_POST, 'password', FILTER_SANITIZE_STRING)));
$details   = $passwordRecoveryModel->get_reset_details($token_hash);

$row = mysqli_fetch_array($details);
$username = $row['username'];
$tstamp = $row['token_creation'];

 $saved_token = $row['token'];
$is_token_not_valid =  ($_SERVER["REQUEST_TIME"] - $tstamp) > $token_expiration_time;
if(($saved_token === $token_hash) && !$is_token_not_valid ){
    
    if($passwordRecoveryModel->reset_password(new User($username, $password))){
          header("Location:/OnlineDataBase/index.php");
        
    }else{
        ///need to put modole if unseccefull
        
    } 
    
}
    
   
   
}

else{
 //need to put modle if unsuccefull
}