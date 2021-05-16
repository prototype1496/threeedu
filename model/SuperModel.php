<?php

class SuperModel{
    
    //This is the section for teacher's reoprt 
    
    public static function get_all_teachers_in_department($department_code) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetTeachersInDepartmentByDepartmentCode('$department_code');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
   public static function get_department_by_code($department_code) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetDepartmentByCode('$department_code');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       

         $row = $stm->fetch(PDO::FETCH_ASSOC);
         
      
         
            return $row;
            
       
   }
    
    //This is the end of the teacher report 
   
   
   public static function get_gender() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetGender();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
   
   
    public static function get_leave_types() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetLeaveTypes();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
   
      public static function get_teacher_worked_time($start_date,$end_date) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetTeacherWorkedTime('$start_date','$end_date');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
   
    public static function get_hod_teacher_worked_time($start_date,$end_date,$departmentcode) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetTeacherWorkedTimeByDeparment('$start_date','$end_date','$departmentcode');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
   
   
        public static function get_teacher_absent_time($start_date,$end_date) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetTeacherAbsentTime('$start_date','$end_date');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
   
   public static function get_hod_teacher_absent_time($start_date,$end_date,$departmentcode) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetTeacherAbsentTimeByDepatemntCode('$start_date','$end_date','$departmentcode');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
            return $stm;
      
   }
   
   
    public static function get_teacher_leave_taken($teacher_id,$start_date,$end_date) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetLeaveTeken('$teacher_id','$start_date','$end_date');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
   public static function get_empty_result() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetEmptyResult();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
   
   
    public static function get_awarded_teacher() {
       //this is not the function geting fro the award teachers process this is for the report 
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllAwardedTeachers();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
   
      public static function get_marital_status() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetMaritalStatus();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
      public static function get_country_code() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetCountryCode();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
   
     public static function get_teacher_positions() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetPositions();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
   
   
      public static function get_all_school_depatments() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllDepartments();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
        public static function get_provinces() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetProvinces();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
   
   
     public static function get_leave_request_data($details_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        
        
        $query = "CALL GetLeaveRequestDetails('$details_id');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

         $row = $stm->fetch(PDO::FETCH_ASSOC);
         
            return $row;  
    }
   
   
    public static function get_sequence_id($sequence_number) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        
        
        $query = "CALL GetSequence($sequence_number);";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

         $row = $stm->fetch(PDO::FETCH_ASSOC);
         
            return $row['SequnceNumber'];
      
    }
    
    
     public static function get_email_by_positon_id($position_code_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        //This function is used to get the emaile address based on the depatment and opsition it founed in the position master table 
        
        $query = "CALL GetEmailAdressByPositionID('$position_code_id');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

        
            return $stm;
      
    }
    
    
    
      public static function get_email_by_positon_id_department_code($department_code,$position_code) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        //This function is used to get the emaile address based on the depatment and opsition it founed in the position master table 
        
        $query = "CALL GetHODEmailAdressByDepartment('$department_code',$position_code);";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

        
            return $stm;
      
    }
    
    
    public static function get_email_by_id($public_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        //This function is used to get the emaile address based on the depatment and opsition it founed in the position master table 
        
        $query = "CALL GetUserEmailByID('$public_id');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

        $row = $stm->fetch(PDO::FETCH_ASSOC);
//         
            return $row['EmailAddress'];
         
      
    }
    
    
     public static function is_teacher_onleave($public_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        //This function is used to get the emaile address based on the depatment and opsition it founed in the position master table 
        
        $query = "CALL GetLeaveStatusByID('$public_id');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

        $row = $stm->fetch(PDO::FETCH_ASSOC);
//         
            return $row['TeacherLeaveStatus'];
         
      
    }
    
    
       public static function is_today_working_day() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        // This function is used to check if today is a working day or not only moday to friday is set as working day 
        
        $query = "CALL GetTeacherWorkingDays();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

        $row = $stm->fetch(PDO::FETCH_ASSOC);
//         
            return $row['WokingDay'];
         
      
    }
    
        public static function get_worked_hours($teacher_master_public_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        
        
        $query = "CALL GetWorkedHours('$teacher_master_public_id');";
        $stm = $conn->query($query);
    
//
         $row = $stm->fetch(PDO::FETCH_ASSOC);
//         
            return $row['HoursWorks'];
        
    
    }
    
    
      public static function get_teacher_no_report_times($teacher_master_public_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        
        
        $query = "CALL GetNoOfTeacherReportTimes('$teacher_master_public_id');";
        $stm = $conn->query($query);
    
//
         $row = $stm->fetch(PDO::FETCH_ASSOC);
//         
            return $row['Reportedtimes'];
        
    
    }
    
     public static function get_next_holiday() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetNextHoliday();";
        $stm = $conn->query($query);

         $row = $stm->fetch(PDO::FETCH_ASSOC);
