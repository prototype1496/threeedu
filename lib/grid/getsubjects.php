<?php
require_once '../../controller/super/SessionStart.php';
    require_once '../../db_connection/dbconfig.php';
    
     require_once '../../model/SuperModel.php';
$school_id = $_SESSION['threeedu_schoolid'];
$stm = SuperModel::get_all_subjets_by_id($school_id);

while($row = $stm->fetch(PDO::FETCH_ASSOC)) {
    
 
  echo '<option value="'.$row['SubjectCode'].'">'.$row['Subject'].'</option>';
}