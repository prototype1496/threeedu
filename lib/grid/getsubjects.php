<?php
require_once '../../controller/super/SessionStart.php';
    require_once '../../db_connection/dbconfig.php';
    
     require_once '../../model/SuperModel.php';

$stm = SuperModel::get_all_subjectts();

while($row = $stm->fetch(PDO::FETCH_ASSOC)) {
    
 
  echo '<option value="'.$row['SujectCode'].'">'.$row['Subject'].'</option>';
}