//         
            return $row['NextHolidy'];
  
    }
    
    
    
       
    public static function check_checked_in_status($teacher_master_id) {
       //This function is used to get the Public ID form the teacher master table 
        // note that the GetTeacherDetailsByUsername sp can return more information if it is modified
        
        $Connection = new Connection();
        $conn = $Connection->connect();
 
        $query = "CALL CheckCheckedInStatus('$teacher_master_id');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

         $row = $stm->fetch(PDO::FETCH_ASSOC);
         
            return $row['IsCheckedIn'];
      
    }
    
    
    
    public static function check_checked_out_status($teacher_master_id) {
       //This function is used to get the Public ID form the teacher master table 
        // note that the GetTeacherDetailsByUsername sp can return more information if it is modified
        
        $Connection = new Connection();
        $conn = $Connection->connect();
 
        $query = "CALL CheckChekedOutStatus('$teacher_master_id');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

         $row = $stm->fetch(PDO::FETCH_ASSOC);
         
            return $row['IsCheckedOut'];
      
    }
   
    
    
       
    public static function check_out_teacher($TeacherMasterPublicID) {
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
      
            $query = "CALL CheckTeacherOut(:TeacherMasterPublicID);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':TeacherMasterPublicID'=>$TeacherMasterPublicID));

             
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }

    
     function get_districts_by_provinceid($provinceid) {
        //This function is used to load the districts whih a given province ID
         $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the destrics after passing in an province ID 
        $query = "CALL GetDistrictByProvinceId(:province);";


     
        $stm = $conn->prepare($query);
        $stm->execute(array(':province' => $provinceid));

        if ($stm->rowCount() > 0) {

             //What the beow lines of code are doing is they are loading a districts and displying them in a dropdown using php

            echo "  <div class='form-group'>  <div class='col-md-2'>    <select class='form-control' name='district_id' required='required' ><option value='' selected disabled=''>Select District</option>";
            while ( $row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['districtId'] . ">" . $row['name'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo"</select>";
        } else {

            echo "  <div class='col-md-2'> <select class='form-control' name='district_id' required='required'><option value=''  selected disabled='' >Select District</option> </select>  </div>";
        }
            
        
        
    }
   
    
    
     public static function add_email_data($EmailData) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
      
            $query = "INSERT INTO `emailservice` (`EmailSerial`, `EmailAddress`, `EmailSubject`, `SendData`, `Status`, `UpdatedBy`) VALUES (:EmailSerial, :EmailAddress, :EmailSubject, :SendData, :Status, :UpdatedBy);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':EmailSerial'=>$EmailData->EmailSerial,':EmailAddress'=>$EmailData->EmailAddress, ':EmailSubject'=>$EmailData->EmailSubject, ':SendData'=>$EmailData->SendData,':Status'=>$EmailData->Status, ':UpdatedBy'=>$EmailData->UpdatedBy));

             
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }
    
    
    
    
    public static function update_user_password($user_name,$password) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
      
            $query = "CALL UpdatePasswordByUsername(:Username,:Password);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':Username'=>$user_name,':Password'=>$password));

             
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }
    
    
    
    public static function update_final_request($StatusCode, $UpdatedBy, $ApprovedBy,$TeacherDetailsPublicID) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
      
            $query = "CALL ProcessFinalLeaveRequest(:StatusCode, :UpdatedBy, :ApprovedBy,:TeacherDetailsPublicID);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':StatusCode'=>$StatusCode,':UpdatedBy'=>$UpdatedBy,'ApprovedBy'=>$ApprovedBy,'TeacherDetailsPublicID'=>$TeacherDetailsPublicID));

           // print_r($query) ;
            
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }
    
    
    public static function set_teachers_leave_flag($TeacherDetailsPublicID,$faug) {
        //the below function creates a session in the databes for every log in 
        
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
      
            $query = "CALL SetLeaveTeacherLeveFlug(:TeacherDetailsPublicID,:Flug);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':TeacherDetailsPublicID'=>$TeacherDetailsPublicID,':Flug'=>$faug));

           // print_r($query) ;
            
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            //echo $exc->getMessage();
            return FALSE;
        }
    }
    
    public static function update_laave_request($StatusCode, $UpdatedBy, $ApprovedBy,$TeacherDetailsPublicID) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
      
            $query = "CALL ProcessLeaveRequest(:StatusCode, :UpdatedBy, :ApprovedBy,:TeacherDetailsPublicID);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':StatusCode'=>$StatusCode,':UpdatedBy'=>$UpdatedBy,'ApprovedBy'=>$ApprovedBy,'TeacherDetailsPublicID'=>$TeacherDetailsPublicID));

           // print_r($query) ;
            
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }
    
    
    
    //The below functionis for user activation #
    
    public static function search_for_user($shearch_data, $search_query)
    {
           $Connection = new Connection();
        $conn = $Connection->connect();
       
       if($search_query == 1)
           {
          $query = "CALL SearchUsers('$shearch_data', '$shearch_data', '$shearch_data');";
        
           }
       if($search_query == 2)
           {
          $query = "CALL SearchActivatedUsers('$shearch_data', '$shearch_data', '$shearch_data');";
        
           } 
     
       
      $stm = $conn->query($query);
       
        
            return $stm;
         }
    
       public static function deactivate_user($UseridID) {
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
      
            $query = "CALL DeactivateUser(:UseridID);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':UseridID'=>$UseridID));

             
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }       
    
     public static function activate_user($UseridID) {
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
      
            $query = "CALL ActivateUser(:UseridID);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':UseridID'=>$UseridID));

             
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }
    
         
         public static function get_user_details_by_id($teacher_master_id) {
       //This function is used to get the Public ID form the teacher master table 
        // note that the GetTeacherDetailsByUsername sp can return more information if it is modified
        
        $Connection = new Connection();
        $conn = $Connection->connect();
       
        $query = "CALL GetUserDetailsByID('$teacher_master_id');";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();

         $row = $stm->fetch(PDO::FETCH_ASSOC);
         
            return $row;
      
    }
         
   }