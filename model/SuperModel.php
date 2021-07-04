<?php

class SuperModel{
    
    //This is the section for 3ED
    
    //Reports
    
     public static function get_studnet_assecment_mark_report() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetStudentAsscementMarkReport();";
        $stm = $conn->query($query);
      
            return $stm;
      
                 }
    
    //Reports End
    
    
      public static function get_timtable($class_masster_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();
       
        $query = "CALL GetTimeTable(:class_masster_id);";
        
         
        $stm = $conn->prepare($query);
        $stm->execute(array(':class_masster_id' => $class_masster_id));
            return $stm;
            
            
      
   }
   
   public static function get_class_name($class_masster_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();
       
        $query = "CALL GetClassDetailsByPublicID(:class_masster_id);";
        
         
        $stm = $conn->prepare($query);
        $stm->execute(array(':class_masster_id' => $class_masster_id));
            $row = $stm->fetch(PDO::FETCH_ASSOC);
         
            return $row['class'];
      
   }
      public static function get_teacher_document_details($document_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();
       
        $query = "CALL GetTeacherDocumentDetailsByID(:document_id);";
        
         
        $stm = $conn->prepare($query);
        $stm->execute(array(':document_id' => $document_id));
           
            return $stm;
      
   }
   
     public static function get_all_teacher_lession_document() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();
       
        $query = "CALL GetAllTeacherLessionPlanDocuments();";
        
         
        $stm = $conn->prepare($query);
        $stm->execute();
           
            return $stm;
      
   }
   
   
     public static function get_teacher_lession_document_by_ID($teaher_master_public_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();
       
        $query = "CALL GeteacherLessionPlanDocumentsByID(:teaher_master_public_id);";
        
         
        $stm = $conn->prepare($query);
        $stm->execute(array(':teaher_master_public_id'=>$teaher_master_public_id));
           
            return $stm;
      
   }
    
    
    public static function add_seuence($sequence) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
      
            $query = "INSERT INTO `sequencemaster` (`SequnceCode`) VALUES (:SequnceCode);";
            $stm = $conn->prepare($query);
            
             $stm->execute(array(':SequnceCode'=>$sequence));
            
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            //echo $exc->getMessage();
            return FALSE;
        }
    }
    
    
    public static function add_attendacy($tem_data) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
       // print_r(count($tem_data[0]));
           //$args  = array_fill(0, count($tem_data[0]), '?');
            //Insets data new session into the session table
            $query = "INSERT INTO `studentattendance` (`ClassID`,`StudentID`, `Status`, `Reason`) VALUES  (?,?,?,?)";
            $stm = $conn->prepare($query);
            
            
            foreach ($tem_data as $data)
            {
                 //print_r($data);
                if (!empty($data[0])){
                   // print_r($data);
                 $stm->execute($data);
                }else{
                    
                    
                }
               
              //  
            }
            //print_r($stm);
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            //echo $exc->getMessage();
            return FALSE;
        }
    }
    
     
    public static function update_time_table($tem_data,$day) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
      if ($day == 1 )
                {
                 $query = "UPDATE timetabledetails SET Monday = ? , UpdatedBy = ? WHERE TimeTableDetailsID = ?;" ;
           
                }
                else if ($day == 2)
                    {
                     $query = "UPDATE timetabledetails SET Tuesday = ? , UpdatedBy = ? WHERE TimeTableDetailsID = ?;" ;
           
                    }
               else if ($day == 3)
                    {
                     $query = "UPDATE timetabledetails SET Wednesday = ? , UpdatedBy = ? WHERE TimeTableDetailsID = ?;" ;
           
                    }
                    
               else if ($day == 4)
                    {
                     $query = "UPDATE timetabledetails SET Thursday = ? , UpdatedBy = ? WHERE TimeTableDetailsID = ?;" ;
           
                    }
                    
             else if ($day == 5)
                    {
                     $query = "UPDATE timetabledetails SET Friday = ? , UpdatedBy = ? WHERE TimeTableDetailsID = ?;" ;
           
                    }else {
                         $query='';
                    }
            
            
            $stm = $conn->prepare($query);
            
           //print_r($stm);
            foreach ($tem_data as $data)
            {
                // print_r($data);
                if (!empty($data[2])){
               // print_r($data);
                 $stm->execute($data);
             
                }else{
                    
                    
                }
               
              //  
            }
            //print_r($stm);
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
           //echo $exc->getMessage();
            return FALSE;
        }
    }
    
    
     public static function add_acessment($tem_data) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
       // print_r(count($tem_data[0]));
           //$args  = array_fill(0, count($tem_data[0]), '?');
            //Insets data new session into the session table
            $query = "INSERT INTO `studnetassesment` (`StudentMasterPublicID`, `AssecemntTypeMasterID`, `ClassMasterPublicID`, `Score`, `Commment`, `UpdatedBy`,`AssecementName`) VALUES (?, ?, ?, ?, ?, ?,?);";
            $stm = $conn->prepare($query);
            
           // print_r($stm);
            foreach ($tem_data as $data)
            {
                // print_r($data);
                if (!empty($data[0])){
                //  print_r($data);
                $stm->execute($data);
                
                }else{
                    
                    
                }
               
              //  
            }
            //print_r($stm);
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
           //echo $exc->getMessage();
            return FALSE;
        }
    }
     public static function uplaod_lesson_plan($lesonplantitle,$file_url,$UpdatedBy) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
       // print_r(count($tem_data[0]));
           //$args  = array_fill(0, count($tem_data[0]), '?');
            //Insets data new session into the session table
            $query = "INSERT INTO `3edu_db`.`teacherdocument` (`Title`, `DocumentTypeID`, `DocumentURL`, `AddedBy`,`LastUpdatedBy`) VALUES (?, ?, ?, ?,?);";
            $stm = $conn->prepare($query);
            
           $stm->execute(array($lesonplantitle,'1',$file_url,$UpdatedBy,$UpdatedBy));
               
           
            //print_r($stm);
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
           echo $exc->getMessage();
            return FALSE;
        }
    }
    
    
    
    function get_class_by_grade_id($gradeid) {
        //This function is used to load the districts whih a given province ID
         $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the destrics after passing in an province ID 
        $query = "CALL GetClassByGreadeID(:grade);";


     
        $stm = $conn->prepare($query);
        $stm->execute(array(':grade' => $gradeid));

        if ($stm->rowCount() > 0) {

             //What the beow lines of code are doing is they are loading a districts and displying them in a dropdown using php

            echo '  <div class="form-group"> <label class="bmd-label-floating">Class</label> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" name="class_id" id = "class_id" onchange="get_subjects()" > <option value="" disabled="disabled" selected="selected">Select Class</option>';
            while ( $row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['ClassMasterPublicID'] . ">" . $row['class'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo'</select></div></div>';
        } else {

            echo ' <div class="form-group"> <label class="bmd-label-floating">Class</label> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" name="class_id" id = "class_id" "> <option value="" disabled="disabled" selected="selected">Select Class</option></select></div></div>';
        }
            
        
        
    }
    
    
    
      function get_subject_by_class_id($classid) {
        //This function is used to load the subject on selection of class Id 
         $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the subjects after passing in an class ID 
        $query = "CALL GetClassSubjectsByClassMasterID(:class_id);";


     
        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $classid));

        if ($stm->rowCount() > 0) {

             //What the beow lines of code are doing is they are loading a subjects and displying them in a dropdown using php

            echo '<div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_1_selection()" id="subject_code_1" name="subject_code_1"> <option value="" disabled="disabled" selected="selected">Subject 1 </option>';
            while ( $row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SubjectCode'] . ">" . $row['Subject'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo'</select></div></div>';
        } else {

            echo ' <div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_1_selection()" id="subject_code_1" name="subject_code_1"> <option value="" disabled="disabled" selected="selected">Subject 1 </option> </select></div></div>';
        }
            
        
        
    }
    
    
    
    
    
    function get_subject_by_class_id_2($classid) {
        //This function is used to load the subject on selection of class Id 
         $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the subjects after passing in an class ID 
        $query = "CALL GetClassSubjectsByClassMasterID(:class_id);";


     
        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $classid));

        if ($stm->rowCount() > 0) {

             //What the beow lines of code are doing is they are loading a subjects and displying them in a dropdown using php

            echo '<div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_2_selection()" id="subject_code_2" name="subject_code_2"> <option value="" disabled="disabled" selected="selected">Subject 2 </option>';
            while ( $row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SubjectCode'] . ">" . $row['Subject'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo'</select></div></div>';
        } else {

            echo ' <div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_2_selection()" id="subject_code_2" name="subject_code_2"> <option value="" disabled="disabled" selected="selected">Subject 2 </option> </select></div></div>';
        }
            
        
        
    }
    
    
    
    
    
    
    function get_subject_by_class_id_3($classid) {
        //This function is used to load the subject on selection of class Id 
         $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the subjects after passing in an class ID 
        $query = "CALL GetClassSubjectsByClassMasterID(:class_id);";


     
        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $classid));

        if ($stm->rowCount() > 0) {

             //What the beow lines of code are doing is they are loading a subjects and displying them in a dropdown using php

            echo '<div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_3_selection()" id="subject_code_3" name="subject_code_3"> <option value="" disabled="disabled" selected="selected">Subject 3 </option>';
            while ( $row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SubjectCode'] . ">" . $row['Subject'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo'</select></div></div>';
        } else {

            echo ' <div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_3_selection()" id="subject_code_3" name="subject_code_3"> <option value="" disabled="disabled" selected="selected">Subject 3 </option> </select></div></div>';
        }
            
        
        
    }
    
    
    
    
    
    function get_subject_by_class_id_4($classid) {
        //This function is used to load the subject on selection of class Id 
         $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the subjects after passing in an class ID 
        $query = "CALL GetClassSubjectsByClassMasterID(:class_id);";


     
        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $classid));

        if ($stm->rowCount() > 0) {

             //What the beow lines of code are doing is they are loading a subjects and displying them in a dropdown using php

            echo '<div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_4_selection()" id="subject_code_4" name="subject_code_4"> <option value="" disabled="disabled" selected="selected">Subject 4 </option>';
            while ( $row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SubjectCode'] . ">" . $row['Subject'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo'</select></div></div>';
        } else {

            echo ' <div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_4_selection()" id="subject_code_4" name="subject_code_4"> <option value="" disabled="disabled" selected="selected">Subject 4 </option> </select></div></div>';
        }
            
        
        
    }
    
    
    
    
    function get_subject_by_class_id_5($classid) {
        //This function is used to load the subject on selection of class Id 
         $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the subjects after passing in an class ID 
        $query = "CALL GetClassSubjectsByClassMasterID(:class_id);";


     
        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $classid));

        if ($stm->rowCount() > 0) {

             //What the beow lines of code are doing is they are loading a subjects and displying them in a dropdown using php

            echo '<div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_5_selection()" id="subject_code_5" name="subject_code_5"> <option value="" disabled="disabled" selected="selected">Subject 5 </option>';
            while ( $row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SubjectCode'] . ">" . $row['Subject'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo'</select></div></div>';
        } else {

            echo ' <div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_5_selection()" id="subject_code_5" name="subject_code_5"> <option value="" disabled="disabled" selected="selected">Subject 5 </option> </select></div></div>';
        }
            
        
        
    }
    
    
    
    
    
    
    
    
    function get_subject_by_class_id_6($classid) {
        //This function is used to load the subject on selection of class Id 
         $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the subjects after passing in an class ID 
        $query = "CALL GetClassSubjectsByClassMasterID(:class_id);";


     
        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $classid));

        if ($stm->rowCount() > 0) {

             //What the beow lines of code are doing is they are loading a subjects and displying them in a dropdown using php

            echo '<div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_6_selection()" id="subject_code_6" name="subject_code_5"> <option value="" disabled="disabled" selected="selected">Subject 6 </option>';
            while ( $row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SubjectCode'] . ">" . $row['Subject'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo'</select></div></div>';
        } else {

            echo ' <div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_6_selection()" id="subject_code_6" name="subject_code_6"> <option value="" disabled="disabled" selected="selected">Subject 6 </option> </select></div></div>';
        }
            
        
        
    }
    
    
    
    
    function get_subject_by_class_id_7($classid) {
        //This function is used to load the subject on selection of class Id 
         $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the subjects after passing in an class ID 
        $query = "CALL GetClassSubjectsByClassMasterID(:class_id);";


     
        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $classid));

        if ($stm->rowCount() > 0) {

             //What the beow lines of code are doing is they are loading a subjects and displying them in a dropdown using php

            echo '<div class="form-group"> <div class="form-select-list"> <select  class="form-control custom-select-value" onchange="validate_subject_7_selection()" id="subject_code_7" name="subject_code_7"> <option value="" disabled="disabled" selected="selected">Subject 7 </option>';
            while ( $row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SubjectCode'] . ">" . $row['Subject'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo'</select></div></div>';
        } else {

            echo ' <div class="form-group"> <div class="form-select-list"> <select  class="form-control custom-select-value" onchange="validate_subject_7_selection()" id="subject_code_7" name="subject_code_7"> <option value="" disabled="disabled" selected="selected">Subject 7 </option> </select></div></div>';
        }
            
        
        
    }
    
    
    
    
    function get_subject_by_class_id_8($classid) {
        //This function is used to load the subject on selection of class Id 
         $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the subjects after passing in an class ID 
        $query = "CALL GetClassSubjectsByClassMasterID(:class_id);";


     
        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $classid));

        if ($stm->rowCount() > 0) {

             //What the beow lines of code are doing is they are loading a subjects and displying them in a dropdown using php

            echo '<div class="form-group"> <div class="form-select-list"> <select   class="form-control custom-select-value" onchange="validate_subject_8_selection()" id="subject_code_8" name="subject_code_8"> <option value="" disabled="disabled" selected="selected">Subject 8 </option>';
            while ( $row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SubjectCode'] . ">" . $row['Subject'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo'</select></div></div>';
        } else {

            echo ' <div class="form-group"> <div class="form-select-list"> <select  class="form-control custom-select-value" onchange="validate_subject_8_selection()" id="subject_code_8" name="subject_code_8"> <option value="" disabled="disabled" selected="selected">Subject 8 </option> </select></div></div>';
        }
            
    }
        
        
        
    //This is for searchable combos 

     public static function get_all_classes() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();
       
        $query = "CALL GetAllClasses();";
         
         $stm = $conn->query($query);
      
          
            return $stm;
      
   }
   
     public static function get_all_classes_with_mapped_subjects() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();
       
        $query = "CALL GetAllClassesWithMappedSubjects();";
         
         $stm = $conn->query($query);
      
          
            return $stm;
      
   }
   
   
    function get_all_subjects($class_id) {
        //This function is used to load the districts whih a given province ID
         $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the destrics after passing in an province ID 
        $query = "CALL GetSubjectsByClassMasterPublicID(:class_id);";

///maonpwe
     
        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $class_id));

        if ($stm->rowCount() > 0) {

             //What the beow lines of code are doing is they are loading a districts and displying them in a dropdown using php
 echo "  <option value='' disabled='disabled' selected='selected' >Select Subject</option> ";
            while ( $row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SujectCode'] . ">" . $row['SubjectName'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            
           
            
            } else {

            echo "  <option value='' disabled='disabled' selected='selected' >Select Subject</option> ";
       
            }
            
        
        
    }
    
    
      function get_all_acessment_types($class_id,$subject_code) {
        //This function is used to load the districts whih a given province ID
         $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the destrics after passing in an province ID 
        $query = "CALL GetAssecmentTypeBySubjectCode(:class_id,:subject_code);";

///maonpwe
     
        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $class_id,':subject_code' => $subject_code));

        if ($stm->rowCount() > 0) {

             //What the beow lines of code are doing is they are loading a districts and displying them in a dropdown using php
 echo "  <option value='' disabled='disabled' selected='selected' >Select Acessment Type</option> ";
            while ( $row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['AssementTypeID'] . ">" . $row['AssementTypeName'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            
           
            
            } else {

           echo "  <option value='' disabled='disabled' selected='selected' >Select Acessment Type</option> ";
       
            }
            
        
        
    }
    
     function get_student_details_by_class_id($class_id,$assecmenttype_id) {
        //This function is used to load the districts whih a given province ID
         $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the destrics after passing in an province ID 
        $query = "CALL GetAllStudentDetailsByClassMasterPublicID(:class_id,:assecmenttype_id);";

///maonpwe
     
        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $class_id,':assecmenttype_id'=>$assecmenttype_id));
        

        if ($stm->rowCount() > 0) {

             //What the beow lines of code are doing is they are loading a districts and displying them in a dropdown using php
 
            while ( $row = $stm->fetch(PDO::FETCH_ASSOC)) {


                              $public_id = $row['StudentMasterPublicID'];
                                                         ?>
                             <tr>
                             <input name="student_puplic_id[]" value="<?php echo $public_id;?>" type="hidden"/>
                                      <td><?php echo $row['StudentNo'];?></td>

                                     <td ><?php echo $row['NameInfo'];?></td>
                                     <td ><?php echo $row['Class'];?></td>

                                     <td ><input maxlength="3" m="100" min="0" name="score[]" required="" placeholder="Enter %" /></td>
                                     <td ><input name="comment[]" placeholder="Enter Comment" /></td>

                             </tr>
                             
                             <?php
                             
                             
            }

            
           
            
            } else {

    
       
            }
            
        
        
    }

