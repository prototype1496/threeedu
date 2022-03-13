<?php

class SuperModel
{


    public static function saveTeacherSignInTime($loginBtnClicked, $teacherPublicId, $tenantId)
    {
        $Connection = new Connection();
        $conn = $Connection->connect();
        $date = date("Y/m/d");
        date_default_timezone_set("Africa/Cairo");
        $time = date("H:i:s");
        if ($loginBtnClicked === "Start shift") {
            $query = "SELECT * FROM `3edu_db`.`attendance` WHERE `Date` = '$date' AND `UserPublicID` = '$teacherPublicId' AND `TenantID` ='$tenantId' ";
            $getAttendanceByDateAndPublicIDStm = $conn->prepare($query);
            $getAttendanceByDateAndPublicIDStm->execute();
            $attendanceCount = $getAttendanceByDateAndPublicIDStm->rowCount();
            if ($attendanceCount == 0) {
                $query = "INSERT INTO `3edu_db`.`attendance` (`UserPublicID`,`TenantID`,`Date`, `SignIn`, `SignOut`) VALUES ('$teacherPublicId', '$tenantId','$date', '$time',null);";
                $conn = $Connection->connect();
                $stm = $conn->prepare($query);
                $stm->execute();
            } else {
                $stm = null;
            }
        } else {
            $query = "UPDATE `3edu_db`.`attendance` SET SignOut = '$time' WHERE `Date` = '$date' AND `UserPublicID` = '$teacherPublicId' AND `TenantID` ='$tenantId' ";
            $stm = $conn->prepare($query);
            $stm->execute();
        }
        return $stm;
    }

    public  static function getAllActiveTerms($tenantId){
        $Connection = new Connection();
        $conn = $Connection->connect();
        $query = "SELECT * FROM termmaster WHERE TenantID = '$tenantId'";
        $stm = $conn->prepare($query);
        $stm->execute();

        echo "  <option value='' disabled='disabled' selected='selected' >Select Term</option> ";
        if ($stm->rowCount() > 0) {
            while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {
                $termName = $row['TermName'];
               echo  '<option  value=\''.$termName.'\'> '.$termName.'</option>';
            }
        }
        return $stm;
    }

    public  static function getAllAssessmentTypes($tenantId){
        $Connection = new Connection();
        $conn = $Connection->connect();
        $query = "SELECT * FROM assementtypemaster WHERE TenantID = '$tenantId'";
        $stm = $conn->prepare($query);
        $stm->execute();

        echo "  <option value='' disabled='disabled' selected='selected' >Select Assessment Type</option> ";
        if ($stm->rowCount() > 0) {
            while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {
                $assessmentName = $row['AssementTypeName'];
               echo  '<option  value=\''.$assessmentName.'\'> '.$assessmentName.'</option>';
            }
        }
        return $stm;
    }


    public static function getHeadTeacherDetails($publicId){
        $Connection = new Connection();
        $conn = $Connection->connect();
        $query = "SELECT * FROM usermaster WHERE PublicID = '$publicId'";
        $stm = $conn->prepare($query);
        $stm->execute();
        return $stm->fetch();
    }

    public static function getTeacherLoginHistory($teacherPublicId, $tenantId){
        $Connection = new Connection();
        $conn = $Connection->connect();
        $query = "SELECT * FROM attendance WHERE UserPublicID = '$teacherPublicId'  AND `TenantID` ='$tenantId' ";
        $stm = $conn->prepare($query);
        $stm->execute();
        return $stm;
    }

    public static function getTeacherLoginDetails($teacherPublicId, $tenantId){
        $Connection = new Connection();
        $conn = $Connection->connect();
        $date = date("Y/m/d");
        $query = "SELECT * FROM `3edu_db`.`attendance` WHERE `Date` = '$date' AND `UserPublicID` = '$teacherPublicId'  AND `TenantID` ='$tenantId' ORDER BY attendance.ID DESC LIMIT 1;  ";
        $stm = $conn->prepare($query);
        $stm->execute();
        return $stm->fetch();
    }

    public static function getAllTeacherLoginDetails($tenantId)
    {
        $Connection = new Connection();
        $conn = $Connection->connect();
        $date = date("Y/m/d");
        $query = "SELECT a.UserPublicID,a.SignOut,a.Date,a.SignIn, um.FirstName,um.LastName FROM attendance AS a JOIN usermaster AS um ON um.PublicID = a.UserPublicID WHERE a.TenantID ='$tenantId'";
        $stm = $conn->prepare($query);
        $stm->execute();
        return $stm;
    }

