<script src="../../js/Jnotify/jquery-1.12.4.min.js" type="text/javascript"></script>
<link href="../../js/Jnotify/jnoty.min.css" rel="stylesheet" type="text/css"/>
<script src="../../js/Jnotify/jnoty.min.js" type="text/javascript"></script>

<?php
require_once '../super/SessionStart.php';
require_once '../../db_connection/dbconfig.php';
require_once '../../model/SuperModel.php';

 
  
if (isset($_POST['btn_upadte_time_table'])) {


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
    }  else if ($day_of_weeek == 'Saturday') {
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
            close: function() {window.location.replace('/threeedu/view/teacher/viwetimetable.php?classmasterid=$class_master_id')},
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
            close: function() {window.location.replace('/threeedu/view/teacher/viwetimetable.php?classmasterid=$class_master_id')},
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