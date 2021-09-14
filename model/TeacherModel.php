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
class TeacherModel {
 
    
    public static function get_all_student_details_classid($ClassID) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllStudentDetailsByClassID('$ClassID');";
        $stm = $conn->query($query);
      
            return $stm;
      
                 }
    
    
        public static function get_all_student_details($tenant_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllStudentDetails(:tenant_id);";
        
        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenant_id));
       
      
            return $stm;
      
                 }
   
                 
                 
                  public static function get_all_seqences() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetSequnces();";
        $stm = $conn->query($query);
      
            return $stm;
      
                 }
                 
    public static function get_all_student_details_by_class_masterpublic_id($classID) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllStudentDetailsByClassMasterPublicID('$classID');";
        $stm = $conn->query($query);
      
            return $stm;
      
                 }
    
    
     public static function  add_teacher_report_details($TeacherMasterPublicID,$TeacherDetailsPublicID,$UpdatedBy) {
        //the below function creates a teacher in the database
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
      
            $conn->beginTransaction();

           
            //Insets data new session into the session table
            $query1 = "INSERT INTO `teacherreportdetails` (`TeacherMasterPublicID`, `TeacherDetailsPublicID`, `UpdatedBy`) VALUES (:TeacherMasterPublicID, :TeacherDetailsPublicID, :UpdatedBy);";
            $stm = $conn->prepare($query1);
            $stm->execute(array(':TeacherMasterPublicID'=>$TeacherMasterPublicID, ':TeacherDetailsPublicID'=>$TeacherDetailsPublicID, ':UpdatedBy'=>$UpdatedBy));

            
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }
}
