<?php

if (session_id() == '' || !isset($_SESSION)) {
    session_start();
}
include_once "../includes/db_connection.php";
include_once "../model/MSubject.php";
include_once "../model/MClass.php";
include_once "../model/MTopic.php";
include_once "../model/MAssessment.php";
include_once "../model/MReportForm.php";
include_once "../model/MAssessmentMark.php";
include_once "../controller/UserController.php";

class AcademicsController extends Database {

    public function mainFunc() {

        $action = filter_input(INPUT_POST, 'action');
        //$action = "addMarks";

        if ($action == "addMarks") {
            $result = "true";
            try {
                $commentsJson = json_decode($_POST["commentsJson"]);
                $marksJson = json_decode($_POST["marksJson"], true);

                $count = 0;
                $result;
                foreach ($marksJson as $key => $value) {

                    $idTemp = $value["id"];
                    $id = str_replace("m", "", $idTemp);
                    $marks = $value["marks"];
                    $comments = $commentsJson[$count]->comments;

                    $obj = new MAssessmentMark;
                    $obj->setAssessmentId($_SESSION["assessmentId"]);
                    $obj->setPupilId($id);

                    $marksArr = array();

                    $entry = new stdClass();
                    $entry->subjectId = $_SESSION["subjectId"];
                    $entry->marks = $marks;
                    $entry->comment = $comments;

                    array_push($marksArr, $entry);

                    $myJSON = json_encode($marksArr);

                    $obj->setAssessmentResults($myJSON);

                    $result = $this->addMarks($obj);
                    $count++;
                }

                die(json_encode(array('return' => $result)));
            } catch (Exception $e) {

                die(json_encode(array('return' => $e->getMessage())));
            }
        }

        if ($action == "addTopic") {

            try {
                $subjectId = $_SESSION["subjectId"];
                $obj = new MTopic();
                $obj->setTopicName($_POST['topicName']);
                $obj->setTopicDescription($_POST['topicDescription']);
                $obj->setSubjectId($subjectId);
                $result = $this->addTopic($obj);

                die(json_encode(array('return' => $result)));
            } catch (Exception $e) {

                die(json_encode(array('return' => $e->getMessage())));
            }
        }
        if ($action == "assignPupil") {

            try {

                $pupilId = $_SESSION['pupilId'];
                $classId = $_POST['classId'];

                $result = $this->assignClassPupil($classId, $pupilId);
                die(json_encode(array('return' => $result)));
            } catch (Exception $e) {

                die(json_encode(array('return' => $e->getMessage())));
            }
        }
        if ($action == "assignSubjectClass") {

            try {

                $classId = $_SESSION['classId'];
                $subjectId = $_POST['subjectId'];

                $result = $this->assignSubjectClass($classId, $subjectId);
                die(json_encode(array('return' => $result)));
            } catch (Exception $e) {

                die(json_encode(array('return' => $e->getMessage())));
            }
        }
        if ($action == "assignSubjectTeacher") {

            try {

                $teacherId = $_SESSION['teacherId'];
                $subjectId = $_POST['subjectId'];
                $classId = $_POST['classId'];

                $result = $this->assignSubjectTeacher($teacherId, $classId, $subjectId);
                unset($_SESSION['teacherId']);
                die(json_encode(array('return' => $result)));
            } catch (Exception $e) {

                die(json_encode(array('return' => $e->getMessage())));
            }
        }

        if ($action == "assignGradeTeacher") {

            try {

                $teacherId = $_SESSION['teacherId'];
                $classId = $_POST['classId'];

                $result = $this->assignGradeTeacher($teacherId, $classId);
                unset($_SESSION['teacherId']);
                die(json_encode(array('return' => $result)));
            } catch (Exception $e) {

                die(json_encode(array('return' => $e->getMessage())));
            }
        }

        if ($action == "getSubjectsByClass") {

            $classId = $_POST['classId'];
            //$classId = 1;
            $classObj = $this->getMClass($classId);
            $myJ = json_decode($classObj->getClassSubjects(), true);

            $list = array();
            foreach ($myJ as $key => $value) {

                if ($value["subjectId"] === 0) {
                    
                } else {
                    $subjectObj = $this->getSubject($value["subjectId"]);

                    $obj = new stdClass();
                    $obj->subjectId = $subjectObj->getSubjectId();
                    $obj->subjectName = $subjectObj->getSubjectName();
                    $obj->grade = $subjectObj->getGrade();

                    array_push($list, $obj);
                }
            }
            die(json_encode(array('return' => json_encode($list))));
        }
        if ($action == "addSubject") {

            try {

                $obj = new MSubject();
                $obj->setSubjectName($_POST['subjectName']);
                $obj->setGrade($_POST['grade']);

                $result = $this->addSubject($obj);

                die(json_encode(array('return' => $result)));
            } catch (Exception $e) {

                die(json_encode(array('return' => $e->getMessage())));
            }
        }
        if ($action == "addClass") {

            try {

                $obj = new MClass;
                $obj->setSection($_POST['section']);
                $obj->setGrade($_POST['grade']);

                $subjectsArr = array();

                $subject = new stdClass();
                $subject->subjectId = 0;
                array_push($subjectsArr, $subject);

                $myJSON = json_encode($subjectsArr);

                $obj->setClassSubjects($myJSON);

                $result = $this->addMClass($obj);

                die(json_encode(array('return' => $result)));
            } catch (Exception $e) {

                die(json_encode(array('return' => $e->getMessage())));
            }
        }
        if ($action == "addAssessment") {

            try {

                $obj = new MAssessment();
                $obj->setAssessmentName($_POST['assessmentName']);
                $obj->setStartDate($_POST['startDate']);
                $obj->setEndDate($_POST['endDate']);
                $obj->setTerm($_POST['term']);
                $obj->setYear($_POST['year']);
                $obj->setClassId($_SESSION["classId"]);

                $result = $this->addAssessment($obj);

                die(json_encode(array('return' => $result)));
            } catch (Exception $e) {

                die(json_encode(array('return' => $e->getMessage())));
            }
        }
    }

