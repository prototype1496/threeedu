<script src="../../js/Jnotify/jquery-1.12.4.min.js" type="text/javascript"></script>
<link href="../../js/Jnotify/jnoty.min.css" rel="stylesheet" type="text/css"/>
<script src="../../js/Jnotify/jnoty.min.js" type="text/javascript"></script>

<?php

    require_once '../../db_connection/dbconfig.php';
    require_once '../../model/TeacherModel.php';
     require_once '../../model/SuperModel.php';
    require_once '../super/SessionStart.php';
        require_once '../../entities/EmailService.php';
  
 
  if (isset ($_POST['btn_approve']) && $_POST['btn_approve'] == "btn_approve")
 {
       
      $record_id = trim(filter_input(INPUT_POST, 'record_id', FILTER_DEFAULT));
       $user_names = trim(filter_input(INPUT_POST, 'names', FILTER_DEFAULT));
      $user_master_public_id = trim(filter_input(INPUT_POST, 'teacher_id', FILTER_DEFAULT));
  
      $UpdatedBy = $_SESSION['ttms_username'];
         $StatusCode = 'PROC';     
              
        if (SuperModel::update_laave_request($StatusCode, $UpdatedBy, $UpdatedBy, $record_id))
        {
            //send email to head teacher 
            
             
              $email_subject  = "Teacher Leave Request";
              $data = $user_names."-".$user_master_public_id." has submited a leave request please login to T.T.M.S and process the request<br><br><b>If this message dose not belong to you please ignore it and have a good day </b> ";
           
             $stm = SuperModel::get_email_by_positon_id(3);
             
              while ( $row = $stm->fetch(PDO::FETCH_ASSOC) )
                      
                      {
                  $emails_sequnce_no  = SuperModel::get_sequence_id(4);
                        $email_address = $row['EmailAddress'];
                        if ( !(empty( $email_address )) ){
                            
                    SuperModel::add_email_data(new EmailService($emails_sequnce_no, $email_address, $email_subject, $data, $StatusCode, $UpdatedBy));
     
                        }
                      }
           // echo 'submited';
                      
                      echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Teachers Leave Successfuly Approved', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/TTMS/view/hod/InboxApproved.php')},
            });   
            }); 
            </script>";
        }else
        {
            
              echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Error In Approving Teachers Leave Please contact Admin', {
            sticky: false,
            header: 'Error',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/TTMS/view/hod/InboxRejected.php')},
            });   
            }); 
            </script>"; 
        }
      
    
          
 }
 else if (isset ($_POST['btn_reject']) && $_POST['btn_reject'] == "btn_reject")
 {
       $record_id = trim(filter_input(INPUT_POST, 'record_id', FILTER_DEFAULT));
      $user_names = trim(filter_input(INPUT_POST, 'names', FILTER_DEFAULT));
      $user_master_public_id = trim(filter_input(INPUT_POST, 'teacher_id', FILTER_DEFAULT));
              
      $UpdatedBy = $_SESSION['ttms_username'];
         $StatusCode = 'REGE';     
              
        if (SuperModel::update_laave_request($StatusCode, $UpdatedBy, $UpdatedBy, $record_id))
        {
            //send email to user 
              $EmailStatusCode = 'PEND';
             $email_subject  = "Teacher Leave Request";
              $data = "Greetings, Sory to inform you ". $user_names."-".$user_master_public_id." your request from leave has been declined pleas login to T.T.M.S to view request<br><br><b>If this message dose not belong to you please ignore it and have a good day </b> ";
             
             
              
             $email_address = SuperModel::get_email_by_id($user_master_public_id);
             
          
                  $emails_sequnce_no  = SuperModel::get_sequence_id(4);
                       
                        if ( !(empty( $email_address )) ){
                            
                    SuperModel::add_email_data(new EmailService($emails_sequnce_no, $email_address, $email_subject, $data, $EmailStatusCode, $UpdatedBy));
                             echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Teachers Leave Successfuly Rejected', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/TTMS/view/hod/InboxRejected.php')},
            });   
            }); 
            </script>";
                        } else {
                              echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Teachers Leave Successfuly Rejected', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/TTMS/view/hod/InboxRejected.php')},
            });   
            }); 
            </script>";
                        }
                      
            
           
        }else
        {
           echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Error In Rejecting Teachers Leave Please contact Admin', {
            sticky: false,
            header: 'Error',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/TTMS/view/hod/Inbox.php')},
            });   
            }); 
            </script>"; 
        }
 }
 
 else if (isset ($_POST['btn_freject']) && $_POST['btn_freject'] == "btn_reject")
 {
       $record_id = trim(filter_input(INPUT_POST, 'record_id', FILTER_DEFAULT));
      
  
      $UpdatedBy = $_SESSION['ttms_username'];
         $StatusCode = 'FRJC';     
              
        if (SuperModel::update_laave_request($StatusCode, $UpdatedBy, $UpdatedBy, $record_id))
        {
            
            echo 'submited';
        }else
        {
            echo 'not submited';
        }
 }
     
 else if (isset ($_POST['btn_fapprove']) && $_POST['btn_fapprove'] == "btn_fapprove")
 {
       $record_id = trim(filter_input(INPUT_POST, 'record_id', FILTER_DEFAULT));
       $user_names = trim(filter_input(INPUT_POST, 'names', FILTER_DEFAULT));
      $user_master_public_id = trim(filter_input(INPUT_POST, 'teacher_id', FILTER_DEFAULT));
  
       $email_address = SuperModel::get_email_by_id($user_master_public_id);
             
  
      $UpdatedBy = $_SESSION['ttms_username'];
         $StatusCode = 'APPR';     
             $EmailStatusCode = 'PEND';  
        if (SuperModel::update_final_request($StatusCode, $UpdatedBy, $UpdatedBy, $record_id))
        {
            
            if (SuperModel::set_teachers_leave_flag($user_master_public_id,1)){
                
            
            
            $email_subject  = "Leave Request Approval";
              $data = $user_names."-".$user_master_public_id." Your leave request has  been approved please login to T.T.M.S and to view details<br><br><b>If this message dose not belong to you please ignore it and have a good day </b> ";
           
             $stm = SuperModel::get_email_by_positon_id(3);
             
           
                  $emails_sequnce_no  = SuperModel::get_sequence_id(4);
                       
                        if ( !(empty( $email_address )) ){
                            
                    SuperModel::add_email_data(new EmailService($emails_sequnce_no, $email_address, $email_subject, $data, $EmailStatusCode, $UpdatedBy));
     
                        }
                      
                        }
            //add notification and redirect
            
           // echo "submited";
                       
                                      
           echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Teachers Leave Successfuly Approved', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/TTMS/view/headteacher/InboxApproved.php')},
            });   
            }); 
            </script>";
        }else
        {
            echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Error in Approving Teachers Leave Request Please contact Admin', {
            sticky: false,
            header: 'Error',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/TTMS/view/headteacher/Inbox.php')},
            });   
            }); 
            </script>"; 
            //echo 'not submited';
        }
 }
 
 else if (isset ($_POST['btn_freject']) && $_POST['btn_freject'] == "btn_freject")
 {
       $record_id = trim(filter_input(INPUT_POST, 'record_id', FILTER_DEFAULT));
      $user_names = trim(filter_input(INPUT_POST, 'names', FILTER_DEFAULT));
      $user_master_public_id = trim(filter_input(INPUT_POST, 'teacher_id', FILTER_DEFAULT));
  
       $email_address = SuperModel::get_email_by_id($user_master_public_id);
        
  
      $UpdatedBy = $_SESSION['ttms_username'];
         $StatusCode = 'FRJC';     
         $EmailStatusCode = 'PEND';       
        if (SuperModel::update_final_request($StatusCode, $UpdatedBy, $UpdatedBy, $record_id))
        {
            
             $email_subject  = "Leave Request Rejected";
              $data = $user_names."-".$user_master_public_id." Your leave request has  been rejected please login to T.T.M.S and to view details<br><br><b>If this message dose not belong to you please ignore it and have a good day </b> ";
           
             $stm = SuperModel::get_email_by_positon_id(3);
             
           
                  $emails_sequnce_no  = SuperModel::get_sequence_id(4);
                       
                        if ( !(empty( $email_address )) ){
                            
                    SuperModel::add_email_data(new EmailService($emails_sequnce_no, $email_address, $email_subject, $data, $EmailStatusCode, $UpdatedBy));
     
                        }
           echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Teachers Leave Successfuly Rejected', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/TTMS/view/headteacher/InboxRejected.php')},
            });   
            }); 
            </script>";
        //  echo 'submited';
        }else
        {
             echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Error in Rejecting Teachers Leave Request Please contact Admin', {
            sticky: false,
            header: 'Error',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/TTMS/view/headteacher/Inbox.php')},
            });   
            }); 
            </script>"; 
        }
 }
 
 else if (isset ($_POST['btn_activate_user']))
 {
      $user_id = trim(filter_input(INPUT_POST, 'users_id', FILTER_DEFAULT));
      $email_addres = trim(filter_input(INPUT_POST, 'email_addres', FILTER_DEFAULT));
      $public_id = trim(filter_input(INPUT_POST, 'public_id', FILTER_DEFAULT));
      $first_name = trim(filter_input(INPUT_POST, 'first_name', FILTER_DEFAULT));
      $last_name = trim(filter_input(INPUT_POST, 'last_name', FILTER_DEFAULT));
      $other_name = trim(filter_input(INPUT_POST, 'other_name', FILTER_DEFAULT));
      
      $user_names = $first_name.' '.$other_name.' '.$last_name;
      $user_master_public_id = $public_id;
       $EmailStatusCode = 'PEND';
       $UpdatedBy = $_SESSION['ttms_username'];
      if(SuperModel::activate_user($user_id))
          {
           $email_subject  = "Admin User Account Activation ";
              $data = $user_names."-".$user_master_public_id." Your account has successfully been activated by the head teacher <br><br><b>If this message dose not belong to you please ignore it and have a good day </b> ";
           
            // $stm = SuperModel::get_email_by_positon_id(3);
             
           
                  $emails_sequnce_no  = SuperModel::get_sequence_id(4);
                       
                        if ( !(empty( $email_addres )) ){
                            
                    SuperModel::add_email_data(new EmailService($emails_sequnce_no, $email_addres, $email_subject, $data, $EmailStatusCode, $UpdatedBy));
     echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Teacher Account Successfuly Activated with password  Tms@123', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/TTMS/view/headteacher/ActivateUser.php')},
            });   
            }); 
            </script>";
                        }else{
                            echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Teacher Account Successfuly Activated with password  Tms@123', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/TTMS/view/headteacher/ActivateUser.php')},
            });   
            }); 
            </script>";
                        }
          
          }else{
              
              echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Error in Activating Teacher Account Please contact Admin', {
            sticky: false,
            header: 'Error',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/TTMS/view/headteacher/ActivateUser.php')},
            });   
            }); 
            </script>"; 
          }
      
      
      
 }
 else if (isset ($_POST['btn_deactivte_user']))
 {
      $user_id = trim(filter_input(INPUT_POST, 'users_id', FILTER_DEFAULT));
      $email_addres = trim(filter_input(INPUT_POST, 'email_addres', FILTER_DEFAULT));
      $public_id = trim(filter_input(INPUT_POST, 'public_id', FILTER_DEFAULT));
      $first_name = trim(filter_input(INPUT_POST, 'first_name', FILTER_DEFAULT));
      $last_name = trim(filter_input(INPUT_POST, 'last_name', FILTER_DEFAULT));
      $other_name = trim(filter_input(INPUT_POST, 'other_name', FILTER_DEFAULT));
      
      $user_names = $first_name.' '.$other_name.' '.$last_name;
      $user_master_public_id = $public_id;
       $EmailStatusCode = 'PEND';
       $UpdatedBy = $_SESSION['ttms_username'];
      if(SuperModel::deactivate_user($user_id))
          {
           $email_subject  = "Admin User Account Deactivation ";
              $data = $user_names."-".$user_master_public_id." Your account has been deactivated by the head teacher <br><br><b>If this message dose not belong to you please ignore it and have a good day </b> ";
           
            // $stm = SuperModel::get_email_by_positon_id(3);
             
           
                  $emails_sequnce_no  = SuperModel::get_sequence_id(4);
                       
                        if ( !(empty( $email_addres )) ){
                            
                    SuperModel::add_email_data(new EmailService($emails_sequnce_no, $email_addres, $email_subject, $data, $EmailStatusCode, $UpdatedBy));
    
                      echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Teacher Account Successfuly Deactivated', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/TTMS/view/headteacher/DeactivateActivateUser.php')},
            });   
            }); 
            </script>";
                        }else{
                            echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Teacher Account Successfuly Deactivated', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/TTMS/view/headteacher/DeactivateActivateUser.php')},
            });   
            }); 
            </script>";
                        }
          
          }else{
              
               echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Error in Deactivating Teacher Account Please contact Admin', {
            sticky: false,
            header: 'Error',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/TTMS/view/headteacher/DeactivateActivateUser.php')},
            });   
            }); 
            </script>";
          }
      
      
      
 }
else if (isset ($_POST['txt']))
 {
     echo 'Test';  
 }