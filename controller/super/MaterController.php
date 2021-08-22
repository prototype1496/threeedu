<?php

require_once '../../db_connection/dbconfig.php';

require_once '../../model/SuperModel.php';


  if (isset($_POST['btn_class_rooom_master'])) {
    
    $class_room_name = isset($_POST['class_room_name']) ? $_POST['class_room_name'] : array(0 => 0);
    $class_room_public_id= isset($_POST['class_room_public_id']) ? $_POST['class_room_public_id'] : array(0 => 0);

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
            
                if (empty($class_room_public_id_data)||$class_room_public_id_data==NULL||$class_room_public_id_data==""){
                    
                     $class_room_id = SuperModel::get_sequence_id(21);
                    array_push($data, array($class_room_id, $class_room_name_data, $UpdatedBy,$tenant_id));
                    $count++;
                }else {
                    
                    array_push($data, array($class_room_public_id_data, $class_room_name_data, $UpdatedBy,$tenant_id));
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
}