    public function assignClassPupil($classId, $pupilId) {

        $success = false;
        try {

            $sql = "UPDATE pupil_tb SET class_id = ? WHERE pupil_id = ?";

            $stmt = $this->pdo->prepare($sql);
            $arr = array($classId, $pupilId);
            $stmt->execute($arr);
            $success = true;
        } catch (PDOException $e) {
            echo $e->getMessage();
        }

        return $success;
    }

    public function assignSubjectClass($classId, $subjectId) {

        $success = false;
        try {

            $mClass = $this->getMClass($classId);
            $subjectsJ = $mClass->getClassSubjects();
            if ($subjectsJ == "") {
                $subjectsArr = array();
            } else {
                $subjectsArr = json_decode($subjectsJ, true);

                $arr_index = array();
                foreach ($subjectsArr as $key => $value) {
                    if ($value['subjectId'] == $subjectId) {
                        $arr_index[] = $key;
                    }
                }
                foreach ($arr_index as $i) {
                    unset($subjectsArr[$i]);
                }

                $subjectsArr = array_values($subjectsArr);
            }

            $subject = new stdClass();
            $subject->subjectId = $subjectId;
            array_push($subjectsArr, $subject);

            $myJSON = json_encode($subjectsArr);

            $sql = "UPDATE class_tb SET class_subjects = ? WHERE class_id = ?";

            $stmt = $this->pdo->prepare($sql);
            $arr = array($myJSON, $classId);
            $stmt->execute($arr);
            $success = true;
        } catch (PDOException $e) {
            echo $e->getMessage();
        }

        return $success;
    }