    public static function addTeacherComments($tem_data) {
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            $conn->beginTransaction();
            $query = "INSERT INTO `studentcomments` (`StudentMasterPublicID`,`TeaherMasterName`,`HeadTeacherName`, `TeacherComment`,`HeadTeacherComment`,`State`,`Term`,`AssessmentName`,`UpdatedBy`) VALUES (?,?,?,?,?,?,?,?,?);";
            $stm = $conn->prepare($query);
            foreach ($tem_data as $data) {
                if (!empty($data[0])) {
                    $stm->execute($data);
                }
            }
            $conn->commit();
            $conn = Null;
            return true;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc;
            return false;
        }
    }

    public static function addHeadTeacherComments($tem_data) {
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            $conn->beginTransaction();
            $query = "UPDATE `studentcomments` SET HeadTeacherName =?, HeadTeacherComment = ? , UpdatedBy = ?,State = ? WHERE State = ? AND StudentMasterPublicID = ? AND Term	= ? AND AssessmentName = ? ";
            $stm = $conn->prepare($query);
            $state = "HeadTeacher";

            foreach ($tem_data as $data) {
                $stm->bindParam(1, $data["teacherName"], PDO::PARAM_STR);
                $stm->bindParam(2, $data['commentData'], PDO::PARAM_STR);
                $stm->bindParam(3, $data["updatedBy"], PDO::PARAM_STR);
                $stm->bindParam(4, $data['status'], PDO::PARAM_STR);
                $stm->bindParam(5, $state, PDO::PARAM_STR);
                $stm->bindParam(6, $data['studentPublicId'], PDO::PARAM_STR);
                $stm->bindParam(7, $data['term'], PDO::PARAM_STR);
                $stm->bindParam(8, $data['assessmentName'], PDO::PARAM_STR);
                $stm->execute();
            }

            $conn->commit();
            $conn = Null;
            return true;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc;
            return false;
        }
    }


    public static function getStudentCommentsByPublicId($publicId, $term,$assessment,$date) {
        $Connection = new Connection();
        $conn = $Connection->connect();
        $time = strtotime($date);
        $month = date("m", $time);
        $year = date("Y", $time);

        $query = "SELECT * FROM studentcomments WHERE StudentMasterPublicID = '$publicId' AND AssessmentName = '$assessment' AND Term LIKE '$term' AND MONTH(CreatedAt) = '$month' AND YEAR(CreatedAt) = '$year' ORDER BY studentcomments.StudentCommentID DESC LIMIT 1;";
        $stm = $conn->prepare($query);
        $stm->execute();
        return $stm->fetch(PDO::FETCH_ASSOC);
    }

    public static function getSchoolDetailsByPublicId($publicId)
    {
        $studentDetails = self::getStudentDetailsByPublicId($publicId);
        $studentNumber = $studentDetails['StudenNo'];
        $userDetails = self::getUserDetailsByName($studentNumber);
        $schoolId = $userDetails['SchoolPublicID'];
        $Connection = new Connection();
        $conn = $Connection->connect();
        $query = "CALL GetAllSchoolDetailsBySchoolID(:schoolId);";
        $stm = $conn->prepare($query);
        $stm->execute(array(':schoolId' => $schoolId));
        return $stm->fetch(PDO::FETCH_ASSOC);
    }

    public static function getUserDetailsByName($userName)
    {
        $Connection = new Connection();
        $conn = $Connection->connect();
        $query = "CALL GetUserByUsername(:username)";
        $stm = $conn->prepare($query);
        $stm->execute(array(':username' => $userName));
        return $stm->fetch(PDO::FETCH_ASSOC);
    }

    public static function getStudentDetailsByPublicId($studentMasterPublicID)
    {
        $Connection = new Connection();
        $conn = $Connection->connect();
        $query = "CALL GetAllStudentDetailsByPublicID(:studentMasterPublicID);";
        $stm = $conn->prepare($query);
        $stm->execute(array(':studentMasterPublicID' => $studentMasterPublicID));
        $row = $stm->fetch(PDO::FETCH_ASSOC);
        return $row;
    }


    function getAllStudentDetailsByClassId($class_id)
    {
        //This function is used to load Students in the studentComment.php grid

        $Connection = new Connection();
        $conn = $Connection->connect();


        // this is the stored procidure from the db that is loading the destrics after passing in an province ID
        $query = "CALL GetAllStudentDetailsByClassMasterPublicID(:class_id,:assecmenttype_id);";
        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $class_id, ':assecmenttype_id' => null));
        if ($stm->rowCount() > 0) {
            while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {
                $public_id = $row['StudentMasterPublicID']; ?>
                <tr>
                    <input name="student_puplic_id[]" value="<?php echo $public_id; ?>" type="hidden"/>
                    <td><?php echo $row['StudentNo']; ?></td>
                    <td><?php echo $row['NameInfo']; ?></td>
                    <td><?php echo $row['Class']; ?></td>
                    <td><input name="comment[]" placeholder="Enter Comment"/></td>
                </tr>
                <?php
            }
        }
    }



    //This is the section for 3ED
    //DASHBORDS
    public static function get_dashboard_count_by_tenenat_id($tenant_id)
    {
        $Connection = new Connection();
        $conn = $Connection->connect();
        if ($tenant_id == '3edu_29294e8-f7a1-11eb-a81c-1062e5c23520') {

            $query = "CALL GetSuperAdminDashbordUserCount(:tenant_id);";
        } else {

            $query = "CALL GetDashboardUserCounts(:tenant_id);";
        }


        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenant_id));
        $row = $stm->fetch(PDO::FETCH_ASSOC);

        return $row;
    }

    //DASHBORDS EDN
    //Reports

    public static function get_studnet_assecment_mark_report($tenant_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetStudentAsscementMarkReport(:tenant_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenant_id));


        return $stm;
    }

    public static function get_studnet_attendance_report($TenantID)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetStudentAttendanceReport(:tenant_id);";


        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $TenantID));

        return $stm;
    }

    public static function get_single_studnet_attendance_report_by_id($PUBLICID)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetStudentAttendanceReportByPublicID(:public_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':public_id' => $PUBLICID));

        return $stm;
    }


    public static function get_student_assecemnttype_by_public_id($PUBLICID)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAccessmentByStudentPublicID(:public_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':public_id' => $PUBLICID));

        return $stm;
    }

    //Reports End
    public static function get_all_subjectts()
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllSubjects();";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();
        //print_r($stm);


        return $stm;
    }

    public static function get_class_rooms_by_tenant_id($tenatnt_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetClassRoomsByID(:tenant_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenatnt_id));

        return $stm;
    }


    public static function get_all_subjets_by_id($school_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllSubjectsBySchooID(:school_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':school_id' => $school_id));

        return $stm;
    }


    public static function get_all_periods($class_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllPeriods(:class_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $class_id));

        return $stm;
    }

    public static function get_all_periods_masters_by_id($school_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllPeriodsBySchoolID(:school_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':school_id' => $school_id));

        return $stm;
    }


    public static function get_all_asscecemnt_types_by_tenant_id($tenant_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllActiveAssecmentTypesBYTenantID(:tenant_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenant_id));

        return $stm;
    }

    public static function get_school_details_by_tenant_id($tenatnt_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetSchoolDetailsByTenatID(:tenant_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenatnt_id));
        $row = $stm->fetch(PDO::FETCH_ASSOC);
        return $row;
    }

    public static function get_all_teacher_details_by_tenant_id($tenatnt_id, $teacher_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllTeacherDetailsByID(:tenant_id,:teacher_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenatnt_id, ':teacher_id' => $teacher_id));
        $row = $stm->fetch(PDO::FETCH_ASSOC);
        return $row;
    }


    public static function get_all_complet_teacher_details_by_tenant_id($tenatnt_id, $teacher_id)
    {
        //this function gets all details including the head and deputy head teacher recods by tenant ID
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetCompleteTeacherDetailsByID(:tenant_id,:teacher_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenatnt_id, ':teacher_id' => $teacher_id));
        $row = $stm->fetch(PDO::FETCH_ASSOC);
        return $row;
    }

    public static function get_teacher_details_by_tenant_id($tenatnt_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetTeacherDetailsByID(:tenant_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenatnt_id));

        return $stm;
    }

    public static function get_complet_teacher_details_by_tenant_id($tenatnt_id)
    {
        //this function gets all details including the head and deputy head teacher recods by tenant ID 
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllTeacherDetailsByTenantID(:tenant_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenatnt_id));

        return $stm;
    }


    public static function get_active_terms_by_tenant_id($tenatnt_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllActiveTermsByTenantID(:tenant_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenatnt_id));

        return $stm;
    }

    public static function get_active_grades_by_tenant_id($tenatnt_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllActivesGradesByTenantID(:tenant_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenatnt_id));

        return $stm;
    }

    public static function get_all_active_calsses($tenatnt_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllActiveClasses(:tenant_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenatnt_id));

        return $stm;
    }

    public static function get_all_grades_by_id($tenatnt_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllActivesGradesByTenantID(:tenant_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenatnt_id));

        return $stm;
    }

    public static function get_timtable($class_masster_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetTimeTable(:class_masster_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':class_masster_id' => $class_masster_id));
        return $stm;
    }

    public static function get_class_name($class_masster_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetClassDetailsByPublicID(:class_masster_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':class_masster_id' => $class_masster_id));
        $row = $stm->fetch(PDO::FETCH_ASSOC);

        return $row['class'];
    }

    public static function get_class_details_by_id($class_masster_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetClassDetailsByID(:class_masster_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':class_masster_id' => $class_masster_id));
        $row = $stm->fetch(PDO::FETCH_ASSOC);

        return $row;
    }

    public static function get_teacher_document_details($document_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetTeacherDocumentDetailsByID(:document_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':document_id' => $document_id));

        return $stm;
    }

    public static function get_all_teacher_lession_document($tenant_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllTeacherLessionPlanDocuments(:tenant_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenant_id));

        return $stm;
    }

    public static function get_teacher_lession_document_by_ID($teaher_master_public_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GeteacherLessionPlanDocumentsByID(:teaher_master_public_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':teaher_master_public_id' => $teaher_master_public_id));

        return $stm;
    }


    //Acounts moduel 


    public static function get_all_transactional_history($term_id, $year, $query_run, $tenant_id)
    {

        $Connection = new Connection();
        $con = $Connection->accounts_db_connect();

        if ($query_run == 1) {
            $query = "CALL GetTotalTransactioanalHitoryByIDDate(:term,:year,:tenant_id);";

            $stm = $con->prepare($query);
            $stm->execute(array(':term' => $term_id, ':year' => $year, ':tenant_id' => $tenant_id));
        } else {

            $query = "CALL GetTotalTransactioanalHitory(:tenant_id);";
            $stm = $con->prepare($query);
            $stm->execute(array(':tenant_id' => $tenant_id));
        }


        return $stm;
    }

    public static function get_fee_charge_by_id($term_id, $tenant_master_id, $query_run)
    {

        $Connection = new Connection();
        $con = $Connection->accounts_db_connect();

        if ($query_run == 1) {
            $query = "CALL GetFeeChargesByTermAndTenantID(:TenantMasterID_,:TermID_);";
        } else {
            $query = "CALL GetEmptyReult(:TenantMasterID_,:TermID_);";

        }

        $stm = $con->prepare($query);
        $stm->execute(array(':TenantMasterID_' => $tenant_master_id, ':TermID_' => $term_id));

        return $stm;
    }


    public static function get_default_fee_charge($term_id, $tenant_master_id)
    {
        //we are not using the termid parameter passed in this function
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetDefultGradeCharges(:TenantMasterID_,:TermID_);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':TenantMasterID_' => $tenant_master_id, ':TermID_' => $term_id));

        return $stm;
    }


    public static function get_active_terms($tenant_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetActiveTermByID(:tenant_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenant_id));

        return $stm;
    }


    public static function get_sys_active_terms($tenant_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetSysActiveTermsByID(:tenant_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenant_id));


        $row = $stm->fetch(PDO::FETCH_ASSOC);

        return $row;
    }


    public static function get_total_bill_blance($student_id)
    {

        $Connection = new Connection();
        $conn = $Connection->accounts_db_connect();

        $query = "CALL GetTotalBalance(:student_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':student_id' => $student_id));


        $row = $stm->fetch(PDO::FETCH_ASSOC);

        return $row;
    }


    public static function check_if_fee_exists($term_id, $tenant_master_id)
    {

        $Connection = new Connection();
        $con = $Connection->accounts_db_connect();

        $query = "CALL CheckIfFessExists(:TenantMasterID_,:TermID_);";

        $stm = $con->prepare($query);
        $stm->execute(array(':TenantMasterID_' => $tenant_master_id, ':TermID_' => $term_id));

        $row = $stm->fetch(PDO::FETCH_ASSOC);

        return $row;
    }

    //End Acount Moduel


    public static function add_subject_master($subject_name, $subject_code, $department_id, $discrtption, $school_id, $UpdatedBy)
    {
        //the below function adds the assementtype type to the assementtype table
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "INSERT INTO `subjectmater` (SubjectName, SubjectCode, DepartmentCode, SubjectDiscription, SchoolID, UpdatedBy, IsActive) VALUES (:SubjectName,:SubjectCode,:DepartmentCode,:SubjectDiscription,:SchoolID,:UpdatedBy,1)ON DUPLICATE KEY UPDATE SubjectName=VALUES(SubjectName),UpdatedBy=VALUES(UpdatedBy);";
            $stm = $conn->prepare($query);

            $stm->execute(array(':SubjectName' => $subject_name, ':SubjectCode' => $subject_code, ':DepartmentCode' => $department_id, ':SubjectDiscription' => $discrtption, ':SchoolID' => $school_id, ':UpdatedBy' => $UpdatedBy));

            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }


    public static function add_bill($tansaction_id, $balance, $student_public_id, $UpdatedBy, $amount)
    {
        //the below function adds the assementtype type to the assementtype table

        $post_amount_update = $balance - $amount;
        try {
            $Connection = new Connection();
            $conn = $Connection->accounts_db_connect();

            $conn->beginTransaction();

            $query = "INSERT INTO transactiondetails (TransactionMasterPublicID, ReciptNo, PaidAmout, Balace, PaymentType, PaidBy, RecivedBy, UpdatedBy) VALUES ('$tansaction_id', GetSequence(23), '$amount', '$post_amount_update', 1, '$student_public_id', '$UpdatedBy', '$UpdatedBy')";
            $stm = $conn->prepare($query);

            $stm->execute();

            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }


    public static function add_term_master($term_name, $UpdatedBy, $tenant_id)
    {
        //the below function adds the assementtype type to the assementtype table
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "INSERT INTO `termmaster` (TenantID, TermName, IsSysActive, IsActive, UpdatedBy) VALUES (:TenantID,:TermName,0,1,:UpdatedBy);";
            $stm = $conn->prepare($query);

            $stm->execute(array(':TenantID' => $tenant_id, ':TermName' => $term_name, ':UpdatedBy' => $UpdatedBy));

            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            //echo $exc->getMessage();
            return FALSE;
        }
    }

    public static function add_period_master($period_name, $sequence, $school_id, $UpdatedBy)
    {
        //the below function adds the assementtype type to the assementtype table
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "INSERT INTO `periodmaster` (PeriodName, SchoolID, SequenceID, IsActive, UpdatedBy) VALUES (:PeriodName,:SchoolID,:SequenceID,1,:UpdatedBy);";
            $stm = $conn->prepare($query);

            $stm->execute(array(':PeriodName' => $period_name, ':SchoolID' => $school_id, ':SequenceID' => $sequence, ':UpdatedBy' => $UpdatedBy));

            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            // echo $exc->getMessage();
            return FALSE;
        }
    }


    public static function add_assement_type($assescment_type, $UpdatedBy, $tenant_id)
    {
        //the below function adds the assementtype type to the assementtype table
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "INSERT INTO `assementtypemaster` (`AssementTypeName`,`UpdatedBy`, `TenantID`,`IsActive`) VALUES (:AssementTypeName,:UpdatedBy,:TenantID,1);";
            $stm = $conn->prepare($query);

            $stm->execute(array(':AssementTypeName' => $assescment_type, ':UpdatedBy' => $UpdatedBy, ':TenantID' => $tenant_id));

            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            // echo $exc->getMessage();
            return FALSE;
        }
    }


    public static function add_seuence($sequence)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "INSERT INTO `sequencemaster` (`SequnceCode`) VALUES (:SequnceCode);";
            $stm = $conn->prepare($query);

            $stm->execute(array(':SequnceCode' => $sequence));

            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            //echo $exc->getMessage();
            return FALSE;
        }
    }

    public static function add_attendacy($tem_data)
    {
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

            foreach ($tem_data as $data) {
                //print_r($data);
                if (!empty($data[0])) {
                    // print_r($data);
                    $stm->execute($data);
                } else {

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

    public static function update_time_table($tem_data, $day)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();
            if ($day == 1) {
                $query = "UPDATE timetabledetails SET Monday = ? , UpdatedBy = ? WHERE TimeTableDetailsID = ?;";
            } else if ($day == 2) {
                $query = "UPDATE timetabledetails SET Tuesday = ? , UpdatedBy = ? WHERE TimeTableDetailsID = ?;";
            } else if ($day == 3) {
                $query = "UPDATE timetabledetails SET Wednesday = ? , UpdatedBy = ? WHERE TimeTableDetailsID = ?;";
            } else if ($day == 4) {
                $query = "UPDATE timetabledetails SET Thursday = ? , UpdatedBy = ? WHERE TimeTableDetailsID = ?;";
            } else if ($day == 5) {
                $query = "UPDATE timetabledetails SET Friday = ? , UpdatedBy = ? WHERE TimeTableDetailsID = ?;";
            } else {
                $query = '';
            }


            $stm = $conn->prepare($query);

            //print_r($stm);
            foreach ($tem_data as $data) {
                // print_r($data);
                if (!empty($data[2])) {
                    // print_r($data);
                    $stm->execute($data);
                } else {

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

    public static function add_class($calss_master_id, $class_teacher_id, $grade_id, $class_name, $class_code, $discription, $updatedby, $tenant_id, $tem_data)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();
            // print_r(count($tem_data[0]));
            //$args  = array_fill(0, count($tem_data[0]), '?');
            //Insets data new session into the session table
            $query = "INSERT INTO classmaster (ClassMasterPublicID,ClassTeacherID, GradeMasterID, ClassName, ClassCode, Description, UpdatedBy, TenantID,IsActive) VALUES (:ClassMasterPublicID,:ClassTeacherID,:GradeMasterID, :ClassName,:ClassCode, :Description, :UpdatedBy, :TenantID,1) ON DUPLICATE KEY UPDATE  ClassTeacherID=VALUES(ClassTeacherID),ClassName=VALUES(ClassName),ClassCode=VALUES(ClassCode),Description=VALUES(Description),UpdatedBy=VALUES(UpdatedBy)";
            $stm = $conn->prepare($query);
            $stm->execute(array(':ClassMasterPublicID' => $calss_master_id, ':ClassTeacherID' => $class_teacher_id, ':GradeMasterID' => $grade_id, ':ClassName' => $class_name, ':ClassCode' => $class_code, ':Description' => $discription, ':UpdatedBy' => $updatedby, ':TenantID' => $tenant_id));

            $query1 = "INSERT INTO classdetails (ClassDetailsPublicID,ClassMasterPublicID, SubjectCode, ClassRoomPublicID, UpdatedBy) VALUES (?,?, ?, ?, ?) ON DUPLICATE KEY UPDATE  SubjectCode=VALUES(SubjectCode),ClassRoomPublicID=VALUES(ClassRoomPublicID),UpdatedBy=VALUES(UpdatedBy)";
            $stm2 = $conn->prepare($query1);
            // print_r($stm);
            foreach ($tem_data as $data) {
                // print_r($data);
                if (!empty($data[0])) {
                    //  print_r($data);
                    $stm2->execute($data);
                } else {

                }

                //  
            }


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


    public static function add_time_table_master($calss_master_id, $period_id, $time_from, $to_time, $UpdatedBy)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "INSERT INTO `3edu_db`.`timetablemaster` (`ClassMasterID`, `PeriodMasterID`, `TimeFrom`, `TimeTo`, `IsActive`, `UpdatedBy`) VALUES (:ClassMasterID, :PeriodMasterID, :TimeFrom, :TimeTo, '1', :UpdatedBy);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':ClassMasterID' => $calss_master_id, ':PeriodMasterID' => $period_id, ':TimeFrom' => $time_from, ':TimeTo' => $to_time, ':UpdatedBy' => $UpdatedBy));


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


    public static function add_deparments($department_data)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "INSERT INTO department (`DepartmentID`,`DepartmentName`,ShortHand,`SchoolMasterID`, `UpdatedBy`, `IsActive`)  VALUES(?,?,?,?,?,1) ON DUPLICATE KEY UPDATE DepartmentName=VALUES(DepartmentName),UpdatedBy=VALUES(UpdatedBy)";
            $stm = $conn->prepare($query);

            // print_r($subject_data);
            foreach ($department_data as $department_data) {
                //print_r($grade_data);
                if (!empty($department_data[0])) {
                    //print_r($department_data);
                    $stm->execute($department_data);
                } else {

                }

                //  
            }


            //print_r($stm);
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            // echo $exc->getMessage();
            return FALSE;
        }
    }

    public static function add_grade($grade_data)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "INSERT INTO grademaster (`GradeMasterID`,`Grade`, `TenantID`, `UpdatedBy`, `IsActive`)  VALUES(?,?,?,?,1) ON DUPLICATE KEY UPDATE Grade=VALUES(Grade),TenantID=VALUES(TenantID),UpdatedBy=VALUES(UpdatedBy)";
            $stm = $conn->prepare($query);

            // print_r($subject_data);
            foreach ($grade_data as $grade_data) {
                //print_r($grade_data);
                if (!empty($grade_data[0])) {
                    // print_r($class_room_data);
                    $stm->execute($grade_data);
                } else {

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

    public static function add_class_room($class_room_data)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "INSERT INTO classroom (ClassRoomPublicID, ClassRoomName, UpdatedBy, TenantID,IsActive) VALUES(?,?,?,?,1) ON DUPLICATE KEY UPDATE ClassRoomName=VALUES(ClassRoomName)";
            $stm = $conn->prepare($query);

            // print_r($subject_data);
            foreach ($class_room_data as $class_room_data) {
                //print_r($class_room_data);
                if (!empty($class_room_data[0])) {
                    // print_r($class_room_data);
                    $stm->execute($class_room_data);
                } else {

                }

                //  
            }


            //print_r($stm);
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            // echo $exc->getMessage();
            return FALSE;
        }
    }

    public static function get_all_transaction_history($student_public_id)
    {

        $Connection = new Connection();
        $conn = $Connection->accounts_db_connect();

        $query = "CALL GetBillTransactionHistory(:student_public_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':student_public_id' => $student_public_id));

        return $stm;
    }


    public static function get_all_transaction_histoy_by_transaction_id($transactionmaster_public_id)
    {

        $Connection = new Connection();
        $conn = $Connection->accounts_db_connect();

        $query = "CALL GetBillTransactionHistroryByTransactionID(:student_public_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':student_public_id' => $transactionmaster_public_id));

        return $stm;
    }


    public static function get_all_master_transaction_history($student_public_id)
    {

        $Connection = new Connection();
        $conn = $Connection->accounts_db_connect();

        $query = "CALL GetBillTransactionMasterDataByStudentID(:student_public_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':student_public_id' => $student_public_id));

        return $stm;
    }

    public static function add_feechrge_room($charge_data)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->accounts_db_connect();

            $conn->beginTransaction();

            $query = "INSERT INTO feecharges (GradeMasterID, Grade, Amount, TermID,TenantMasterID,IsCharged,UpdatedBy) VALUES(?,?,?,?,?,?,?)";
            $stm = $conn->prepare($query);

            // print_r($subject_data);
            foreach ($charge_data as $charge_data) {
                //print_r($class_room_data);
                if (!empty($charge_data[0])) {
                    // print_r($charge_data);
                    $stm->execute($charge_data);
                } else {

                }

                //  
            }


            //print_r($stm);
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            //  echo $exc->getMessage();
            return FALSE;
        }
    }


    public static function create_school($it_id, $pic_url, $nrc, $passport, $username, $password, $first_name, $last_name, $other_name, $email_address, $concat_no, $gender_id, $marital_status_id, $dob, $user_type, $UpdatedBy, $pramary_address, $secondary_address, $district_id, $tenant_id, $emmisno, $shcoolname, $schoolmotto, $web_site, $max_term, $tel, $phoneno, $longitude, $latitude, $school_description, $logo_pic_url, $school_id, $shortname)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();
            // print_r(count($tem_data[0]));
            //$args  = array_fill(0, count($tem_data[0]), '?');
            //Insets data new session into the session table


            $query5 = "INSERT INTO tenantmaster (TenantID, TenantName) VALUES (:TenantID,:TenantName)";
            $stm5 = $conn->prepare($query5);
            $stm5->execute(array(':TenantID' => $tenant_id, ':TenantName' => $shcoolname));


            $query4 = "INSERT INTO schoolmaster (PublicID, EMISNO, PicURL, SchoolName, SchoolMotto, SchoolURl, SchoolDescription, MaxTerms, Longitude, Latitude, Tel, PhoneNo, IsActive, UpdatedBy, TenantID,ShortName) VALUES (:PublicID, :EMISNO, :PicURL, :SchoolName, :SchoolMotto, :SchoolURl, :SchoolDescription, :MaxTerms, :Longitude, :Latitude, :Tel, :PhoneNo, 1, :UpdatedBy, :TenantID,:ShortName)";
            $stm4 = $conn->prepare($query4);
            $stm4->execute(array(':PublicID' => $school_id, ':EMISNO' => $emmisno, ':PicURL' => $logo_pic_url, ':SchoolName' => $shcoolname, ':SchoolMotto' => $schoolmotto, ':SchoolURl' => $web_site, ':SchoolDescription' => $school_description, ':MaxTerms' => $max_term, ':Longitude' => $longitude, ':Latitude' => $latitude, ':Tel' => $tel, ':PhoneNo' => $phoneno, ':UpdatedBy' => $UpdatedBy, ':TenantID' => $tenant_id, ':ShortName' => $shortname));


            $query = "INSERT INTO usermaster(PublicID, ProfilPicURL, NRC, Passport, UserName, Password, FirstName, LastName, OtherName, EmailAddress, ContactNo, GenderID, MaritalStatusID, DOB, UserTypeID, UpdatedBy, IsActive,TenantID)VALUES (:PublicID, :ProfilPicURL, :NRC, :Passport, :UserName, :Password, :FirstName, :LastName, :OtherName, :EmailAddress, :ContactNo, :GenderID, :MaritalStatusID, :DOB, :UserTypeID, :UpdatedBy, 0,:TenantID)";
            $stm = $conn->prepare($query);
            $stm->execute(array(':PublicID' => $it_id, ':ProfilPicURL' => $pic_url, ':NRC' => $nrc, ':Passport' => $passport, ':UserName' => $username, ':Password' => $password, ':FirstName' => $first_name, ':LastName' => $last_name, ':OtherName' => $other_name, ':EmailAddress' => $email_address, ':ContactNo' => $concat_no, ':GenderID' => $gender_id, ':MaritalStatusID' => $marital_status_id, ':DOB' => $dob, ':UserTypeID' => $user_type, ':UpdatedBy' => $UpdatedBy, ':TenantID' => $tenant_id));


            $query3 = "INSERT INTO address (PrimaryAddress, SecondaryAddress, DistrictID, IdentificationID) VALUES (:PrimaryAddress, :SecondaryAddress, :DistrictID, :IdentificationID)";
            $stm3 = $conn->prepare($query3);
            $stm3->execute(array(':PrimaryAddress' => $pramary_address, ':SecondaryAddress' => $secondary_address, ':DistrictID' => $district_id, ':IdentificationID' => $it_id));


            //print_r($stm);
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            // echo $exc->getMessage();
            return FALSE;
        }
    }


    public static function update_school($emmisno, $shcoolname, $schoolmotto, $web_site, $max_term, $tel, $phoneno, $longitude, $latitude, $school_description, $school_id, $shortname, $UpdatedBy)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();
            // print_r(count($tem_data[0]));
            //$args  = array_fill(0, count($tem_data[0]), '?');
            //Insets data new session into the session table


            $query4 = "UPDATE schoolmaster SET EMISNO=:EMISNO,SchoolName=:SchoolName,ShortName=:ShortName,SchoolMotto=:SchoolMotto,SchoolURl=:SchoolURl,SchoolDescription=:SchoolDescription,MaxTerms=:MaxTerms,Longitude=:Longitude,Latitude=:Latitude,Tel=:Tel,PhoneNo=:PhoneNo,UpdatedBy=:UpdatedBy WHERE PublicID=:PublicID";
            $stm4 = $conn->prepare($query4);
            $stm4->execute(array(':EMISNO' => $emmisno, ':SchoolName' => $shcoolname, ':ShortName' => $shcoolname, ':SchoolMotto' => $schoolmotto, ':SchoolURl' => $web_site, ':SchoolDescription' => $school_description, ':MaxTerms' => $max_term, ':Longitude' => $longitude, ':Latitude' => $latitude, ':Tel' => $tel, ':PhoneNo' => $phoneno, ':UpdatedBy' => $UpdatedBy, ':PublicID' => $school_id,));


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


    public static function create_teacher($teacher_id, $pic_url, $nrc, $passport, $username, $password, $first_name, $last_name, $other_name, $email_address, $concat_no, $gender_id, $marital_status_id, $dob, $user_type, $UpdatedBy, $position_id, $department_id, $pramary_address, $secondary_address, $district_id, $tenant_id, $subject_data)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();
            // print_r(count($tem_data[0]));
            //$args  = array_fill(0, count($tem_data[0]), '?');
            //Insets data new session into the session table
            $query = "INSERT INTO usermaster(PublicID, ProfilPicURL, NRC, Passport, UserName, Password, FirstName, LastName, OtherName, EmailAddress, ContactNo, GenderID, MaritalStatusID, DOB, UserTypeID, UpdatedBy, IsActive,TenantID)VALUES (:PublicID, :ProfilPicURL, :NRC, :Passport, :UserName, :Password, :FirstName, :LastName, :OtherName, :EmailAddress, :ContactNo, :GenderID, :MaritalStatusID, :DOB, :UserTypeID, :UpdatedBy, 0,:TenantID)";
            $stm = $conn->prepare($query);
            $stm->execute(array(':PublicID' => $teacher_id, ':ProfilPicURL' => $pic_url, ':NRC' => $nrc, ':Passport' => $passport, ':UserName' => $username, ':Password' => $password, ':FirstName' => $first_name, ':LastName' => $last_name, ':OtherName' => $other_name, ':EmailAddress' => $email_address, ':ContactNo' => $concat_no, ':GenderID' => $gender_id, ':MaritalStatusID' => $marital_status_id, ':DOB' => $dob, ':UserTypeID' => $user_type, ':UpdatedBy' => $UpdatedBy, ':TenantID' => $tenant_id));

            $query2 = "INSERT INTO teachermaster (TeaherMasterPublicID, TeacherPositionID, DeparmrntCode, UpdatedBy, IsActive) VALUES (:TeaherMasterPublicID, :TeacherPositionID, :DeparmrntCode, :UpdatedBy, 1)";
            $stm2 = $conn->prepare($query2);
            $stm2->execute(array(':TeaherMasterPublicID' => $teacher_id, ':TeacherPositionID' => $position_id, ':DeparmrntCode' => $department_id, ':UpdatedBy' => $UpdatedBy));

            $query3 = "INSERT INTO address (PrimaryAddress, SecondaryAddress, DistrictID, IdentificationID) VALUES (:PrimaryAddress, :SecondaryAddress, :DistrictID, :IdentificationID)";
            $stm3 = $conn->prepare($query3);
            $stm3->execute(array(':PrimaryAddress' => $pramary_address, ':SecondaryAddress' => $secondary_address, ':DistrictID' => $district_id, ':IdentificationID' => $teacher_id));
