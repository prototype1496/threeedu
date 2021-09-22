<?php

require_once '../../db_connection/dbconfig.php';
require_once '../../model/SuperModel.php';
require_once '../../model/SysadminModel.php';

if (isset($_GET['schoolid'])) {

    $school_id = $_GET['schoolid'];
  

    $UpdatedBy = $_SESSION['threeedu_username'];
 
 

        if (SysAdminModel::updated_school_status($school_id,$UpdatedBy)) {
            echo "<script>               
            $(document).ready(
             
            function(){
            showSuccessToast('Status Updated Successfully');
             window.location.replace('/threeedu/view/admin/activatedeactivateschool.php')
                
              
            }); 
            
            </script>";
        } else {
            echo "<script>               
            $(document).ready(
             
            function(){
           
                showInfoToast('Error in updateing Status Please Try Again Later');
               
            }); 
            </script>";
        }
  
} 