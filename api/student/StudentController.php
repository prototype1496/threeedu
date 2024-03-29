<?php

require_once 'LoginApi.php';


class StudentController {

    private $db;
    private $requestMethod;
    private $userId;
    private $password;
    private $user;
    private $validUser = null;

    public function __construct($db, $requestMethod, $user) {
        $this->db = $db;
        $this->requestMethod = $requestMethod;
        $this->userId = $user['userId'];
        $this->password = $user['password'];
        $this->user = $user;
    }

    public function authenticateUser(){
        $loginHandler = new LoginApi($this->db,$this->user);
        $isUserValid = $loginHandler->authenticate();
        if ($isUserValid){
            $this->processRequest();
        }
    }

    private function processRequest() {
        switch ($this->requestMethod) {
            case 'GET':
                if ($this->userId) {
                    $response = $this->getStudentDetails($this->userId);
                }
                break;
            default:
                $response = $this->notFoundResponse();
                break;
        }
        if (isset($response['body'])) {
            echo $response['body'];
        }else{
            $response['status_code_header'] = 'HTTP/1.1 200 OK';
            $response['error'] = ["login failed"];
            header($response['status_code_header']);
            echo json_encode($response);
        }
    }

    private function getStudentDetails($userName) {
        $user_data = $this->getUserDetailsByName($userName);
        $studentPublicId = $user_data['PublicID'];
        $studentDetails = $this->getStudentDetailsByPublicId($studentPublicId);
        $classMasterPublicID = $studentDetails['ClassMasterPublicID'];
        $attendance = $this->getAttendanceDetails($studentPublicId);
        $timetable = $this->getTimetable($classMasterPublicID);
        $classname = SuperModel::get_class_name($classMasterPublicID);
        $schoolDetails = $this->getSchoolDetailsBySchoolId($user_data['SchoolPublicID']);
        $academicReport = $this->getAcademicResults($studentPublicId);
        $response['status_code_header'] = 'HTTP/1.1 200 OK';
        $response['body'] = json_encode(["classname" => $classname,"schoolName"=>$schoolDetails["SchoolName"], "personalInfo" => $studentDetails, "timetable" => $timetable, "attendance" => $attendance, "academicResults"=>$academicReport]);
        return $response;
    }

    private function getTimetable($classMasterPublicID) {
        $monday = array();
        $tuesday = array();
        $wednesday = array();
        $thursday = array();
        $friday = array();
        $periods = array();
        $get_timtable_data = SuperModel::get_timtable($classMasterPublicID);
        while ($row = $get_timtable_data->fetch(PDO::FETCH_ASSOC)) {
            array_push($monday, $row['SubjectCodeM']);
            array_push($tuesday, $row['SubjectCodeT']);
            array_push($wednesday, $row['SubjectCodeW']);
            array_push($thursday, $row['SubjectCodeTH']);
            array_push($friday, $row['SubjectCodeF']);
            array_push($periods, $row['PeriodName']);
        }
        $timetable = [
            "monday" => $monday,
            "tuesday" => $tuesday,
            "wednesday" => $wednesday,
            "thursday" => $thursday,
            "friday" => $friday,
            "periods" => $periods
        ];
        return $timetable;
    }

    private function getUserDetailsByName($userName) {
        try {
            $query = "CALL GetUserByUsername(:username)";
            $conn = $this->db->connect();
            $stm = $conn->prepare($query);
            $stm->execute(array(':username' => $userName));
            if ($stm->rowCount() > 0) {
                // fetch userData
                return $stm->fetch(PDO::FETCH_ASSOC);
            }
        } catch (Exception $e) {
            return $e;
        }
    }

    private function getStudentDetailsByPublicId($studentMasterPublicID) {
        $conn = $this->db->connect();
        $query = "CALL GetAllStudentDetailsByPublicID(:studentMasterPublicID);";
        $stm = $conn->prepare($query);
        $stm->execute(array(':studentMasterPublicID' => $studentMasterPublicID));
        $row = $stm->fetch(PDO::FETCH_ASSOC);
        return $row;
    }

    private function getSchoolDetailsBySchoolId($schoolId) {
        $conn = $this->db->connect();
        $query = "CALL GetAllSchoolDetailsBySchoolID(:schoolId);";
        $stm = $conn->prepare($query);
        $stm->execute(array(':schoolId' => $schoolId));
        return $stm->fetch(PDO::FETCH_ASSOC);
    }

    private function getAcademicResults($PUBLICID){
        $query = "CALL GetAccessmentByStudentPublicID(:public_id);";
        $conn = $this->db->connect();
        $stm = $conn->prepare($query);
        $stm->execute(array(':public_id' => $PUBLICID));
        $academicResults = array();

        if ($stm->rowCount() > 0) {
            while($row = $stm->fetch(PDO::FETCH_ASSOC)){
                array_push($academicResults,array(

                        "subject"=> $row["Subject"],
                        "assessmentName"=> $row["AssecementName"],
                        "score"=> $row["Score"],
                        "markedOn"=> $row["MarkedOn"]
                    )
                );
            }
            return $academicResults;
        } else {
            $row = $stm->fetch(PDO::FETCH_ASSOC);
            array_push($academicResults, [
                "subject"=> $row["Subject"],
                "assessmentName"=> $row["AssecementName"],
                "score"=> $row["Score"],
                "markedOn"=> $row["MarkedOn"]
            ]);
            return $academicResults;
        }
    }

    private function getAttendanceDetails($studentPublicId) {
        $attendance = SuperModel::get_single_studnet_attendance_report_by_id($studentPublicId);
        $studentAttendance = array();
        if ($attendance->rowCount() > 1) {
            while ($row_data = $attendance->fetch(PDO::FETCH_ASSOC)) {
                array_push($studentAttendance,
                    [
                        "studentNo" => $row_data['StudentNo'],
                        "reason"=> $row_data['Reason'],
                        "status"=> $row_data['Statue'],
                        "markOn"=> $row_data['MarkedOn']
                    ]
                   );
            }
            return $studentAttendance;
        }
        $row_data = $attendance->fetch(PDO::FETCH_ASSOC);
        array_push($studentAttendance,
            [
                "studentNo" => $row_data['StudentNo'],
                "reason"=> $row_data['Reason'],
                "status"=> $row_data['Statue'],
                "markOn"=> $row_data['MarkedOn']
            ]
        );
        return $studentAttendance;
    }
}