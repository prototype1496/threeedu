<script src="lib/cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="./lib/Toast/jquery.toast.min.css" rel="stylesheet" type="text/css"/>
<script src="./lib/Toast/alerts.js" type="text/javascript"></script>
<script src="./lib/Toast/jquery.toast.min.js" type="text/javascript"></script>
﻿<?php 

$user_name = trim(filter_input(INPUT_POST, 'username', FILTER_SANITIZE_EMAIL));
$password = trim(filter_input(INPUT_POST, 'password', FILTER_DEFAULT));
$btn_submit = trim(filter_input(INPUT_POST, 'btn_login', FILTER_SANITIZE_STRING));

$is_remember_me = trim(filter_input(INPUT_POST, 'chk_rmember_me', FILTER_SANITIZE_STRING));


if (isset($user_name) && !empty($user_name) && isset($password) && !empty($password)) {
  $login_model = new Login();


    if ($user_data = $login_model->authenticate(new User($user_name, $password))) 
            
      {
        $is_password_correct = $login_model->verify_password($user_data, $password);

        if ($is_password_correct) 
            {
                //Is Tneant Active Or Not
                $is_tenant_active = $user_data['IsTenantActive'];


                
                if($is_tenant_active == 1){
                 
                 $is_locked_active = $user_data['IsAccountLocked'];
                 
                 if($is_locked_active == 0){
                //check if user is aactive or not
                $is_active = $user_data['IsActive'];
                     if ($is_active == 1) {
                         if ($login_model->create_session($user_data)) {
                             if (isset($is_remember_me) && $is_remember_me != Null && $is_remember_me != '')
                             {
                                 $login_model->create_cookie($user_data, $password);
                                 //save cookies and sessions then redirect user
                                 //echo 'Cooki set';
                             }
                             else {
                             $login_model->redirect_user($user_data);
                                        //redirect user only dont save cookie
                                       // echo 'Sucess';
                                    }
                        } 
                   else {

                             echo "<script>               
                    showWarningToast('Incorrect password please try again');
                      </script>";
             
                         }
                } 
                else {

                     $isset = $user_data['EmailAddress'];
                    $public_id = $user_data['PublicID'];
                      $_SESSION['threeedu_changepassword_public_id'] = $public_id;
                  header('location:/threeedu/view/resetpassword/ChangePassword.php?name='.$public_id.'&data='.$isset.'') ; 
                     }

                     }else{
                         
                         echo "<script>               
                    showInfoToast('Account Has Been Lock Please Contact School Admin');
                      </script>";
                     }
                     
                     
                     }
                     
                     else {
                         echo "<script>               
                    showInfoToast('School Account Has Been Lock Please Contact School Admin');
                      </script>";
                         
                     }
            //$login_model->create_session($user_data);
            } 
        else {
            //echo "Incorrect password";
            //diplay worng password message
                echo "<script>               
                    showInfoToast('Incorrect password please try again');
                      </script>";
             }
    } 
    else {
        //echo 'Wrong Username or Pasword';
       //echo "Usernamme is incorrect";
         echo "<script>               
                showInfoToast('Usernamme is incorrect');
                </script>";
        // notify user of wrong username entered  
    }

}
?>