//            
//            
            $query4 = "INSERT INTO teacherdetails (TeacherDetailsPublicID, TeacherMasterPublicID, SubjectCode, UpdatedBy) VALUES (?,?,?,?)";
            $stm4 = $conn->prepare($query4);

            // print_r($subject_data);
            foreach ($subject_data as $subject_data) {
                // print_r($subject_data);
                if (!empty($subject_data[0])) {
                    // print_r($subject_data);
                    $stm4->execute($subject_data);
                } else {

                }

                //  
            }


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


    public static function create_accountant($pic_url, $acc_id, $nrc, $passport, $username, $hushed_password, $first_name, $last_name, $other_name, $email_address, $concat_no, $gender_id, $marital_status_id, $dob, $user_type, $UpdatedBy, $position_id, $department_id, $pramary_address, $secondary_address, $district_id, $tenant_id)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();
            // print_r(count($tem_data[0]));
            //$args  = array_fill(0, count($tem_data[0]), '?');
            //Insets data new session into the session table
            $query = "INSERT INTO usermaster(PublicID, ProfilPicURL, NRC, Passport, UserName, Password, FirstName, LastName, OtherName, EmailAddress, ContactNo, GenderID, MaritalStatusID, DOB, UserTypeID, UpdatedBy, IsActive,TenantID)VALUES (:PublicID, :ProfilPicURL, :NRC, :Passport, :UserName, :Password, :FirstName, :LastName, :OtherName, :EmailAddress, :ContactNo, :GenderID, :MaritalStatusID, :DOB, :UserTypeID, :UpdatedBy, 0,:TenantID)";
            $stm = $conn->prepare($query);
            $stm->execute(array(':PublicID' => $acc_id, ':ProfilPicURL' => $pic_url, ':NRC' => $nrc, ':Passport' => $passport, ':UserName' => $username, ':Password' => $hushed_password, ':FirstName' => $first_name, ':LastName' => $last_name, ':OtherName' => $other_name, ':EmailAddress' => $email_address, ':ContactNo' => $concat_no, ':GenderID' => $gender_id, ':MaritalStatusID' => $marital_status_id, ':DOB' => $dob, ':UserTypeID' => $user_type, ':UpdatedBy' => $UpdatedBy, ':TenantID' => $tenant_id));

            $query2 = "INSERT INTO userdetails (UserDetailsPublicID,UserMasterID, PositionID, DepartmentID, UpdatedBy, IsActive) VALUES (GetSequence(25),:UserMasterID,:PositionID, :DepartmentID, :UpdatedBy, 1)";
            $stm2 = $conn->prepare($query2);
            $stm2->execute(array(':UserMasterID' => $acc_id, ':PositionID' => $position_id, ':DepartmentID' => $department_id, ':UpdatedBy' => $UpdatedBy));

            $query3 = "INSERT INTO address (PrimaryAddress, SecondaryAddress, DistrictID, IdentificationID) VALUES (:PrimaryAddress, :SecondaryAddress, :DistrictID, :IdentificationID)";
            $stm3 = $conn->prepare($query3);
            $stm3->execute(array(':PrimaryAddress' => $pramary_address, ':SecondaryAddress' => $secondary_address, ':DistrictID' => $district_id, ':IdentificationID' => $acc_id));

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

    public static function add_acessment($tem_data)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();
            // print_r(count($tem_data[0]));
            //$args  = array_fill(0, count($tem_data[0]), '?');
            //Insets data new session into the session table
            $query = "INSERT INTO `studnetassesment` (`StudentMasterPublicID`, `AssecemntTypeMasterID`, `ClassMasterPublicID`, `Score`, `Commment`, `UpdatedBy`,`AssecementName`,`SubjectMasterID`) VALUES (?, ?, ?, ?, ?, ?,?,?);";
            $stm = $conn->prepare($query);

            // print_r($stm);
            foreach ($tem_data as $data) {
                // print_r($data);
                if (!empty($data[0])) {
                    //  print_r($data);
                    $stm->execute($data);
                } else {

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

    public static function uplaod_lesson_plan($lesonplantitle, $file_url, $UpdatedBy)
    {
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

            $stm->execute(array($lesonplantitle, '1', $file_url, $UpdatedBy, $UpdatedBy));

            //print_r($stm);
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            // echo $exc->getMessage();
            return FALSE;
        }
    }

    function get_class_by_grade_id($gradeid)
    {
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
            while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['ClassMasterPublicID'] . ">" . $row['class'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo '</select></div></div>';
        } else {

            echo ' <div class="form-group"> <label class="bmd-label-floating">Class</label> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" name="class_id" id = "class_id" "> <option value="" disabled="disabled" selected="selected">Select Class</option></select></div></div>';
        }
    }

    function get_subject_by_class_id($classid)
    {
        //This function is used to load the subject on selection of class Id 
        $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the subjects after passing in an class ID 
        $query = "CALL GetClassSubjectsByClassMasterID(:class_id,:school_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $classid));

        if ($stm->rowCount() > 0) {

            //What the beow lines of code are doing is they are loading a subjects and displying them in a dropdown using php

            echo '<div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_1_selection()" id="subject_code_1" name="subject_code_1"> <option value="" disabled="disabled" selected="selected">Subject 1 </option>';
            while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SubjectCode'] . ">" . $row['Subject'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo '</select></div></div>';
        } else {

            echo ' <div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_1_selection()" id="subject_code_1" name="subject_code_1"> <option value="" disabled="disabled" selected="selected">Subject 1 </option> </select></div></div>';
        }
    }

    function get_subject_by_class_id_2($classid)
    {
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
            while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SubjectCode'] . ">" . $row['Subject'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo '</select></div></div>';
        } else {

            echo ' <div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_2_selection()" id="subject_code_2" name="subject_code_2"> <option value="" disabled="disabled" selected="selected">Subject 2 </option> </select></div></div>';
        }
    }

    function get_subject_by_class_id_3($classid)
    {
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
            while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SubjectCode'] . ">" . $row['Subject'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo '</select></div></div>';
        } else {

            echo ' <div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_3_selection()" id="subject_code_3" name="subject_code_3"> <option value="" disabled="disabled" selected="selected">Subject 3 </option> </select></div></div>';
        }
    }

    function get_subject_by_class_id_4($classid)
    {
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
            while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SubjectCode'] . ">" . $row['Subject'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo '</select></div></div>';
        } else {

            echo ' <div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_4_selection()" id="subject_code_4" name="subject_code_4"> <option value="" disabled="disabled" selected="selected">Subject 4 </option> </select></div></div>';
        }
    }

    function get_subject_by_class_id_5($classid)
    {
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
            while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SubjectCode'] . ">" . $row['Subject'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo '</select></div></div>';
        } else {

            echo ' <div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_5_selection()" id="subject_code_5" name="subject_code_5"> <option value="" disabled="disabled" selected="selected">Subject 5 </option> </select></div></div>';
        }
    }

    function get_subject_by_class_id_6($classid)
    {
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
            while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SubjectCode'] . ">" . $row['Subject'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo '</select></div></div>';
        } else {

            echo ' <div class="form-group"> <div class="form-select-list"> <select  required="" class="form-control custom-select-value" onchange="validate_subject_6_selection()" id="subject_code_6" name="subject_code_6"> <option value="" disabled="disabled" selected="selected">Subject 6 </option> </select></div></div>';
        }
    }

    function get_subject_by_class_id_7($classid)
    {
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
            while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SubjectCode'] . ">" . $row['Subject'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo '</select></div></div>';
        } else {

            echo ' <div class="form-group"> <div class="form-select-list"> <select  class="form-control custom-select-value" onchange="validate_subject_7_selection()" id="subject_code_7" name="subject_code_7"> <option value="" disabled="disabled" selected="selected">Subject 7 </option> </select></div></div>';
        }
    }

    function get_subject_by_class_id_8($classid)
    {
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
            while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SubjectCode'] . ">" . $row['Subject'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }

            echo '</select></div></div>';
        } else {

            echo ' <div class="form-group"> <div class="form-select-list"> <select  class="form-control custom-select-value" onchange="validate_subject_8_selection()" id="subject_code_8" name="subject_code_8"> <option value="" disabled="disabled" selected="selected">Subject 8 </option> </select></div></div>';
        }
    }

    //This is for searchable combos 

    public static function get_all_classes()
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllClasses();";

        $stm = $conn->query($query);

        return $stm;
    }


    public static function get_all_classes_by_tenant_id($tenant_id)
    {
        //this is a where you should 
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllClassesByTenantID(:tenant_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenant_id));
        return $stm;
    }

    public static function get_all_classes_with_mapped_subjects($tenant_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllClassesWithMappedSubjects(:tenant_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':tenant_id' => $tenant_id));

        return $stm;
    }


    function get_all_subjects($class_id, $school_id)
    {
        //This function is used to load the districts whih a given province ID
        $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the destrics after passing in an province ID 
        $query = "CALL GetSubjectsByClassMasterPublicID(:class_id,:school_id);";

///maonpwe

        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $class_id, ':school_id' => $school_id));

        if ($stm->rowCount() > 0) {

            //What the beow lines of code are doing is they are loading a districts and displying them in a dropdown using php
            echo "  <option value='' disabled='disabled' selected='selected' >Select Subject</option> ";
            while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['SubjectMaterID'] . ">" . $row['SubjectName'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }
        } else {

            echo "  <option value='' disabled='disabled' selected='selected' >Select Subject</option> ";
        }
    }

    function get_all_acessment_types($class_id, $subject_code, $tenant_id)
    {
        //This function is used to load the districts whih a given province ID
        $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the destrics after passing in an province ID 
        $query = "CALL GetAssecmentTypeBySubjectCode(:class_id,:subject_code,:tenant_id);";

///maonpwe

        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $class_id, ':subject_code' => $subject_code, ':tenant_id' => $tenant_id));

        if ($stm->rowCount() > 0) {

            //What the beow lines of code are doing is they are loading a districts and displying them in a dropdown using php
            echo "  <option value='' disabled='disabled' selected='selected' >Select Acessment Type</option> ";
            while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['AssementTypeID'] . ">" . $row['AssementTypeName'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }
        } else {

            echo "  <option value='' disabled='disabled' selected='selected' >Select Acessment Type</option> ";
        }
    }

    function get_student_details_by_class_id($class_id)
    {
        //This function is used to load Students in the studentassecment.php grid 
        $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the destrics after passing in an province ID 
        $query = "CALL GetAllStudentDetailsByClassMasterPublicID(:class_id,:assecmenttype_id);";

///maonpwe

        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $class_id, ':assecmenttype_id' => '000000'));

        if ($stm->rowCount() > 0) {

            //What the beow lines of code are doing is they are loading a districts and displying them in a dropdown using php

            while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {


                $public_id = $row['StudentMasterPublicID'];
                ?>
                <tr>
                    <input name="student_puplic_id[]" value="<?php echo $public_id; ?>" type="hidden"/>
                    <td><?php echo $row['StudentNo']; ?></td>

                    <td><?php echo $row['NameInfo']; ?></td>
                    <td><?php echo $row['Class']; ?></td>

                    <td><input maxlength="3" m="100" min="0" name="score[]" required="" placeholder="Enter %"/></td>
                    <td><input name="comment[]" placeholder="Enter Comment"/></td>

                </tr>
                <?php
            }
        } else {

        }
    }


    function get_student_data_by_id($class_id, $assecmenttype_id)
    {
        $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the destrics after passing in an province ID 
        $query = "CALL GetAllStudentDetailsByClassMasterPublicID(:class_id,:assecmenttype_id);";

///maonpwe

        $stm = $conn->prepare($query);
        $stm->execute(array(':class_id' => $class_id, ':assecmenttype_id' => $assecmenttype_id));


        if ($stm->rowCount() > 0) {

            //What the beow lines of code are doing is they are loading a districts and displying them in a dropdown using php
            echo "  <option value='' disabled='disabled' selected='selected' >Select Student</option> ";
            while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['StudentMasterPublicID'] . ">" . $row['NameData'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }
        } else {

            echo "  <option value='' disabled='disabled' selected='selected' >Select Student</option> ";
        }
    }

