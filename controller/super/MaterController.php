<?php

require_once '../../db_connection/dbconfig.php';
require_once '../../model/SuperModel.php';

if (isset($_POST['btn_class_rooom_master'])) {

    $class_room_name = isset($_POST['class_room_name']) ? $_POST['class_room_name'] : array(0 => 0);
    $class_room_public_id = isset($_POST['class_room_public_id']) ? $_POST['class_room_public_id'] : array(0 => 0);

    $UpdatedBy = $_SESSION['threeedu_username'];
    $tenant_id = $_SESSION['threeedu_tenantid'];

    $count = 0;
    $data = array();

    // print_r(strlen($student_no[0])) ; 
    $size_of_id_array = sizeof($class_room_name);

    //The Loop below is used add data throm the subects into one array that will be used to add data to the teacher deetails TBL
    foreach ($class_room_name as $key => $value) {

        if (empty($class_room_name[$count])) {
            $class_room_name_data = NULL;
        } else {
            $class_room_name_data = $class_room_name[$count];
        }

        if (empty($class_room_public_id[$count])) {
            $class_room_public_id_data = NULL;
        } else {
            $class_room_public_id_data = $class_room_public_id[$count];
        }

        if (empty($class_room_public_id_data) || $class_room_public_id_data == NULL || $class_room_public_id_data == "") {

            $class_room_id = SuperModel::get_sequence_id(21);
            array_push($data, array($class_room_id, $class_room_name_data, $UpdatedBy, $tenant_id));
            $count++;
        } else {

            array_push($data, array($class_room_public_id_data, $class_room_name_data, $UpdatedBy, $tenant_id));
            $count++;
        }
    }

    //print_r($data);

    if (count($data) > 0) {

        if (SuperModel::add_class_room($data)) {
            echo "<script>               
            $(document).ready(
             
            function(){
                showSuccessToast('Class Added Successfully');
              
            }); 
            
            </script>";
        } else {
            echo "<script>               
            $(document).ready(
             
            function(){
                showInfoToast('Class Not Added Please Try Again Later');
               
            }); 
            </script>";
        }
    } else {
        echo "<script>               
            $(document).ready(
             
            function(){
                showInfoToast('You can not have an empty Grid plase fill in Class Room Names');
         
            }); 
            </script>";
    }
} else if (isset($_POST['btn_class_grade_master'])) {

    $grade_name = isset($_POST['grade_name']) ? $_POST['grade_name'] : array(0 => 0);
    $grade_public_id = isset($_POST['grade_public_id']) ? $_POST['grade_public_id'] : array(0 => 0);

    $UpdatedBy = $_SESSION['threeedu_username'];
    $tenant_id = $_SESSION['threeedu_tenantid'];

    $count = 0;
    $data = array();

    // print_r(strlen($student_no[0])) ; 
    $size_of_id_array = sizeof($grade_name);

    //The Loop below is used add data throm the subects into one array that will be used to add data to the teacher deetails TBL
    foreach ($grade_name as $key => $value) {

        if (empty($grade_name[$count])) {
            $grade_name_data = NULL;
        } else {
            $grade_name_data = $grade_name[$count];
        }

        if (empty($grade_public_id[$count])) {
            $grade_public_id_data = NULL;
        } else {
            $grade_public_id_data = $grade_public_id[$count];
        }

        if (empty($grade_public_id_data) || $grade_public_id_data == NULL || $grade_public_id_data == "") {

            //$class_room_id = SuperModel::get_sequence_id(21);
            array_push($data, array('NULL', $grade_name_data, $tenant_id, $UpdatedBy));
            $count++;
        } else {

            array_push($data, array($grade_public_id_data, $grade_name_data, $tenant_id, $UpdatedBy));
            $count++;
        }
    }

    //print_r($data);

    if (count($data) > 0) {

        if (SuperModel::add_grade($data)) {
            echo "<script>               
            $(document).ready(
             
            function(){
                showSuccessToast('Grade Added Successfully');
              
            }); 
            
            </script>";
        } else {
            echo "<script>               
            $(document).ready(
             
            function(){
                showInfoToast('Grade Not Added Please Try Again Later');
               
            }); 
            </script>";
        }
    } else {
        echo "<script>               
            $(document).ready(
             
            function(){
                showInfoToast('You can not have an empty Grid plase fill in Class Room Names');
         
            }); 
            </script>";
    }
}
else if (isset($_POST['btn_depatment_master'])) {

    $grade_name = isset($_POST['grade_name']) ? $_POST['grade_name'] : array(0 => 0);
     $dpt_short_name = isset($_POST['dpt_short_name']) ? $_POST['dpt_short_name'] : array(0 => 0);
    $grade_public_id = isset($_POST['grade_public_id']) ? $_POST['grade_public_id'] : array(0 => 0);

    $UpdatedBy = $_SESSION['threeedu_username'];
    $school_id = $_SESSION['threeedu_schoolid'];

    $count = 0;
    $data = array();

    // print_r(strlen($student_no[0])) ; 
    $size_of_id_array = sizeof($grade_name);

    //The Loop below is used add data throm the subects into one array that will be used to add data to the teacher deetails TBL
    foreach ($grade_name as $key => $value) {

          if (empty($dpt_short_name[$count])) {
            $dpt_short_name = NULL;
        } else {
            $dpt_short_name = $grade_name[$count];
        }
        
        if (empty($grade_name[$count])) {
            $grade_name_data = NULL;
        } else {
            $grade_name_data = $grade_name[$count];
        }

        if (empty($grade_public_id[$count])) {
            $grade_public_id_data = NULL;
        } else {
            $grade_public_id_data = $grade_public_id[$count];
        }

        if (empty($grade_public_id_data) || $grade_public_id_data == NULL || $grade_public_id_data == "") {

            //$class_room_id = SuperModel::get_sequence_id(21);
            array_push($data, array('NULL', $grade_name_data,$dpt_short_name, $school_id, $UpdatedBy));
            $count++;
        } else {

            array_push($data, array($grade_public_id_data,$dpt_short_name, $grade_name_data, $school_id, $UpdatedBy));
            $count++;
        }
    }

    //print_r($data);

    if (count($data) > 0) {

        if (SuperModel::add_deparments($data)) {
            echo "<script>               
            $(document).ready(
             
            function(){
                showSuccessToast('Department Added Successfully');
              
            }); 
            
            </script>";
        } else {
            echo "<script>               
            $(document).ready(
             
            function(){
                showInfoToast('Department Not Added Please Try Again Later');
               
            }); 
            </script>";
        }
    } else {
        echo "<script>               
            $(document).ready(
             
            function(){
                showInfoToast('You can not have an empty Grid plase fill in Department Names');
         
            }); 
            </script>";
    }
    
    
    
    
    
   // btn_submit_period
}
else if (isset($_POST['btn_submit_period'])) {
   $calss_master_id =  trim(filter_input(INPUT_POST, 'calss_master_id', FILTER_DEFAULT));
    $period_id = trim(filter_input(INPUT_POST, 'period_master_id', FILTER_DEFAULT));
     $time_from = trim(filter_input(INPUT_POST, 'time_from', FILTER_DEFAULT));
      $to_time = trim(filter_input(INPUT_POST, 'time_to', FILTER_DEFAULT));
 

    $UpdatedBy = $_SESSION['threeedu_username'];
    $school_id = $_SESSION['threeedu_schoolid'];


    if (SuperModel::add_time_table_master($calss_master_id,$period_id,$time_from,$to_time,$UpdatedBy)){
        
         echo "<script>               
            $(document).ready(
             
            function(){
                showSuccessToast('Period Added Successfully');
              
            }); 
            
            </script>";
    }else{
        echo "<script>               
            $(document).ready(
             
            function(){
                showInfoToast('Period Not Added Please Try Again Later');
               
            }); 
            </script>";
    }
}else if (isset($_GET['classid']) && isset($_GET['timetablemaster'])) {
    
     $class_id =trim(filter_input(INPUT_GET, 'classid', FILTER_DEFAULT));
    $titeble_master_id =trim(filter_input(INPUT_GET, 'timetablemaster', FILTER_DEFAULT));
    
    $UpdatedBy = $_SESSION['threeedu_username'];
 

        if (SuperModel::updated_period_status($titeble_master_id,$UpdatedBy)) {
            echo "<script>               
            $(document).ready(
             
            function(){
               window.location.replace('/threeedu/view/admin/timetablemaster.php?classid=$class_id')
          
                
              
            }); 
            
            </script>";
        } else {
            echo "<script>               
            $(document).ready(
             
            function(){
           
                showInfoToast('Error in updateing Status Please Try Again Later');
               window.location.replace('/threeedu/view/admin/timetablemaster.php?classid=$class_id');
            }); 
            </script>";
        }
  
}else if (isset($_POST['btn_submit_accement_type'])) {
     
     $assescment_type = trim(filter_input(INPUT_POST, 'assescment_type', FILTER_DEFAULT));
   
  
        $tenant_id = $_SESSION['threeedu_tenantid'];
    $UpdatedBy = $_SESSION['threeedu_username'];
 


        if (SuperModel::add_assement_type($assescment_type,$UpdatedBy,$tenant_id)) {
            echo "<script>               
            $(document).ready(
             
            function(){
               window.location.replace('/threeedu/view/admin/assessmetypemaster.php);
          
                
              
            }); 
            
            </script>";
        } else {
            echo "<script>               
            $(document).ready(
             
            function(){
           
                showInfoToast('Error in updateing Status Please Try Again Later');
                window.location.replace('/threeedu/view/admin/assessmetypemaster.php);
            }); 
            </script>";
        }
  
}
else if (isset($_GET['assecemnt_type_master_id'])) {
    
     $assecemnt_type_master_id =trim(filter_input(INPUT_GET, 'assecemnt_type_master_id', FILTER_DEFAULT));
   
    $UpdatedBy = $_SESSION['threeedu_username'];
 
     

        if (SuperModel::updated_asscecment_type_status($assecemnt_type_master_id,$UpdatedBy)) {
            echo "<script>               
            $(document).ready(
             
            function(){
               window.location.replace('/threeedu/view/admin/assessmetypemaster.php')
          
                
              
            }); 
            
            </script>";
        } else {
            echo "<script>               
            $(document).ready(
             
            function(){
           
                showInfoToast('Error in updateing Status Please Try Again Later');
               window.location.replace('/threeedu/view/admin/assessmetypemaster.php');
            }); 
            </script>";
        }
  
}


