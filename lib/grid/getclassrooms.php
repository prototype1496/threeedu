<?php
 require_once '../../controller/super/SessionStart.php';
    require_once '../../db_connection/dbconfig.php';
    
     require_once '../../model/SuperModel.php';
   $tenant_id = $_SESSION['threeedu_tenantid'];
$stm = SuperModel::get_class_rooms_by_tenant_id($tenant_id);
while($row = $stm->fetch(PDO::FETCH_ASSOC)) {
    
   
   echo '<option value="'.$row['ClassRoomPublicID'].'">'.$row['ClassRoomName'].'</option>';
}