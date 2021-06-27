<script src="../../js/Jnotify/jquery-1.12.4.min.js" type="text/javascript"></script>
<link href="../../js/Jnotify/jnoty.min.css" rel="stylesheet" type="text/css"/>
<script src="../../js/Jnotify/jnoty.min.js" type="text/javascript"></script>

<?php
 require_once '../super/SessionStart.php';
    require_once '../../db_connection/dbconfig.php';
    require_once '../../model/TeacherModel.php';
     require_once '../../model/SuperModel.php';
   
     require_once '../../model/HeadTeacherModel.php';
        require_once '../../entities/EmailService.php';
  
  if (isset ($_POST['btn_reg_pupil']))
 {
      
      $StudentNo = SuperModel::get_student_no(8);
      $StudentMasterPublicID = SuperModel::get_sequence_id(9);
      $UpdatedBy = $_SESSION['threeedu_username'];
      
      
        $first_name = trim(filter_input(INPUT_POST, 'first_name', FILTER_DEFAULT));
           $last_name = trim(filter_input(INPUT_POST, 'last_name', FILTER_DEFAULT));
           $other_name = trim(filter_input(INPUT_POST, 'other_name', FILTER_DEFAULT));
           $gender_id = trim(filter_input(INPUT_POST, 'gender_id', FILTER_DEFAULT));
           $dob = trim(filter_input(INPUT_POST, 'dob', FILTER_DEFAULT));
           $marital_status_id = trim(filter_input(INPUT_POST, 'marital_status_id', FILTER_DEFAULT));
           $class_id = trim(filter_input(INPUT_POST, 'class_id', FILTER_DEFAULT));
           $subject_code_1 = 'MATH';
           $subject_code_2 = 'MATH';
            $subject_code_3 = 'MATH';
            $subject_code_4 = 'MATH';
            $subject_code_5 = 'MATH';
            $subject_code_6 = 'MATH';;
            $subject_code_7 = 'MATH';
            $subject_code_8 = 'MATH';
            
             $email_address = trim(filter_input(INPUT_POST, 'email_address', FILTER_DEFAULT));
           $male_gardian_name = trim(filter_input(INPUT_POST, 'male_gardian_name', FILTER_DEFAULT));
           $female_gardian_name = trim(filter_input(INPUT_POST, 'female_gardian_name', FILTER_DEFAULT));
           $gardian_contact_no = trim(filter_input(INPUT_POST, 'gardian_contact_no', FILTER_DEFAULT));
           $address = trim(filter_input(INPUT_POST, 'address', FILTER_DEFAULT));
           
           
           
            if (!isset($other_name) || $other_name == Null || $other_name == "" ){
        
                $other_name = NULL;
                    }
                    
                    
                    if (!isset($male_gardian_name) || $male_gardian_name == Null || $male_gardian_name == "" ){
        
                $male_gardian_name = NULL;
                    }
                    
                    
                    if (!isset($female_gardian_name) || $female_gardian_name == Null || $female_gardian_name == "" ){
        
                $female_gardian_name = NULL;
                    }
                    
                    
                    
                      if (!isset($email_address) || $email_address == Null || $email_address == "" ){
        
                $email_address = NULL;
                    }
                    
                  
           
           
      
       if(isset( $_FILES["profile_pic"]["name"]) && !empty($_FILES["profile_pic"]["name"])){
          
          
           $location = "../../uploads/";
     $file_new_name = $StudentNo.'_'. $_FILES["profile_pic"]["name"]; // New and unique name of uploaded file
    // $file_name = $_FILES["profile_pic"]["name"];
     $file_temp = $_FILES["profile_pic"]["tmp_name"];
   
     // move_uploaded_file($file_temp, $location.$file_new_name);
     
     
     
       if (SuperModel::regiter_pupil($first_name, $last_name,$other_name, $gender_id,$dob,$marital_status_id,$class_id,$subject_code_1,$subject_code_2,$subject_code_3,$subject_code_4,$subject_code_5,$subject_code_6,$subject_code_7,$subject_code_8,$male_gardian_name,$female_gardian_name,$gardian_contact_no,$address,$StudentMasterPublicID,$StudentNo,$location.$file_new_name,$UpdatedBy,$email_address))
        {
            move_uploaded_file($file_temp, $location.$file_new_name);
            echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Student Registered Successfully', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/threeedu/view/headteacher/studentregistration.php')},
            });   
            }); 
            </script>";
        }else
        {
           echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Student Not Registered Please Try Agin Later', {
            sticky: false,
            header: 'Erro',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/threeedu/view/headteacher/studentregistration.php')},
            });   
            }); 
            </script>";
        }
           
       }else {
           
           $file_new_name = "../../uploads/defult.png";
          if (SuperModel::regiter_pupil($first_name, $last_name,$other_name, $gender_id,$dob,$marital_status_id,$class_id,$subject_code_1,$subject_code_2,$subject_code_3,$subject_code_4,$subject_code_5,$subject_code_6,$subject_code_7,$subject_code_8,$male_gardian_name,$female_gardian_name,$gardian_contact_no,$address,$StudentMasterPublicID,$StudentNo,$file_new_name,$UpdatedBy))
        {
            
            echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Student Registered Successfully', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/threeedu/view/headteacher/studentregistration.php')},
            });   
            }); 
            </script>";
        }else
        {
           echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Student Not Registered Please Try Agin Later', {
            sticky: false,
            header: 'Erro',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/threeedu/view/headteacher/studentregistration.php')},
            });   
            }); 
            </script>";
        } 
           
       }
         
     
      

      
       
       
      
      
      
      
    
          
 }    
 else if (isset ($_POST['btn_approve']) && $_POST['btn_approve'] == "btn_approve")
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
else if (isset ($_POST['btn_student_attnedance']))
 {
     $class_id = trim(filter_input(INPUT_POST, 'class_id', FILTER_DEFAULT));
  
    
     $student_no  = isset($_POST['student_no']) ? $_POST['student_no'] : array(0=>0);
     $ststus_id  = isset($_POST['ststus_id']) ? $_POST['ststus_id'] : array(0=>0);
     $reason  = isset($_POST['reason']) ? $_POST['reason'] : array(0=>0);
     
      
      $count = 0 ;
      $data = array();
      
      //print_r(strlen($student_no[0])) ; 
        $size_of_id_array = sizeof($student_no); 
         
        
        // $compined_data
        foreach ($student_no as $key => $value)    {
           
            
            if($count < $size_of_id_array ){
               
                if(empty($reason[$count])){
                  $reson_data =   NULL;
                }else {
                  $reson_data =  $reason[$count]; 
                    
                }
             
              array_push($data,array($class_id,$student_no[$count],$ststus_id[$count],$reson_data)); 
                 $count++;
            }
        }
        
        
        
         if(count($data) > 0 ){
         
         if(SuperModel::add_attendacy($data))
         {        
       echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Attendance Taken Successfuly', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/threeedu/view/teacher/selectgrade.php')},
            });   
            }); 
            </script>";
         
         }
         else
         {    
           echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Erro in submiting attendance Please Try Later', {
            sticky: false,
            header: 'Erro',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/threeedu/view/teacher/selectgrade.php')},
            });   
            }); 
            </script>";
         
         }
         
         }
         
         
         
        
 }
 
