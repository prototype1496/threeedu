<?php

require_once '../../db_connection/dbconfig.php';
require_once '../../model/SuperModel.php';

if (isset($_POST['btn_charge_student'])) {

    $grade_id = isset($_POST['grade_id']) ? $_POST['grade_id'] : array(0 => 0);
    $grade = isset($_POST['grade']) ? $_POST['grade'] : array(0 => 0);
    $amount = isset($_POST['amount']) ? $_POST['amount'] : array(0 => 0);
    $term_id = trim(filter_input(INPUT_POST, 'term_id', FILTER_DEFAULT));
    
    
    
    $UpdatedBy = $_SESSION['threeedu_username'];
    $tenant_id = $_SESSION['threeedu_tenantid'];

    $count = 0;
    $data = array();

    // print_r(strlen($student_no[0])) ; 
    $size_of_id_array = sizeof($grade_id);

    //The Loop below is used add data throm the subects into one array that will be used to add data to the teacher deetails TBL
    foreach ($grade_id as $key => $value) {

        if (empty($grade_id[$count])) {
            $grade_id_data = NULL;
        } else {
            $grade_id_data = $grade_id[$count];
        }

        if (empty($grade[$count])) {
            $grade_data = NULL;
        } else {
            $grade_data = $grade[$count];
        }
        
        
         if (empty($amount[$count])) {
            $amount_data = NULL;
        } else {
            $amount_data = $amount[$count];
        }
        

        if (empty($amount_data) || $amount_data == NULL || $amount_data == "") {

          
            array_push($data, array($grade_id_data, $grade_data,0,$term_id,$tenant_id,1, $UpdatedBy));
            $count++;
        } else {

             array_push($data, array($grade_id_data, $grade_data,$amount_data,$term_id,$tenant_id,1, $UpdatedBy));
            $count++;
        }
    }

    //print_r($data);

    if (count($data) > 0) {

        if (SuperModel::add_feechrge_room($data)) {
          header("Location: /threeedu/view/accounts/bulkcharg.php?term_id=$term_id");
        } else {
             header("Location: /threeedu/view/accounts/bulkcharg.php?term_id=$term_id");
        }
    } else {
        header("Location: /threeedu/view/accounts/bulkcharg.php?term_id=$term_id");
    }
}else if (isset($_POST['btn_load_grade_fees'])){
    $term_id = trim(filter_input(INPUT_POST, 'term_id', FILTER_DEFAULT));
    header("Location: /threeedu/view/accounts/bulkcharg.php?term_id=$term_id");
    
     
} else if (isset($_POST['btn_load_transactions'])){
    $student_public_id = trim(filter_input(INPUT_POST, 'student_id', FILTER_DEFAULT));
    header("Location:/threeedu/view/accounts/individualcharge.php?student_public_id=$student_public_id");
    
     
}  else if (isset($_POST['btn_load_transactions_history'])){
    $student_public_id = trim(filter_input(INPUT_POST, 'student_id', FILTER_DEFAULT));
    header("Location:/threeedu/view/accounts/transactionhistory.php?student_public_id=$student_public_id");
    
     
} 
 else if (isset($_POST['paid_amount'])){
    $tansaction_id = trim(filter_input(INPUT_POST, 'tansaction_id', FILTER_DEFAULT));
    $balance = trim(filter_input(INPUT_POST, 'balance', FILTER_DEFAULT));
    $student_public_id = trim(filter_input(INPUT_POST, 'student_public_id', FILTER_DEFAULT));
    $amount = trim(filter_input(INPUT_POST, 'paid_amount', FILTER_DEFAULT));
     $UpdatedBy = $_SESSION['threeedu_username'];
    $tenant_id = $_SESSION['threeedu_tenantid'];
  
    if (SuperModel::add_bill($tansaction_id,$balance,$student_public_id,$UpdatedBy,$amount)) {
         
    header("Location:/threeedu/view/accounts/individualcharge.php?student_public_id=$student_public_id");
    
        
    }else {
    
   header("Location:/threeedu/view/accounts/individualcharge.php?student_public_id=$student_public_id");
    
    }
     
}