//Searchable combos end     


    public static function get_classes_by_grade_id($grade_id)
    {

        //dsds

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllClassesByGradeID(:grade_id);";
        $stm = $conn->prepare($query);

        $stm->execute(array(':grade_id' => $grade_id));

        return $stm;
    }

    public static function get_student_details_by_student_no($studentNo)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllStudentDetailsByStudentNo(:stuentNo);";
        $stm = $conn->prepare($query);

        $stm->execute(array(':stuentNo' => $studentNo));

        $row = $stm->fetch(PDO::FETCH_ASSOC);

        return $row;
    }

    public static function get_student_details_by_student_public_id($studentMasterPublicID)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllStudentDetailsByPublicID(:studentMasterPublicID);";
        $stm = $conn->prepare($query);

        $stm->execute(array(':studentMasterPublicID' => $studentMasterPublicID));

        $row = $stm->fetch(PDO::FETCH_ASSOC);

        return $row;
    }

    public static function regiter_pupil($first_name, $last_name, $other_name, $gender_id, $dob, $marital_status_id, $class_id, $subject_code_1, $subject_code_2, $subject_code_3, $subject_code_4, $subject_code_5, $subject_code_6, $subject_code_7, $subject_code_8, $male_gardian_name, $female_gardian_name, $gardian_contact_no, $address, $StudentMasterPublicID, $StudentNo, $file_temp, $UpdatedBy, $email_address)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $subject_array = array();

            $query = "INSERT INTO `studentmaster` (`StudentMasterPublicID`, `ProfilePic`, `StudentNo`, `FirstName`, `LastName`, `OtherName`, `GenderID`, `MaritalStatusID`, `DOB`, `GuardianContactNo`, `GuardianMaleName`, `GuardianFemaleName`, `Address`, `UpdatedBy`, `IsActive`,`EmailAddress`, `ClassMasterPublicID`) VALUES (:StudentMasterPublicID, :ProfilePic, :StudentNo, :FirstName, :LastName, :OtherName, :GenderID, :MaritalStatusID, :DOB, :GuardianContactNo, :GuardianMaleName, :GuardianFemaleName, :Address, :UpdatedBy, '1',:EmailAddress,:ClassMasterPublicID);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':StudentMasterPublicID' => $StudentMasterPublicID, ':ProfilePic' => $file_temp, ':StudentNo' => $StudentNo, ':FirstName' => $first_name, ':LastName' => $last_name, ':OtherName' => $other_name, ':GenderID' => $gender_id, ':MaritalStatusID' => $marital_status_id, ':DOB' => $dob, ':GuardianContactNo' => $gardian_contact_no, ':GuardianMaleName' => $male_gardian_name, ':GuardianFemaleName' => $female_gardian_name, ':Address' => $address, ':UpdatedBy' => $UpdatedBy, ':EmailAddress' => $email_address, ':ClassMasterPublicID' => $class_id));

            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            // echo $exc->getMessage();
            return FALSE;
        }
    }

    public static function get_subjects_by_class_id($class_master_id, $school_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetClassSubjectsByID(:class_master_id,:school_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':class_master_id' => $class_master_id, ':school_id' => $school_id));

        //$stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();
        //print_r($stm);


        return $stm;
    }

    public static function get_teacher_positions()
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetPositions();";
        $stm = $conn->query($query);

        return $stm;
    }

    public static function get_departments_school_id($school_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllDepartmentsByShoolID(:shcool_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':shcool_id' => $school_id));

        return $stm;
    }


    public static function get_departments_school_id_and_dpt_code($school_id, $department_code)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetDepartmentBySchoolIDAndDptCode(:shcool_id,:dpt_code);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':shcool_id' => $school_id, ':dpt_code' => $department_code));

        return $stm;
    }

    public static function get_all_teachers_in_department($department_code)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetTeachersInDepartmentByDepartmentCode('$department_code');";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();
        //print_r($stm);


        return $stm;
    }

    public static function get_department_by_code($department_code)
    {

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


    public static function get_all_period_types($school_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();


        $query = "CALL GetAllActivePeriods(:shcool_id);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':shcool_id' => $school_id));

        return $stm;


    }


    public static function get_marital_status()
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetMaritalStatus();";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();
        //print_r($stm);


        return $stm;
    }

    public static function get_gender()
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetGender();";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();
        //print_r($stm);


        return $stm;
    }