else if (isset ($_POST['btn_accessment']))
 {
     $class_id = trim(filter_input(INPUT_POST, 'classid', FILTER_DEFAULT));
     
     $accecment_type_name = trim(filter_input(INPUT_POST, 'accecment_type_name', FILTER_DEFAULT));
   
   $assecemnt_type_id = trim(filter_input(INPUT_POST, 'accesmenttype_id', FILTER_DEFAULT));
    $UpdatedBy = $_SESSION['threeedu_username'];
    
    //$student_puplic_id = trim(filter_input(INPUT_POST, 'student_puplic_id', FILTER_DEFAULT));
    
     $student__public_id  = isset($_POST['student_puplic_id']) ? $_POST['student_puplic_id'] : array(0=>0);
     $score = isset($_POST['score']) ? $_POST['score'] : array(0=>0);
     $comment  = isset($_POST['comment']) ? $_POST['comment'] : array(0=>0);
      $count = 0 ;
      $data = array();
      
     // print_r(strlen($student_no[0])) ; 
        $size_of_id_array = sizeof($student__public_id); 
         
        
        // $compined_data
        foreach ($student__public_id as $key => $value)    {
           
            
            if($count < $size_of_id_array ){
               
                if(empty($comment[$count])){
                  $comment_data =   NULL;
                }else {
                  $comment_data =  $comment[$count]; 
                    
                }
             
              array_push($data,array($student__public_id[$count],$assecemnt_type_id,$class_id,$score[$count],$comment_data,$UpdatedBy, strtolower($accecment_type_name))); 
                 $count++;
            }
        }
        
        
       //print_r(count($data));
        
         if(count($data) > 0 ){
         
         if(SuperModel::add_acessment($data))
         {        
       echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Grading Submited Successfuly', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/threeedu/view/teacher/studentassecment.php')},
            });   
            }); 
            </script>";
         
         }
         else
         {    
           echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Erro in submiting grading Please Try Later', {
            sticky: false,
            header: 'Erro',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/threeedu/view/teacher/studentassecment.php')},
            });   
            }); 
            </script>";
         
         }
         
         }
         
       
 }else if (isset ($_POST['btn_sequnce']))
 {
          $SequnceCode  = $_POST['sequnce_code'];
          
           if (SuperModel::add_seuence($SequnceCode))
        {
            
            echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Sequence Added Successfully', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/threeedu/view/admin/sequncemaster.php')},
            });   
            }); 
            </script>";
        }else {
             echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Sequence Not Added Successfully Please Check if it exists', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/threeedu/view/admin/sequncemaster.php')},
            });   
            }); 
            </script>";
            
 }
 
        }
  