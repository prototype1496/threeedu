<script src="../../js/Jnotify/jquery-1.12.4.min.js" type="text/javascript"></script>
<link href="../../js/Jnotify/jnoty.min.css" rel="stylesheet" type="text/css"/>
<script src="../../js/Jnotify/jnoty.min.js" type="text/javascript"></script>

<?php
require_once '../super/SessionStart.php';
require_once '../../db_connection/dbconfig.php';
require_once '../../model/SuperModel.php';

if (isset($_POST['btn_reg_pupil'])) {

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
    $subject_code_6 = 'MATH';
    ;
    $subject_code_7 = 'MATH';
    $subject_code_8 = 'MATH';

    $email_address = trim(filter_input(INPUT_POST, 'email_address', FILTER_DEFAULT));
    $male_gardian_name = trim(filter_input(INPUT_POST, 'male_gardian_name', FILTER_DEFAULT));
    $female_gardian_name = trim(filter_input(INPUT_POST, 'female_gardian_name', FILTER_DEFAULT));
    $gardian_contact_no = trim(filter_input(INPUT_POST, 'gardian_contact_no', FILTER_DEFAULT));
    $address = trim(filter_input(INPUT_POST, 'address', FILTER_DEFAULT));

    if (!isset($other_name) || $other_name == Null || $other_name == "") {

        $other_name = NULL;
    }


    if (!isset($male_gardian_name) || $male_gardian_name == Null || $male_gardian_name == "") {

        $male_gardian_name = NULL;
    }


    if (!isset($female_gardian_name) || $female_gardian_name == Null || $female_gardian_name == "") {

        $female_gardian_name = NULL;
    }



    if (!isset($email_address) || $email_address == Null || $email_address == "") {

        $email_address = NULL;
    }





    if (isset($_FILES["profile_pic"]["name"]) && !empty($_FILES["profile_pic"]["name"])) {


        $location = "../../uploads/";
        $file_new_name = $StudentNo . '_' . $_FILES["profile_pic"]["name"]; // New and unique name of uploaded file
        // $file_name = $_FILES["profile_pic"]["name"];
        $file_temp = $_FILES["profile_pic"]["tmp_name"];

        // move_uploaded_file($file_temp, $location.$file_new_name);



        if (SuperModel::regiter_pupil($first_name, $last_name, $other_name, $gender_id, $dob, $marital_status_id, $class_id, $subject_code_1, $subject_code_2, $subject_code_3, $subject_code_4, $subject_code_5, $subject_code_6, $subject_code_7, $subject_code_8, $male_gardian_name, $female_gardian_name, $gardian_contact_no, $address, $StudentMasterPublicID, $StudentNo, $location . $file_new_name, $UpdatedBy, $email_address)) {
            move_uploaded_file($file_temp, $location . $file_new_name);

            echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Student Registered Successfully', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/threeedu/view/admin/studentregistration.php')},
            });   
            }); 
            </script>";
        } else {
            echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Student Not Registered Please Try Agin Later', {
            sticky: false,
            header: 'Erro',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/threeedu/view/admin/studentregistration.php')},
            });   
            }); 
            </script>";
        }
    } else {

        $file_new_name = "../../uploads/defult.png";
        if (SuperModel::regiter_pupil($first_name, $last_name, $other_name, $gender_id, $dob, $marital_status_id, $class_id, $subject_code_1, $subject_code_2, $subject_code_3, $subject_code_4, $subject_code_5, $subject_code_6, $subject_code_7, $subject_code_8, $male_gardian_name, $female_gardian_name, $gardian_contact_no, $address, $StudentMasterPublicID, $StudentNo, $file_new_name, $UpdatedBy, $email_address)) {

            echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Student Registered Successfully', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/threeedu/view/admin/studentregistration.php')},
            });   
            }); 
            </script>";
        } else {
            echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Student Not Registered Please Try Agin Later', {
            sticky: false,
            header: 'Erro',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/threeedu/view/admin/studentregistration.php')},
            });   
            }); 
            </script>";
        }
    }
} else if (isset($_POST['btn_upadte_time_table'])) {


    $UpdatedBy = $_SESSION['threeedu_username'];
    $class_master_id = trim(filter_input(INPUT_POST, 'class_master_id', FILTER_DEFAULT));
    $day_of_weeek = trim(filter_input(INPUT_POST, 'day_of_week', FILTER_DEFAULT));

    $timtable_deatails_id = isset($_POST['timtable_deatails_id']) ? $_POST['timtable_deatails_id'] : array(0 => 0);
    $subject_code = isset($_POST['subject_code']) ? $_POST['subject_code'] : array(0 => 0);

    $count = 0;
    $data = array();
    if ($day_of_weeek == 'Monday') {
        $day = 1;
    } else if ($day_of_weeek == 'Tuesday') {
        $day = 2;
    } else if ($day_of_weeek == 'Wednesday') {
        $day = 3;
    } else if ($day_of_weeek == 'Thursday') {
        $day = 4;
    } else if ($day_of_weeek == 'Friday') {
        $day = 5;
    } else if ($day_of_weeek == 'Saturday') {
        $day = 6;
    }
    else if ($day_of_weeek == 'Sunday') {
        $day = 7;
    }else {
        $day = -1;
    }



    // print_r(strlen($student_no[0])) ; 
    $size_of_id_array = sizeof($timtable_deatails_id);

    // $compined_data
    foreach ($timtable_deatails_id as $key => $value) {


        if ($count < $size_of_id_array) {

            if (empty($subject_code[$count])) {
                $subject_code_data = NULL;
            } else {
                $subject_code_data = $subject_code[$count];
            }

            array_push($data, array($subject_code_data, $UpdatedBy, $value));
            $count++;
        }
    }


    // print_r($data);

    if (count($data) > 0) {

        if (SuperModel::update_time_table($data, $day)) {
            echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Time Table Updated Successfuly', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/threeedu/view/admin/viwetimetable.php?classmasterid=$class_master_id')},
            });   
            }); 
            </script>";
        } else {
            echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Error In Updateing Time Table Try Again Later', {
            sticky: false,
            header: 'Erro',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/threeedu/view/admin/viwetimetable.php?classmasterid=$class_master_id')},
            });   
            }); 
            </script>";
        }
    }
}else if (isset($_POST['btn_add_school'])) {
    $it_id = SuperModel::get_sequence_id(22);
    $school_id = SuperModel::get_sequence_id(6);
    
     $emmisno = trim(filter_input(INPUT_POST, 'emmisno', FILTER_DEFAULT));
     $shcoolname = trim(filter_input(INPUT_POST, 'shcoolname', FILTER_DEFAULT));
      $shortname = trim(filter_input(INPUT_POST, 'shortname', FILTER_DEFAULT));
     $schoolmotto = trim(filter_input(INPUT_POST, 'schoolmotto', FILTER_DEFAULT));
     $web_site = trim(filter_input(INPUT_POST, 'web_site', FILTER_DEFAULT));
     $max_term = trim(filter_input(INPUT_POST, 'max_term', FILTER_DEFAULT));
     $tel = trim(filter_input(INPUT_POST, 'tel', FILTER_DEFAULT));
     $phoneno = trim(filter_input(INPUT_POST, 'phoneno', FILTER_DEFAULT));
     $longitude = trim(filter_input(INPUT_POST, 'longitude', FILTER_DEFAULT));
     $latitude = trim(filter_input(INPUT_POST, 'latitude', FILTER_DEFAULT));
     $school_description = trim(filter_input(INPUT_POST, 'school_description', FILTER_DEFAULT));
    
        
    
      
    
    
    
    $username = trim(filter_input(INPUT_POST, 'username', FILTER_DEFAULT));

    $password = trim(filter_input(INPUT_POST, 'password', FILTER_DEFAULT));
 
    $first_name = trim(filter_input(INPUT_POST, 'first_name', FILTER_DEFAULT));
    $last_name = trim(filter_input(INPUT_POST, 'last_name', FILTER_DEFAULT));

    $other_name = trim(filter_input(INPUT_POST, 'other_name', FILTER_DEFAULT));

    $gender_id = trim(filter_input(INPUT_POST, 'gender_id', FILTER_DEFAULT));

    $dob = trim(filter_input(INPUT_POST, 'dob', FILTER_DEFAULT));

    $marital_status_id = trim(filter_input(INPUT_POST, 'marital_status_id', FILTER_DEFAULT));

    $nrc = trim(filter_input(INPUT_POST, 'nrc', FILTER_DEFAULT));

    $passport = trim(filter_input(INPUT_POST, 'passport', FILTER_DEFAULT));

    $concat_no = trim(filter_input(INPUT_POST, 'concat_no', FILTER_DEFAULT));

    $email_address = trim(filter_input(INPUT_POST, 'email_address', FILTER_DEFAULT));

    $district_id = trim(filter_input(INPUT_POST, 'district_id', FILTER_DEFAULT));
    $pramary_address = trim(filter_input(INPUT_POST, 'pramary_address', FILTER_DEFAULT));

    $secondary_address = trim(filter_input(INPUT_POST, 'secondary_address', FILTER_DEFAULT));

    $user_type = 4; //teacher usertype

   
    
    
    //Make values Null if they are empty 
    if (!isset($other_name) || $other_name == Null || $other_name == "" || empty($other_name)) {

        $other_name = NULL;
    }



    if (!isset($nrc) || $nrc == Null || $nrc == "" || empty($nrc)) {

        $nrc = NULL;
    }

    if (!isset($passport) || $passport == Null || $passport == "" || empty($passport)) {

        $passport = NULL;
    }



    if (!isset($email_address) || $email_address == Null || $email_address == "" || empty($email_address)) {

        $email_address = NULL;
    }


    if (!isset($secondary_address) || $secondary_address == Null || $secondary_address == "" || empty($secondary_address)) {

        $secondary_address = NULL;
    }
    
    
    
     if (!isset($schoolmotto) || $schoolmotto == Null || $schoolmotto == "" || empty($schoolmotto)) {

        $schoolmotto = NULL;
    }
    
    
     if (!isset($web_site) || $web_site == Null || $web_site == "" || empty($web_site)) {

        $web_site = NULL;
    }
    
     if (!isset($tel) || $tel == Null || $tel == "" || empty($tel)) {

        $tel = NULL;
    }
    
    
     if (!isset($school_description) || $school_description == Null || $school_description == "" || empty($school_description)) {

        $school_description = NULL;
    }
    
    
    
        //End  values Null if they are empty 


    $hushed_password =  password_hash($password, PASSWORD_DEFAULT);
    $UpdatedBy = $_SESSION['threeedu_username'];
    
    $tenant_initals  = substr($shcoolname, 0, 3);
    $tenant_id = uniqid($tenant_initals, true);
    
    
    $logo_pic_url;
    $pic_url;
    $movable_pic_url;  
    $movable_logo_pic_url;
    

    if (isset($_FILES["profile_pic"]["name"]) && !empty($_FILES["profile_pic"]["name"])) {
        
        $location = "../../uploads/it_profile/";
        $file_new_name = $it_id . '_' . $_FILES["profile_pic"]["name"]; // New and unique name of uploaded file
        // $file_name = $_FILES["profile_pic"]["name"];
        $file_temp = $_FILES["profile_pic"]["tmp_name"];
         $pic_url = $location . $file_new_name;
         
          $movable_pic_url = $pic_url ;  
   
    }else{
         $pic_url = "../../uploads/defult.png";
    }
    
    
    if (isset($_FILES["logo_pic"]["name"]) && !empty($_FILES["logo_pic"]["name"])) {
        
        $location_logo = "../../uploads/shcool_logos/";
        $file_new_name_logo = $school_id . '_' . $_FILES["logo_pic"]["name"]; // New and unique name of uploaded file
        // $file_name = $_FILES["profile_pic"]["name"];
        $file_temp_logo = $_FILES["logo_pic"]["tmp_name"];
         $logo_pic_url = $location_logo . $file_new_name_logo;
          $movable_logo_pic_url=$logo_pic_url;
    }else{
         $logo_pic_url = "../../uploads/shcool_logos/defult_school.png";
    }
    

        //print_r(count($data));
          if (SuperModel::create_school($it_id, $pic_url, $nrc, $passport, $username, $hushed_password, $first_name, $last_name, $other_name, $email_address, $concat_no, $gender_id, $marital_status_id, $dob, $user_type, $UpdatedBy, $pramary_address, $secondary_address, $district_id, $tenant_id,$emmisno,$shcoolname,$schoolmotto,$web_site,$max_term,$tel,$phoneno,$longitude,$latitude,$school_description,$logo_pic_url,$school_id,$shortname))
          { 
               if (isset($_FILES["logo_pic"]["name"]) && !empty($_FILES["logo_pic"]["name"])) {
                     move_uploaded_file($file_temp_logo, $movable_logo_pic_url); 
               }
              if (isset($_FILES["profile_pic"]["name"]) && !empty($_FILES["profile_pic"]["name"])) {
                  move_uploaded_file($file_temp, $movable_pic_url); 
              }
              
              
              echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('School Added Successfuly', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/threeedu/view/admin/addschool.php')},
            });   
            }); 
            </script>";
          }else {
               echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('School Can Not Be Added Please Try Agin Later', {
            sticky: false,
            header: 'Erro',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/threeedu/view/admin/addschool.php')},
            });   
            }); 
            </script>";
              
          }
}else if (isset($_POST['btn_update_school'])) {
   
    $school_id = trim(filter_input(INPUT_POST, 'school_public_id', FILTER_DEFAULT));
    
     $emmisno = trim(filter_input(INPUT_POST, 'emmisno', FILTER_DEFAULT));
     $shcoolname = trim(filter_input(INPUT_POST, 'shcoolname', FILTER_DEFAULT));
     $shortname = trim(filter_input(INPUT_POST, 'shortname', FILTER_DEFAULT));
     $schoolmotto = trim(filter_input(INPUT_POST, 'schoolmotto', FILTER_DEFAULT));
     $web_site = trim(filter_input(INPUT_POST, 'web_site', FILTER_DEFAULT));
     $max_term = trim(filter_input(INPUT_POST, 'max_term', FILTER_DEFAULT));
     $tel = trim(filter_input(INPUT_POST, 'tel', FILTER_DEFAULT));
     $phoneno = trim(filter_input(INPUT_POST, 'phoneno', FILTER_DEFAULT));
     $longitude = trim(filter_input(INPUT_POST, 'longitude', FILTER_DEFAULT));
     $latitude = trim(filter_input(INPUT_POST, 'latitude', FILTER_DEFAULT));
     $school_description = trim(filter_input(INPUT_POST, 'school_description', FILTER_DEFAULT));
    
        
    
     if (!isset($schoolmotto) || $schoolmotto == Null || $schoolmotto == "" || empty($schoolmotto)) {

        $schoolmotto = NULL;
    }
    
    
     if (!isset($web_site) || $web_site == Null || $web_site == "" || empty($web_site)) {

        $web_site = NULL;
    }
    
     if (!isset($tel) || $tel == Null || $tel == "" || empty($tel)) {

        $tel = NULL;
    }
    
    
     if (!isset($school_description) || $school_description == Null || $school_description == "" || empty($school_description)) {

        $school_description = NULL;
    }
    
    
    $UpdatedBy = $_SESSION['threeedu_username'];
    
   
//    if (isset($_FILES["logo_pic"]["name"]) && !empty($_FILES["logo_pic"]["name"])) {
//        
//        $location_logo = "../../uploads/shcool_logos/";
//        $file_new_name_logo = $school_id . '_' . $_FILES["logo_pic"]["name"]; // New and unique name of uploaded file
//        // $file_name = $_FILES["profile_pic"]["name"];
//        $file_temp_logo = $_FILES["logo_pic"]["tmp_name"];
//         $logo_pic_url = $location_logo . $file_new_name_logo;
//          $movable_logo_pic_url=$logo_pic_url;
//    }else{
//         $logo_pic_url = "../../uploads/shcool_logos/defult_school.png";
//    }
    

        //print_r(count($data));
          if (SuperModel::update_school($emmisno,$shcoolname,$schoolmotto,$web_site,$max_term,$tel,$phoneno,$longitude,$latitude,$school_description,$school_id,$shortname,$UpdatedBy))
          { 
              
              echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('School Info Updated Successfully', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/threeedu/view/admin/editschool.php?id=$school_id')},
            });   
            }); 
            </script>";
          }else {
               echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('School Can Not Be Updated Please Try Agin Later', {
            sticky: false,
            header: 'Erro',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/threeedu/view/admin/editschool.php?id=$school_id')},
            });   
            }); 
            </script>";
              
          }
}