//3ed section end 


    public static function get_leave_types()
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetLeaveTypes();";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();
        //print_r($stm);


        return $stm;
    }

    public static function get_teacher_worked_time($start_date, $end_date)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetTeacherWorkedTime('$start_date','$end_date');";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();
        //print_r($stm);


        return $stm;
    }

    public static function get_hod_teacher_worked_time($start_date, $end_date, $departmentcode)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetTeacherWorkedTimeByDeparment('$start_date','$end_date','$departmentcode');";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();
        //print_r($stm);


        return $stm;
    }

    public static function get_teacher_absent_time($start_date, $end_date)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetTeacherAbsentTime('$start_date','$end_date');";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();
        //print_r($stm);


        return $stm;
    }

    public static function get_hod_teacher_absent_time($start_date, $end_date, $departmentcode)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetTeacherAbsentTimeByDepatemntCode('$start_date','$end_date','$departmentcode');";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();
        //print_r($stm);

        return $stm;
    }

    public static function get_teacher_leave_taken($teacher_id, $start_date, $end_date)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetLeaveTeken('$teacher_id','$start_date','$end_date');";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();
        //print_r($stm);


        return $stm;
    }

    public static function get_empty_result()
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetEmptyResult();";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();
        //print_r($stm);


        return $stm;
    }

    public static function get_awarded_teacher()
    {
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

    public static function get_country_code()
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetCountryCode();";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();
        //print_r($stm);


        return $stm;
    }

    public static function get_all_school_depatments()
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetAllDepartments();";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();
        //print_r($stm);


        return $stm;
    }

    public static function get_provinces()
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetProvinces();";
        $stm = $conn->query($query);

        return $stm;
    }

    public static function get_leave_request_data($details_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetLeaveRequestDetails('$details_id');";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();

        $row = $stm->fetch(PDO::FETCH_ASSOC);

        return $row;
    }

    public static function get_sequence_id($sequence_number)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetSequence($sequence_number);";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();

        $row = $stm->fetch(PDO::FETCH_ASSOC);

        return $row['SequnceNumber'];
    }

    public static function get_student_no($sequence_number)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetStudentNo($sequence_number);";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();

        $row = $stm->fetch(PDO::FETCH_ASSOC);

        return $row['SequnceNumber'];
    }

    public static function get_email_by_positon_id($position_code_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        //This function is used to get the emaile address based on the depatment and opsition it founed in the position master table 

        $query = "CALL GetEmailAdressByPositionID('$position_code_id');";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();


        return $stm;
    }

    public static function get_email_by_positon_id_department_code($department_code, $position_code)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        //This function is used to get the emaile address based on the depatment and opsition it founed in the position master table 

        $query = "CALL GetHODEmailAdressByDepartment('$department_code',$position_code);";
        $stm = $conn->query($query);
        // $stm->execute(array(':username' => $User->username));
        //$stm->execute();


        return $stm;
    }

    public static function get_email_by_id($public_id)
    {

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

    public static function is_teacher_onleave($public_id)
    {

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

    public static function is_today_working_day()
    {

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

    public static function get_worked_hours($teacher_master_public_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetWorkedHours('$teacher_master_public_id');";
        $stm = $conn->query($query);

//
        $row = $stm->fetch(PDO::FETCH_ASSOC);
//         
        return $row['HoursWorks'];
    }

    public static function get_teacher_no_report_times($teacher_master_public_id)
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetNoOfTeacherReportTimes('$teacher_master_public_id');";
        $stm = $conn->query($query);

//
        $row = $stm->fetch(PDO::FETCH_ASSOC);
//         
        return $row['Reportedtimes'];
    }

    public static function get_next_holiday()
    {

        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetNextHoliday();";
        $stm = $conn->query($query);

        $row = $stm->fetch(PDO::FETCH_ASSOC);
//         
        return $row['NextHolidy'];
    }

    public static function check_checked_in_status($teacher_master_id)
    {
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

    public static function check_checked_out_status($teacher_master_id)
    {
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

    public static function check_out_teacher($TeacherMasterPublicID)
    {
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "CALL CheckTeacherOut(:TeacherMasterPublicID);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':TeacherMasterPublicID' => $TeacherMasterPublicID));

            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            //echo $exc->getMessage();
            return FALSE;
        }
    }

    function get_districts_by_provinceid($provinceid)
    {
        //This function is used to load the districts whih a given province ID
        $Connection = new Connection();
        $conn = $Connection->connect();

        // this is the stored procidure from the datbaes that is loading the destrics after passing in an province ID 
        $query = "CALL GetDistrictByProvinceId(:province);";

        $stm = $conn->prepare($query);
        $stm->execute(array(':province' => $provinceid));

        if ($stm->rowCount() > 0) {

            //What the beow lines of code are doing is they are loading a districts and displying them in a dropdown using php

            echo "<option required='' value='' disabled='disabled' selected='selected'>Select District</option>";
            while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {


                echo "<option value=" . $row['districtId'] . ">" . $row['name'] . "</option>";
                //echo "<option vlaue='21'>".$row['name']."</option>";name
            }
        } else {

            echo "<option required='' value='' disabled='disabled' selected='selected'>Select District</option>";
        }
    }

    public static function add_email_data($EmailData)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "INSERT INTO `emailservice` (`EmailSerial`, `EmailAddress`, `EmailSubject`, `SendData`, `Status`, `UpdatedBy`) VALUES (:EmailSerial, :EmailAddress, :EmailSubject, :SendData, :Status, :UpdatedBy);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':EmailSerial' => $EmailData->EmailSerial, ':EmailAddress' => $EmailData->EmailAddress, ':EmailSubject' => $EmailData->EmailSubject, ':SendData' => $EmailData->SendData, ':Status' => $EmailData->Status, ':UpdatedBy' => $EmailData->UpdatedBy));

            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            //  echo $exc->getMessage();
            return FALSE;
        }
    }

    public static function update_user_password($user_public_id, $password)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "CALL UpdatePasswordByUserPublicID(:UserpublicID,:Password);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':UserpublicID' => $user_public_id, ':Password' => $password));

            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            // echo $exc->getMessage();
            return FALSE;
        }
    }

    public static function update_final_request($StatusCode, $UpdatedBy, $ApprovedBy, $TeacherDetailsPublicID)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "CALL ProcessFinalLeaveRequest(:StatusCode, :UpdatedBy, :ApprovedBy,:TeacherDetailsPublicID);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':StatusCode' => $StatusCode, ':UpdatedBy' => $UpdatedBy, 'ApprovedBy' => $ApprovedBy, 'TeacherDetailsPublicID' => $TeacherDetailsPublicID));

            // print_r($query) ;

            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            // echo $exc->getMessage();
            return FALSE;
        }
    }

    public static function set_teachers_leave_flag($TeacherDetailsPublicID, $faug)
    {
        //the below function creates a session in the databes for every log in 

        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "CALL SetLeaveTeacherLeveFlug(:TeacherDetailsPublicID,:Flug);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':TeacherDetailsPublicID' => $TeacherDetailsPublicID, ':Flug' => $faug));

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

    public static function update_laave_request($StatusCode, $UpdatedBy, $ApprovedBy, $TeacherDetailsPublicID)
    {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "CALL ProcessLeaveRequest(:StatusCode, :UpdatedBy, :ApprovedBy,:TeacherDetailsPublicID);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':StatusCode' => $StatusCode, ':UpdatedBy' => $UpdatedBy, 'ApprovedBy' => $ApprovedBy, 'TeacherDetailsPublicID' => $TeacherDetailsPublicID));

            // print_r($query) ;

            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            // echo $exc->getMessage();
            return FALSE;
        }
    }

    //The below functionis for user activation #

    public static function search_for_user($shearch_data, $search_query)
    {
        $Connection = new Connection();
        $conn = $Connection->connect();

        if ($search_query == 1) {
            $query = "CALL SearchUsers('$shearch_data', '$shearch_data', '$shearch_data');";
        }
        if ($search_query == 2) {
            $query = "CALL SearchActivatedUsers('$shearch_data', '$shearch_data', '$shearch_data');";
        }


        $stm = $conn->query($query);

        return $stm;
    }

    public static function deactivate_user($UseridID)
    {
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "CALL DeactivateUser(:UseridID);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':UseridID' => $UseridID));

            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            //echo $exc->getMessage();
            return FALSE;
        }
    }

    public static function activate_user($UseridID)
    {
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "CALL ActivateUser(:UseridID);";
            $stm = $conn->prepare($query);
            $stm->execute(array(':UseridID' => $UseridID));

            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            //echo $exc->getMessage();
            return FALSE;
        }
    }

    public static function get_user_details_by_id($teacher_master_id)
    {
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


    public static function updated_period_status($ClassMasterID, $UpdatedBy)
    {
        //the below function creates a session in the databes for every log in 

        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "CALL UpdateClassActiveStatusByID(:Classid,:UpdatedBy)";
            $stm = $conn->prepare($query);

            $stm->execute(array(':Classid' => $ClassMasterID, ':UpdatedBy' => $UpdatedBy));
            $conn->commit();

            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            // echo $exc->getMessage();
            return FALSE;
        }
    }


    public static function updated_asscecment_type_status($assecemnt_type_master_id, $UpdatedBy)
    {
        //the below function creates a session in the databes for every log in 

        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "CALL UpdateAssecemntTypeActiveStatusByID(:assecemnt_type_master_id,:UpdatedBy)";
            $stm = $conn->prepare($query);

            $stm->execute(array(':assecemnt_type_master_id' => $assecemnt_type_master_id, ':UpdatedBy' => $UpdatedBy));
            $conn->commit();

            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            // echo $exc->getMessage();
            return FALSE;
        }
    }


    public static function updated_term_master_status($term_master_id, $tenant_id, $UpdatedBy)
    {
        //the below function creates a session in the databes for every log in 

        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "CALL UpdateTermMasterStatus(:term_master_id,:tenant_id,:UpdatedBy)";
            $stm = $conn->prepare($query);

            $stm->execute(array(':term_master_id' => $term_master_id, ':tenant_id' => $tenant_id, ':UpdatedBy' => $UpdatedBy));
            $conn->commit();

            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            // echo $exc->getMessage();
            return FALSE;
        }
    }

    public static function updated_period_master_status($period_master_id, $UpdatedBy)
    {
        //the below function creates a session in the databes for every log in 

        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "CALL UpdatePeriodMaterActiveStatusByID(:period_master_id,:UpdatedBy)";
            $stm = $conn->prepare($query);

            $stm->execute(array(':period_master_id' => $period_master_id, ':UpdatedBy' => $UpdatedBy));
            $conn->commit();

            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            // echo $exc->getMessage();
            return FALSE;
        }
    }


    public static function updated_subject_master_status($subject_master_id, $UpdatedBy)
    {
        //the below function creates a session in the databes for every log in 

        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "CALL UpdateSubjectMaterActiveStatusByID(:subject_master_id,:UpdatedBy)";
            $stm = $conn->prepare($query);

            $stm->execute(array(':subject_master_id' => $subject_master_id, ':UpdatedBy' => $UpdatedBy));
            $conn->commit();

            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            // echo $exc->getMessage();
            return FALSE;
        }
    }


    public static function updated_student_status($StudentID, $UpdatedBy)
    {
        //the below function creates a session in the databes for every log in 

        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "CALL UpdateStudentLokedStatus(:Studentid,:UpdatedBy)";
            $stm = $conn->prepare($query);

            $stm->execute(array(':Studentid' => $StudentID, ':UpdatedBy' => $UpdatedBy));
            $conn->commit();

            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            // echo $exc->getMessage();
            return FALSE;
        }
    }


    public static function updated_teacher_status($TeacherID, $UpdatedBy)
    {
        //the below function creates a session in the databes for every log in 

        try {
            $Connection = new Connection();
            $conn = $Connection->connect();

            $conn->beginTransaction();

            $query = "CALL UpdateTeacherLockedStatus(:Teacherid,:UpdatedBy)";
            $stm = $conn->prepare($query);

            $stm->execute(array(':Teacherid' => $TeacherID, ':UpdatedBy' => $UpdatedBy));
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
