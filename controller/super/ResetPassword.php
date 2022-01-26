<?php
 require_once './../../controller/super/SessionStart.php';
  $errors = array();
  
  if(!isset($_SESSION['threeedu_changepassword_public_id'] )){
       header('location:/threeedu/');
  }

if (isset($_POST['submit'])) {
    // initializing variable
 
  
    // receive all input values from the form
   
    
    $password = strip_tags(trim( $_POST['password']));
    $rentered_password = strip_tags(trim($_POST['rentered_password']));

   $isAllConditionsTrue = 0;
   
    
    if (empty($password)|| empty($rentered_password)) {
        array_push($errors, "Password is required");$isAllConditionsTrue=1;
        
    }else{
        
           if (!preg_match('/[A-Z]/', $password)){
        array_push($errors, "Password must have atleats 1 uppercase character");
        $isAllConditionsTrue=1;
    }
    if(!preg_match('/[a-z]/', $password)){
        array_push($errors, "Password must have atleats 1 lowercase character");
        $isAllConditionsTrue=1;
    }
    if (!preg_match('/[0-9]/', $password)){
        array_push($errors, "Password must have atleats 1 digit");
        $isAllConditionsTrue=1;
    }
    if (strlen($password) < 6){
        array_push($errors, "Password must be atleast 6 characters");
        $isAllConditionsTrue=1;
    }            
    if ($password != $rentered_password) {
        array_push($errors, "The two passwords do not match");
        $isAllConditionsTrue=1;
} 
    }

if($isAllConditionsTrue==0){
    
       $userName = strip_tags(trim($_POST['username']));
       $email_address = strip_tags(trim($_POST['email']));
    
  
    
    require_once '../../db_connection/dbconfig.php';
    require_once '../../entities/User.php';
    require_once '../../entities/EmailService.php';
    require_once '../../model/SuperModel.php';
 
     
     
     
  $user_email = "";
  
  $hash_password  = password_hash($password, PASSWORD_DEFAULT);
  
  if (SuperModel::update_user_password($userName, $hash_password))
          {
    session_destroy();
     header('location:/threeedu/');
//      if (empty($email_address) || $email_address == Null ||  $email_address == '')
//          {
//          //notification stating password set please login in 
//          
//         header('location:/threeedu/');
//         
//          }else {
//              
//              $emails_sequnce_no  = SuperModel::get_sequence_id(4);
//              $email_subject  = "Pssword Sucessfuly Updated";
//              $data = "Your account has been successfully activated pleas login with following credentials<br><b>Username:<b> ".$userName."<br><br><b>If this message dose not belong to you please ignore it and have a good day </b> ";
//              $status  = "PEND";
//              if (SuperModel::add_email_data(new EmailService($emails_sequnce_no, $email_address, $email_subject, $data, $status, $userName)))
//                      {
//           
//           //notifictaion atating pasword reset pleas log in 
//          header('location:/threeedu/');
//          
//          }else{
//              //notification stating password set please login in 
//          header('location:/threeedu/');
//           
//       }
//              
//          }
    
            }else {
                
                 echo 'Retuning false';
            }

          }
          
}
          
          