//Searchable combos end     
    
    
    
    
          
    public static function get_classes_by_grade_id($grade_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();
       
        $query = "CALL GetAllClassesByGradeID('$grade_id');";
         //$stm = $conn->prepare($query);
         $stm = $conn->query($query);
        //$row = $stm->execute(array(':gradeid' => $grade_id));
       // $stm->execute(array(':username' => $User->username));
        // $stm->execute();
     
//         $row = $stm->fetch(PDO::FETCH_ASSOC);
          // print_r($stm);
            return $stm;
      
   }
        
    public static function get_student_details_by_student_no($studentNo) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();
       
        $query = "CALL GetAllStudentDetailsByStudentNo('$studentNo');";
          $stm = $conn->prepare($query);
        $stm = $conn->query($query);
        $stm->execute(array(':studen_no' => $studentNo));
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
     
         $row = $stm->fetch(PDO::FETCH_ASSOC);
         
            return $row;
      
   }
    
   
   
   
      public static function regiter_pupil($first_name, $last_name,$other_name, $gender_id,$dob,$marital_status_id,$class_id,$subject_code_1,$subject_code_2,$subject_code_3,$subject_code_4,$subject_code_5,$subject_code_6,$subject_code_7,$subject_code_8,$male_gardian_name,$female_gardian_name,$gardian_contact_no,$address,$StudentMasterPublicID,$StudentNo,$file_temp,$UpdatedBy,$email_address) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            $conn->beginTransaction();
            
            $subject_array = array();
            
           
              
               
                   
          $query = "INSERT INTO `studentmaster` (`StudentMasterPublicID`, `ProfilePic`, `StudentNo`, `FirstName`, `LastName`, `OtherName`, `GenderID`, `MaritalStatusID`, `DOB`, `GuardianContactNo`, `GuardianMaleName`, `GuardianFemaleName`, `Address`, `UpdatedBy`, `IsActive`,`EmailAddress`, `ClassMasterPublicID`) VALUES (:StudentMasterPublicID, :ProfilePic, :StudentNo, :FirstName, :LastName, :OtherName, :GenderID, :MaritalStatusID, :DOB, :GuardianContactNo, :GuardianMaleName, :GuardianFemaleName, :Address, :UpdatedBy, '1',:EmailAddress,:ClassMasterPublicID);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':StudentMasterPublicID'=>$StudentMasterPublicID,':ProfilePic'=>$file_temp, ':StudentNo'=>$StudentNo, ':FirstName'=>$first_name,':LastName'=>$last_name,':OtherName'=>$other_name,':GenderID'=>$gender_id,':MaritalStatusID'=>$marital_status_id,':DOB'=>$dob,':GuardianContactNo'=>$gardian_contact_no,':GuardianMaleName'=>$male_gardian_name,':GuardianFemaleName'=>$female_gardian_name,':Address'=>$address,':UpdatedBy'=>$UpdatedBy,':EmailAddress'=>$email_address,':ClassMasterPublicID'=>$class_id));

             
          
                   
             
            
            
      
           
             
              $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }
   
    
    
    public static function get_all_subjectts() {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllSubjects();";
        $stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
       public static function get_subjects_by_class_id($class_master_id) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetClassSubjectsByID(:class_master_id);";
        
          $stm = $conn->prepare($query);
        $stm->execute(array(':class_master_id' => $class_master_id));
        

        //$stm = $conn->query($query);
       // $stm->execute(array(':username' => $User->username));
         //$stm->execute();
         //print_r($stm);
       
         
            return $stm;
      
   }
   
    //3ed section end 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
    
    
      public static function get_student_no($sequence_number) {
       
        $Connection = new Connection();
        $conn = $Connection->connect();

        
        
        $query = "CALL GetStudentNo($sequence_number);";
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