<script src="../../js/Jnotify/jquery-1.12.4.min.js" type="text/javascript"></script>
<link href="../../js/Jnotify/jnoty.min.css" rel="stylesheet" type="text/css"/>
<script src="../../js/Jnotify/jnoty.min.js" type="text/javascript"></script>

<?php

 require_once '../../entities/User.php';
 require_once '../../db_connection/dbconfig.php';
 require_once '../../model/LoginModel.php';
  require_once '../super/SessionStart.php';

    $user_name = trim(filter_input(INPUT_POST, 'username', FILTER_SANITIZE_EMAIL));
    $password = trim(filter_input(INPUT_POST, 'password', FILTER_DEFAULT));
    $btn_submit = trim(filter_input(INPUT_POST, 'btn_login', FILTER_SANITIZE_STRING));
    
    $is_remember_me  = trim(filter_input(INPUT_POST, 'chk_rmember_me', FILTER_SANITIZE_STRING));

    
    if (isset($user_name) && isset($password) && isset($btn_submit)){
        
        $login_model = new Login();
        
//        $hashedPassword = password_hash('my super cool password', PASSWORD_DEFAULT);
//        
//        password_verify('the wrong password', $hashedPassword); 

      if($user_data = $login_model->authenticate(new User($user_name, $password))){
          
          //redirect user
          
          $is_password_correct = $login_model->verify_password($user_data,$password);
          
          if($is_password_correct){
              
              //check if user is aactive or not
              $is_active = $user_data['IsActive'];
              
              if($is_active == 1)
                  {
                  
                   if($login_model->create_session($user_data)){
                   
                     
                     if(isset($is_remember_me) && $is_remember_me != Null && $is_remember_me !=''){
                         
                         $login_model->create_cookie($user_data,$password);
                         //save cookies and sessions then redirect user
                          //echo 'Cooki set';
                         
             
                     }else{
                    $login_model->redirect_user($user_data);
                           //redirect user only dont save cookie
                     //echo 'Sucess';
                         
                     }
                  
              }else{
                  
                  echo 'error';
              }
                  
                  
              }else{
                  
                    $isset = $user_data['EmailAddress'];
                    $user_name = $user_data['UserName'];
                  header('location:/threeedu') ; 
                  
              }
              
             
              //$login_model->create_session($user_data);
          
              
          }else{
               echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Wrong Username or Pasword', {
            sticky: false,
            header: 'Erro',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/threeedu/')},
            });   
            }); 
            </script>";
              //diplay worng password message
          }
          
      }else{
          //echo 'Wrong Username or Pasword';
          echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Wrong Username or Pasword', {
            sticky: false,
            header: 'Erro',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/threeedu/')},
            });   
            }); 
            </script>";
          // notify user of wrong username entered  
      }
        
        
    }else{
        //echo 'Wrong Username or Pasword';
        echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Wrong Username or Pasword', {
            sticky: false,
            header: 'Erro',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/threeedu/')},
            });   
            }); 
            </script>";
        // pnotify wrong username or password 
        
    }