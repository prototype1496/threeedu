<?php



 require_once '../../model/SuperModel.php';
 require_once '../../db_connection/dbconfig.php';

  require_once '../super/SessionStart.php';


$super_maodel = new SuperModel();


if ($super_maodel->get_class_by_grade_id($_GET['grade_id'])){
    
    
    
}  else {
    
}