<?php

require_once '../../db_connection/dbconfig.php';
require_once '../../model/SuperModel.php';


if (isset($_GET['student_id'])) {

    $student_id = $_GET['student_id'];
  

    $UpdatedBy = $_SESSION['threeedu_username'];
 
 

        if (SuperModel::updated_student_status($student_id,$UpdatedBy)) {
            echo "<script>               
            $(document).ready(
             
            function(){
            showSuccessToast('Status Updated Successfully');
             window.location.replace('/threeedu/view/admin/viwestudent.php')
                
              
            }); 
            
            </script>";
        } else {
            echo "<script>               
            $(document).ready(
             
            function(){
           
                showInfoToast('Error in updateing Status Please Try Again Later');
                window.location.replace('/threeedu/view/admin/viwestudent.php')
            }); 
            </script>";
        }
        
        
  
}  else if (isset($_GET['teacher_id'])) {

    $teacher_id = $_GET['teacher_id'];
  

    $UpdatedBy = $_SESSION['threeedu_username'];
 
 
    
        if (SuperModel::updated_teacher_status($teacher_id,$UpdatedBy)) {
            echo "<script>               
            $(document).ready(
             
            function(){
            showSuccessToast('Status Updated Successfully');
             window.location.replace('/threeedu/view/admin/viweteachers.php')
                
              
            }); 
            
            </script>";
        } else {
            echo "<script>               
            $(document).ready(
             
            function(){
           
                showInfoToast('Error in updateing Status Please Try Again Later');
                window.location.replace('/threeedu/view/admin/viweteachers.php')
            }); 
            </script>";
        }
        
}  else if (isset($_GET['user_id_20220091'])) {

    $user_id = $_GET['user_id_20220091'];
  

    $UpdatedBy = $_SESSION['threeedu_username'];
 
 
    
        if (SuperModel::updated_user_status($user_id,$UpdatedBy)) {
            echo "<script>               
            $(document).ready(
             
            function(){
            showSuccessToast('Status Updated Successfully');
             window.location.replace('/threeedu/view/admin/viweusers.php')
                
              
            }); 
            
            </script>";
        } else {
            echo "<script>               
            $(document).ready(
             
            function(){
           
                showInfoToast('Error in updateing Status Please Try Again Later');
                window.location.replace('/threeedu/view/admin/viweusers.php')
            }); 
            </script>";
        }
        
}

 