<script src="../../js/Jnotify/jquery-1.12.4.min.js" type="text/javascript"></script>
<link href="../../js/Jnotify/jnoty.min.css" rel="stylesheet" type="text/css"/>
<script src="../../js/Jnotify/jnoty.min.js" type="text/javascript"></script>

<?php

   
    require_once '../../db_connection/dbconfig.php';
    require_once '../../model/TeacherModel.php';
     require_once '../../model/SuperModel.php';
    require_once '../super/SessionStart.php';
      require_once '../../entities/EmailService.php';
  
  
 
  if (isset ($_POST['chekedin']))
 {
       
      $check_in_id = trim(filter_input(INPUT_POST, 'chekedin', FILTER_DEFAULT));
      
      $TeacherMasterPublicID =  $_SESSION['ttms_public_id'];
      $TeacherDetailsPublicID = SuperModel::get_sequence_id(5);
      
      $UpdatedBy = $_SESSION['ttms_username'];
              
              
        if (TeacherModel::add_teacher_report_details($TeacherMasterPublicID, $TeacherDetailsPublicID, $UpdatedBy))
        {
            
            echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Cheked In Successfully', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/TTMS/view/teacher/index.php')},
            });   
            }); 
            </script>";
        }else
        {
           echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Cheked In Unsuccessful', {
            sticky: false,
            header: 'Erro',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/TTMS/view/teacher/index.php')},
            });   
            }); 
            </script>";
        }
      
    
          
 }
 else if(isset ($_POST['chekeout']))
     {
         $TeacherMasterPublicID =  $_SESSION['ttms_public_id'];
      if($TeacherDetailsPublicID = SuperModel::check_out_teacher($TeacherMasterPublicID)){
          echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Cheked Out Successfuly', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/TTMS/view/teacher/index.php')},
            });   
            }); 
            </script>";
      }
 else {
          echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Cheked Out Unsuccessful', {
            sticky: false,
            header: 'Erro',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/TTMS/view/teacher/index.php')},
            });   
            }); 
            </script>";  
      }
     
      
     }
 else if (isset ($_POST['btn_return_fom_leve']))
 {
     //The function below is used to make a teracher return from leave 
     //thne sends an emaile to the user and to the hod of his/her deparment 
     
     // parmaeters needes to send emaile got from session varbles 
      $user_master_public_id = $_SESSION['ttms_public_id'];
       $user_names =  $_SESSION['ttms_names'];
       $current_user =  $_SESSION['ttms_username'];
       $EmailStatusCode = 'PEND';  
        $department_code = $_SESSION['ttms_department_code'];
        //paremeters needed END 
        
    
      if (SuperModel::set_teachers_leave_flag($user_master_public_id,0))
              {
          
              $email_subject  = "Teacher Leave Returned";
              $data = "Wellcome back from your leave ".$user_names."-".$user_master_public_id." You can know check in and check out :)<br><br><b>If this message dose not belog to you please ignore it goog day</b> ";
              $data2 = $user_names."-".$user_master_public_id." Has returned form leave <br><br><b>If this message dose not belog to you please ignore it goog day</b> ";
           
            
                $email_address = SuperModel::get_email_by_id($user_master_public_id);
                $emails_sequnce_no  = SuperModel::get_sequence_id(4); //gets the next email sequence 
                       
                        if ( !(empty( $email_address )) ){
                            
                    SuperModel::add_email_data(new EmailService($emails_sequnce_no, $email_address, $email_subject, $data, $EmailStatusCode, $current_user));
     
                        }
             //While loop used to get email address of all H.O.D's form thir department 
        $stm = SuperModel::get_email_by_positon_id_department_code($department_code,1);
          while ( $row = $stm->fetch(PDO::FETCH_ASSOC) )
                      
                      {
                  $emails_sequnce_no_hod  = SuperModel::get_sequence_id(4);
                        $email_address_hod = $row['EmailAddress'];
                        if ( !(empty( $email_address )) ){
                            
                      SuperModel::add_email_data(new EmailService($emails_sequnce_no_hod, $email_address_hod, $email_subject, $data2, $EmailStatusCode, $current_user));
     
                        }
                      }
                        
                      echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Wellcome back from your leave we are happy to have you back :)', {
            sticky: false,
            header: 'Welcom Back',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/TTMS/view/teacher/index.php')},
            });   
            }); 
            </script>";  
              }else{
                  
                   echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Erro in submitinng request', {
            sticky: false,
            header: 'Erro',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/TTMS/view/teacher/index.php')},
            });   
            }); 
            </script>";  
              }
 }
        
 else if (isset ($_POST['text']))
 {
     echo 'Test';  
 }