    public function assignSubjectTeacher($teacherId, $classId, $subjectId) {

        $success = false;
        try {

            $subject = new stdClass();
            $subject->subjectId = $subjectId;
            $subjectsArr = array(
                $subject
            );
            $mClass = new stdClass();
            $mClass->classId = $classId;
            $mClass->subjects = $subjectsArr;

            $mClassesArr = array(
                $mClass
            );

            $myJSON = json_encode($mClassesArr);


            $sql = "UPDATE teacher_tb SET teacher_classes = ? WHERE teacher_id = ?";


            $stmt = $this->pdo->prepare($sql);
            $arr = array($myJSON, $teacherId);
            $stmt->execute($arr);
            $success = true;
        } catch (PDOException $e) {
            echo $e->getMessage();
        }

        return $success;
    }

    public function assignGradeTeacher($teacherId, $classId) {

        $success = false;
        try {

            $sql = "UPDATE class_tb SET grade_teacher = ? WHERE class_id = ?";

            $stmt = $this->pdo->prepare($sql);
            $arr = array($teacherId, $classId);
            $stmt->execute($arr);
            $success = true;
        } catch (PDOException $e) {
            echo $e->getMessage();
        }

        return $success;
    }

    public function addTopic($obj) {

        $result = false;
        try {
            $valueArr = array(
                "topic_name" => $obj->getTopicName(),
                "topic_description" => $obj->getTopicDescription(),
                "subject_id" => $obj->getSubjectId()
            );

            $sql = "INSERT INTO topic_tb";
            $sql .= " (" . implode(",", array_keys($valueArr)) . ") VALUES ";
            $sql .= "('" . implode("','", array_values($valueArr)) . "')";

            $this->pdo->exec($sql);
            $result = true;
        } catch (PDOException $e) {
            die($e->getMessage());
        }

        return $result;
    }

    public function addSubject($obj) {

        $result = false;
        try {
            $valueArr = array(
                "subject_name" => $obj->getSubjectName(),
                "grade" => $obj->getGrade()
            );

            $sql = "INSERT INTO subject_tb";
            $sql .= " (" . implode(",", array_keys($valueArr)) . ") VALUES ";
            $sql .= "('" . implode("','", array_values($valueArr)) . "')";

            $this->pdo->exec($sql);
            $result = true;
        } catch (PDOException $e) {
            die($e->getMessage());
        }

        return $result;
    }

    public function addMarks($obj) {

        $result = false;
        try {
            $valueArr = array(
                "assessment_id" => $obj->getAssessmentId(),
                "pupil_id" => $obj->getPupilId(),
                "assessment_results" => $obj->getAssessmentResults()
            );

            $sql = "INSERT INTO assessment_marks_tb";
            $sql .= " (" . implode(",", array_keys($valueArr)) . ") VALUES ";
            $sql .= "('" . implode("','", array_values($valueArr)) . "')";

            $this->pdo->exec($sql);
            $result = true;
        } catch (PDOException $e) {
            die($e->getMessage());
        }

        return $result;
    }

    public function addMClass($obj) {

        $result = false;
        try {
            $valueArr = array(
                "section" => $obj->getSection(),
                "grade" => $obj->getGrade(),
                "class_subjects" => $obj->getClassSubjects()
            );

            $sql = "INSERT INTO class_tb";
            $sql .= " (" . implode(",", array_keys($valueArr)) . ") VALUES ";
            $sql .= "('" . implode("','", array_values($valueArr)) . "')";

            $this->pdo->exec($sql);
            $result = true;
        } catch (PDOException $e) {
            die($e->getMessage());
        }

        return $result;
    }

    public function addAssessment($obj) {

        $result = false;
        try {
            $valueArr = array(
                "assessment_name" => $obj->getAssessmentName(),
                "start_date" => $obj->getStartDate(),
                "end_date" => $obj->getEndDate(),
                "term" => $obj->getTerm(),
                "year" => $obj->getYear(),
                "class_id" => $obj->getClassId()
            );

            $sql = "INSERT INTO assessment_tb";
            $sql .= " (" . implode(",", array_keys($valueArr)) . ") VALUES ";
            $sql .= "('" . implode("','", array_values($valueArr)) . "')";

            $this->pdo->exec($sql);
            $result = true;
        } catch (PDOException $e) {
            die($e->getMessage());
        }

        return $result;
    }

