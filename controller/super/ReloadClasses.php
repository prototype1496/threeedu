<?php

require_once '../../model/SuperModel.php';
require_once '../../db_connection/dbconfig.php';

require_once '../super/SessionStart.php';


$super_maodel = new SuperModel();


if ($_GET['id'] == 1) {
    $super_maodel->get_all_subjects($_GET['class_id'], $_GET['school_id']);
} elseif ($_GET['id'] == 2) {
    $super_maodel->get_all_acessment_types($_GET['class_id'], $_GET['subject_id'], $_GET['tenant_id']);
} elseif ($_GET['id'] == 3) {
    $super_maodel->get_student_details_by_class_id($_GET['class_id']);
} elseif ($_GET['id'] == 4) {
    $super_maodel->get_student_data_by_id($_GET['class_id'], $_GET['assecmenttype_id']);
} elseif ($_GET['id'] == 5) {
    $super_maodel->getAllStudentDetailsByClassId($_GET['class_id']);
} elseif ($_GET['id'] == 6) {
    $super_maodel->getAllActiveTerms($_GET['tenant_id']);
}elseif ($_GET['id'] == 7) {
    $super_maodel->getAllAssessmentTypes($_GET['tenant_id']);
}
//get_terms


