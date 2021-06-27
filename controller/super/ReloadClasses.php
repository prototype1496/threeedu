<?php

 require_once '../../model/SuperModel.php';
 require_once '../../db_connection/dbconfig.php';

  require_once '../super/SessionStart.php';


$super_maodel = new SuperModel();


if($_GET['id']==1){
    $super_maodel->get_all_subjects($_GET['class_id']);
 
        
}
elseif ($_GET['id']==2)
    {
    $super_maodel->get_all_acessment_types($_GET['class_id'],$_GET['subject_id']);
}

elseif ($_GET['id']==3)
    {
    $super_maodel->get_student_details_by_class_id($_GET['class_id'],$_GET['assecmenttype_id']);
}