    public function getAssessments($id) {

        $assessmentList = array();
        try {

            $stmt = $this->pdo->prepare("SELECT * FROM assessment_tb WHERE class_id = ?");
            $arr = array($id);
            $stmt->execute($arr);
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($result as $rObj) {


                $mObj = new MAssessment();
                $mObj->setAssessmentName($rObj["assessment_name"]);
                $mObj->setClassId($rObj["class_id"]);
                $mObj->setStartDate($rObj["start_date"]);
                $mObj->setEndDate($rObj["end_date"]);
                $mObj->setTerm($rObj["term"]);
                $mObj->setYear($rObj["year"]);
                $mObj->setAssessmentId($rObj["assessment_id"]);

                array_push($assessmentList, $mObj);
            }
        } catch (PDOException $e) {
            die($e->getMessage());
        }

        return $assessmentList;
    }

    public function getAssessment($id) {

        $stmt = $this->pdo->prepare("SELECT * FROM assessment_tb WHERE assessment_id = ?");
        $arr = array($id);
        $stmt->execute($arr);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $assessmentObj = new MAssessment();
        $assessmentObj->setAssessmentId($result["assessment_id"]);
        $assessmentObj->setAssessmentName($result["assessment_name"]);
        $assessmentObj->setClassId($result["class_id"]);
        $assessmentObj->setStartDate($result["start_date"]);
        $assessmentObj->setEndDate($result["end_date"]);
        $assessmentObj->setTerm($result["term"]);
        $assessmentObj->setYear($result["year"]);


        return $assessmentObj;
    }

    public function getSubject($id) {

        $stmt = $this->pdo->prepare("SELECT * FROM subject_tb WHERE subject_id = ?");
        $arr = array($id);
        $stmt->execute($arr);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $subjectObj = new MSubject();
        $subjectObj->setSubjectId($result["subject_id"]);
        $subjectObj->setSubjectName($result["subject_name"]);
        $subjectObj->setGrade($result["grade"]);

        return $subjectObj;
    }

    public function getSubjectsByClass($classId) {

        $subjectList = array();
        try {

            $stmt = $this->pdo->prepare("SELECT class_subjects FROM class_tb WHERE class_id = ?");
            $values = array($classId);
            $stmt->execute($values);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($result["class_subjects"] == "") {
                
            } else {
                $teacherClassArr = json_decode($result["class_subjects"], true);

                foreach ($teacherClassArr as $key => $value) {
                    if ($value["subjectId"] === 0) {
                        
                    } else {
                        $subjectObj = $this->getSubject($value["subjectId"]);
                        array_push($subjectList, $subjectObj);
                    }
                }
            }
        } catch (PDOException $e) {
            die($e->getMessage());
        }
        return $subjectList;
    }

    public function getSubjectsTaught($classId, $teacherClassesJSON) {

        $subjectList = array();

        $teacherClassArr = json_decode($teacherClassesJSON, true);

        try {

            foreach ($teacherClassArr as $key => $value) {
                if ($classId == $value["classId"]) {
                    $subjectsArr = $value["subjects"];
                    foreach ($subjectsArr as $key => $value) {
                        $subject = $this->getSubject($value["subjectId"]);
                        array_push($subjectList, $subject);
                    }
                }
            }
        } catch (PDOException $e) {
            die($e->getMessage());
        }


        return $subjectList;
    }

