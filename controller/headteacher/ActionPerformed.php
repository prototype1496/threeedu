<script src="../../js/Jnotify/jquery-1.12.4.min.js" type="text/javascript"></script>
<link href="../../js/Jnotify/jnoty.min.css" rel="stylesheet" type="text/css"/>
<script src="../../js/Jnotify/jnoty.min.js" type="text/javascript"></script>

<?php

   
    require_once '../../db_connection/dbconfig.php';
    require_once '../../model/HeadTeacherModel.php';
require_once '../../model/SuperModel.php';

    require_once '../super/SessionStart.php';
     
  
  
 
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
           $userid_redirect = trim(filter_input(INPUT_POST, 'userid_redirect', FILTER_DEFAULT));
           
           
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
                    
                  
           
           
      
       if(isset($_FILES["profile_pic"]["name"]) && !empty($_FILES["profile_pic"]["name"])){
          
          
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
          if (SuperModel::regiter_pupil($first_name, $last_name,$other_name, $gender_id,$dob,$marital_status_id,$class_id,$subject_code_1,$subject_code_2,$subject_code_3,$subject_code_4,$subject_code_5,$subject_code_6,$subject_code_7,$subject_code_8,$male_gardian_name,$female_gardian_name,$gardian_contact_no,$address,$StudentMasterPublicID,$StudentNo,$file_new_name,$UpdatedBy,$email_address))
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
 else if (isset ($_POST['text']))
 {
     echo 'Test';  
 }