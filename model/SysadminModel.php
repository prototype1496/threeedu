<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of TeacherModel
 *
 * @author HP
 */
class SysAdminModel {
 
    public static function updated_school_status($SchoolID,$UpdatedBy) {
        //the below function creates a session in the databes for every log in 
        
       
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "CALL UpdateSchoolActiveStatusByID(:Schoolid,:UpdatedBy)";
            $stm = $conn->prepare($query);

            $stm->execute(array(':Schoolid'=>$SchoolID,':UpdatedBy'=>$UpdatedBy));
            $conn->commit();
            
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }
    
    
    public static function get_all_school_details() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllSchoolDetails();";
        
        $stm = $conn->prepare($query);
        $stm->execute();
       
      
            return $stm;
      
                 }
                 
                 
   public static function get_all_estudent_details($tenant_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllSchoolDetails(:tenant_id);";
        
        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenant_id));
       
      
            return $stm;
      
                 }
}