    public function getReportForm($pupilId, $assessmentId, $classId) {

        $subjectList = array();
        $reportForm = new MReportForm();
        
        try {

            $classPosition = 1;
            $pupilMarks = 0;
            $stmt = $this->pdo->prepare("SELECT * FROM assessment_marks_tb WHERE pupil_id = ? AND assessment_id = ?");
            $values = array($pupilId, $assessmentId);
            $stmt->execute($values);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($result["assessment_results"] == "") {
                
            } else {
                $subjectArr = json_decode($result["assessment_results"], true);

                foreach ($subjectArr as $key => $value) {
                    if ($value["subjectId"] === 0) {
                        
                    } else {

                        $subjectObj = $this->getSubject($value["subjectId"]);

                        $entry = new stdClass();
                        $entry->subjectName = $subjectObj->getSubjectName() . " " . $subjectObj->getGrade();
                        
                        $marks = $value["marks"];

                        $pupilMarks += $marks;
                        $grade;
                        if ($subjectObj->getGrade() > 9) {
                            if ($marks >= 75) {
                                $grade = "ONE";
                            }
                            if (($marks >= 65) && ($marks <= 74)) {
                                $grade = "TWO";
                            }
                            if (($marks >= 60) && ($marks <= 64)) {
                                $grade = "THREE";
                            }
                            if (($marks >= 55) && ($marks <= 59)) {
                                $grade = "FOUR";
                            }
                            if (($marks >= 50) && ($marks <= 54)) {
                                $grade = "FIVE";
                            }
                            if (($marks >= 45) && ($marks <= 49)) {
                                $grade = "SIX";
                            }
                            if (($marks >= 40) && ($marks <= 44)) {
                                $grade = "SEVEN";
                            }
                            if (($marks >= 35) && ($marks <= 39)) {
                                $grade = "EIGHT";
                            }
                            if ($marks <= 34) {
                                $grade = "NINE";
                            }
                        } else {
                            if ($marks >= 75) {
                                $grade = "ONE";
                            }
                            if (($marks >= 65) && ($marks <= 74)) {
                                $grade = "TWO";
                            }
                            if (($marks >= 55) && ($marks <= 64)) {
                                $grade = "THREE";
                            }
                            if (($marks >= 50) && ($marks <= 54)) {
                                $grade = "FOUR";
                            }
                            if ($marks < 50) {
                                $grade = "FAIL";
                            }
                        }

                        $entry->grade = $grade;
                        $entry->marks = $value["marks"];
                        $entry->comment = $value["comment"];

                        array_push($subjectList, $entry);
                    }
                }
            }

            $pupilList = $this->getPupilsByClass($classId);

            foreach ($pupilList as $pupil) {
                $pupil2Marks = 0;
                $stmt = $this->pdo->prepare("SELECT * FROM assessment_marks_tb WHERE pupil_id = ? AND assessment_id = ?");
                $values = array($pupil->getPupilId(), $assessmentId);
                $stmt->execute($values);
                $result = $stmt->fetch(PDO::FETCH_ASSOC);
                if ($result["assessment_results"] == "") {
                    
                } else {
                    $subjectArr = json_decode($result["assessment_results"], true);
                    $pupil2Marks = 0;
                    foreach ($subjectArr as $key => $value) {
                        if ($value["subjectId"] === 0) {
                            
                        } else {

                            $marks = $value["marks"];
                            $pupil2Marks += $marks;
                           
                            if($pupil2Marks > $pupilMarks){
                                $classPosition++;
                            }
                            
                        }
                    }
                }
            }
            $reportForm->setSubjectMarks($subjectList);
            $reportForm->setPosition($classPosition);
            
        } catch (PDOException $e) {
            die($e->getMessage());
        }
        return $reportForm;
    }

    public function getPupilsByClass($classId) {

        $pupilList = array();
        $userController = new UserController();

        try {

            $stmt = $this->pdo->prepare("SELECT * FROM pupil_tb WHERE class_id = ?");
            $values = array($classId);
            $stmt->execute($values);
            $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($results as $result) {
                $pupilObj = $userController->getPupil($result["pupil_id"]);
                array_push($pupilList, $pupilObj);
            }
        } catch (PDOException $e) {
            die($e->getMessage());
        }
        return $pupilList;
    }

    public function getTopic($id) {

        $stmt = $this->pdo->prepare("SELECT * FROM topic_tb WHERE topic_id = ?");
        $arr = array($id);
        $stmt->execute($arr);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        $classObj = new MTopic();
        $classObj->setTopicId($result["topic_id"]);
        $classObj->setTopicName($result["topic_name"]);
        $classObj->setTopicDescription($result["topic_description"]);
        $classObj->setSubjectId($result["subject_id"]);

        return $classObj;
    }

    public function getMClass($id) {

        $stmt = $this->pdo->prepare("SELECT * FROM class_tb WHERE class_id = ?");
        $arr = array($id);
        $stmt->execute($arr);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        $classObj = new MClass;
        $classObj->setClassId($result["class_id"]);
        $classObj->setSection($result["section"]);
        $classObj->setGrade($result["grade"]);
        $classObj->setClassSubjects($result["class_subjects"]);
        $classObj->setGradeTeacher($result["grade_teacher"]);


        return $classObj;
    }

    public function getAllSubjects($grade) {


        $subjectList = array();
        try {

            $stmt = $this->pdo->prepare("SELECT * FROM subject_tb WHERE grade = ?");
            $values = array($grade);
            $stmt->execute($values);
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($result as $subject) {
                $mSubject = new MSubject();
                $mSubject->setSubjectName($subject["subject_name"]);
                $mSubject->setSubjectId($subject["subject_id"]);
                $mSubject->setGrade($subject["grade"]);

                array_push($subjectList, $mSubject);
            }
        } catch (PDOException $e) {
            die($e->getMessage());
        }

        return $subjectList;
    }

    public function getTeacherClasses($teacherClassJ) {

        $classList = array();

        if ($teacherClassJ == "") {
            
        } else {
            $teacherClassArr = json_decode($teacherClassJ, true);

            try {

                foreach ($teacherClassArr as $key => $value) {
                    $classObj = $this->getMClass($value["classId"]);
                    array_push($classList, $classObj);
                }
            } catch (PDOException $e) {
                die($e->getMessage());
            }
        }

        return $classList;
    }

    public function getGradeTeacherClasses($teacherId) {

        $classList = array();

        try {

            $stmt = $this->pdo->prepare("SELECT * FROM class_tb WHERE grade_teacher = ?");
            $values = array($teacherId);
            $stmt->execute($values);
            $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($results as $result) {
                $mClass = $this->getMClass($result["class_id"]);
                array_push($classList, $mClass);
            }
        } catch (PDOException $e) {
            die($e->getMessage());
        }



        return $classList;
    }

    public function getTopicsBySubject($subjectId) {

        $topicList = array();

        try {

            $stmt = $this->pdo->prepare("SELECT * FROM topic_tb WHERE subject_id = ?");
            $values = array($subjectId);
            $stmt->execute($values);
            $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($results as $result) {
                $topic = $this->getTopic($result["topic_id"]);
                array_push($topicList, $topic);
            }
        } catch (PDOException $e) {
            die($e->getMessage());
        }

        return $topicList;
    }

    public function getClassesByGrade($grade) {


        $classList = array();
        try {

            $stmt = $this->pdo->prepare("SELECT * FROM class_tb WHERE grade = ?");
            $values = array($grade);
            $stmt->execute($values);
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($result as $class) {
                $mClass = new MClass();
                $mClass->setSection($class["section"]);
                $mClass->setClassId($class["class_id"]);
                $mClass->setGrade($class["grade"]);

                array_push($classList, $mClass);
            }
        } catch (PDOException $e) {
            die($e->getMessage());
        }

        return $classList;
    }

    public function getAllClasses() {


        $classList = array();
        try {

            $stmt = $this->pdo->prepare("SELECT * FROM class_tb");
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($result as $class) {
                $mClass = new MClass();
                $mClass->setSection($class["section"]);
                $mClass->setClassId($class["class_id"]);
                $mClass->setGrade($class["grade"]);

                array_push($classList, $mClass);
            }
        } catch (PDOException $e) {
            die($e->getMessage());
        }

        return $classList;
    }

}

//$controller = new AcademicsController;
//$controller->getSubjectsByClass(5);
if (null !== (filter_input(INPUT_POST, 'action'))) {
    $controller = new AcademicsController;
    $controller->mainFunc();
} /* else {
  $result = "true";

  die(json_encode(array('return' => $result)));
  } */
?>