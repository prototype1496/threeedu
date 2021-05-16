<?php

if (session_id() == '' || !isset($_SESSION)) {
    session_start();
}
include_once "../includes/db_connection.php";
include_once "../controller/AcademicsController.php";
include_once "../controller/UserController.php";
include_once "../model/MSubject.php";
include_once "../model/MActivity.php";
include_once "../model/MClass.php";
include_once "../model/MFile.php";

class TeacherController extends Database {

    public function mainFunc() {

        $action = filter_input(INPUT_POST, 'action');
        //$action = "addActivity";

        if ($action == "addRemarks") {

            try {

                $remarks = $_POST['remarks'];
                $activityId = $_SESSION['activityId'];
                $pupilId = $_SESSION['pupilId'];
                $teacherId = $_SESSION['teacherId'];

                // $result = "Remarks: " . $remarks . "-" . $activityId . "-" . $pupilId . "-" . $teacherId;
                //$discussionId = $_SESSION['discussionId'];
                // $commenter = $_SESSION['commenter'];

                $result = $this->addRemarks($activityId, $remarks, $pupilId, $teacherId);

                die(json_encode(array('return' => $result)));
            } catch (Exception $e) {

                die(json_encode(array('return' => $e->getMessage())));
            }
        }

        if ($action == "addComment") {

            try {

                $comment = $_POST['comment'];
                $discussionId = $_SESSION['discussionId'];
                $commenter = $_SESSION['commenter'];

                $result = $this->addComment($comment, $commenter, $discussionId);

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

                $classId = $_SESSION['$classId'];
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
        if ($action == "getSubjectsByClass") {

            $classId = $_POST['classId'];
            //$classId = 1;
            $classObj = $this->getMClass($classId);
            $myJ = json_decode($classObj->getClassSubjects(), true);

            $list = array();
            foreach ($myJ as $key => $value) {

                $subjectObj = $this->getSubject($value["subjectId"]);

                $obj = new stdClass();
                $obj->subjectId = $subjectObj->getSubjectId();
                $obj->subjectName = $subjectObj->getSubjectName();
                $obj->grade = $subjectObj->getGrade();

                array_push($list, $obj);
            }
            die(json_encode(array('return' => json_encode($list))));
        }

        if ($action == "addActivity") {

            $activityName = $_POST['activityName'];
            $activityType = $_POST['activityTypeId'];
            $description = $_POST['activityDescription'];
            $topicId = $_SESSION['topicId'];
            $classId = $_SESSION['classId'];            
            $startDate = $_POST['startDate'];
            $endDate = $_POST['endDate'];
            $status = 1;

            $result = $activityName . " - " . $activityType . " - " . $description . " - " . $topicId .
                    " - " . $classId . " - " . $startDate . " - " . $endDate . " - " . $status;

            try {

                $obj = new MActivity();
                $obj->setActivityName($activityName);
                $obj->setActivityType($activityType);
                $obj->setTopicId($topicId);
                $obj->setClassId($classId);
                $obj->setDescription($description);
                $obj->setStartDate($startDate);
                $obj->setEndDate($endDate);
                $obj->setStatus($status);

                $result = $this->addActivity($obj);

                die(json_encode(array('return' => $result)));
            } catch (Exception $e) {

                die(json_encode(array('return' => $e->getMessage())));
            }

            die(json_encode(array('return' => $result)));
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

                $result = $this->addMClass($obj);

                die(json_encode(array('return' => $result)));
            } catch (Exception $e) {

                die(json_encode(array('return' => $e->getMessage())));
            }
        }
    }

    public function addRemarks($activityId, $remarks, $pupilId, $teacherId) {

        $success = false;
        $activityObj = $this->getMActivity($activityId);
        $pupilsArr = array();
        if ($activityObj->getRemarks() == "") {

            $remarksObj = new stdClass();

            $remarksObj->teacherId = $teacherId;
            $remarksObj->remarks = $remarks;

            $remarksArr = array(
                $remarksObj
            );

            $pupilArr = new stdClass();
            $pupilArr->pupilId = $pupilId;
            $pupilArr->teacherRemarks = $remarksArr;

            $pupilsArr = array(
                $pupilArr
            );
        } else {

            $pupilsArr = json_decode($activityObj->getRemarks(), true);


            $arr_index = array();
            foreach ($pupilsArr as $key => $value) {
                if ($value['pupilId'] == $pupilId) {
                    $arr_index[] = $key;
                }
            }
            foreach ($arr_index as $i) {
                unset($pupilsArr[$i]);
            }

            $pupilsArr = array_values($pupilsArr);



            $remarksObj = new stdClass();

            $remarksObj->teacherId = $teacherId;
            $remarksObj->remarks = $remarks;

            $remarksArr = array(
                $remarksObj
            );

            $pupilArr = new stdClass();
            $pupilArr->pupilId = $pupilId;
            $pupilArr->teacherRemarks = $remarksArr;

            array_push($pupilsArr, $pupilArr);
        }

        $remarksJson = json_encode($pupilsArr);

        $sql = "UPDATE activity_tb SET remarks = ? WHERE activity_id = ?";
        $stmt = $this->pdo->prepare($sql);
        $arr = array($remarksJson, $activityId);
        $stmt->execute($arr);

        $success = true;

        return $success;
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

            $subjectsArr = json_decode($subjectsJ, true);
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

    public function addComment($comment, $commenter, $discussionId) {

        $result = false;
        $discussion = $this->getDiscussion($discussionId)->discussion;
        $discussionArr = array();

        if ($discussion == "") {

            $discussion = new stdClass();

            $discussion->commenter = $commenter;
            $discussion->comment = $comment;
            $t = time();
            $discussion->timeOfComment = date("Y-m-d H:i", $t);

            array_push($discussionArr, $discussion);
        } else {

            $discussionArr = json_decode($discussion, true);

            $discussion = new stdClass();

            $discussion->commenter = $commenter;
            $discussion->comment = $comment;
            $t = time();
            $discussion->timeOfComment = date("Y-m-d H:i", $t);

            array_push($discussionArr, $discussion);
        }

        $discussionJson = json_encode($discussionArr);

        $sql = "UPDATE discussion_tb SET discussion = ? WHERE discussion_id = ?";

        $stmt = $this->pdo->prepare($sql);
        $arr = array($discussionJson, $discussionId);
        $stmt->execute($arr);

        $result = true;

        return $result;
    }

    public function addActivity($obj) {

        $result = false;
        try {
            $valueArr = array(
                "activity_name" => $obj->getActivityName(),
                "description" => $obj->getDescription(),
                "activity_type" => $obj->getActivityType(),
                "topic_id" => $obj->getTopicId(),
                "class_id" => $obj->getClassId(),
                "start_date" => $obj->getStartDate(),
                "end_date" => $obj->getEndDate(),
                "status" => $obj->getStatus()
            );

            $sql = "INSERT INTO activity_tb";
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
                "grade" => $obj->getGrade()
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

    public function getDiscussionByActivity($activityId) {

        $obj = new stdClass();

        try {

            $stmt = $this->pdo->prepare("SELECT * FROM discussion_tb WHERE activity_id = ?");
            $values = array($activityId);
            $stmt->execute($values);

            $result = $stmt->fetch(PDO::FETCH_ASSOC);

            $obj->discussionId = $result["discussion_id"];
            $obj->discussion = $result["discussion"];
            $obj->activityId = $result["activity_id"];
        } catch (PDOException $e) {
            die($e->getMessage());
        }

        return $obj;
    }
    

    public function getDiscussion($discussionId) {

        $obj = new stdClass();

        try {

            $stmt = $this->pdo->prepare("SELECT * FROM discussion_tb WHERE discussion_id = ?");
            $values = array($discussionId);
            $stmt->execute($values);

            $result = $stmt->fetch(PDO::FETCH_ASSOC);

            $obj->discussionId = $result["discussion_id"];
            $obj->discussion = $result["discussion"];
            $obj->activityId = $result["activity_id"];
        } catch (PDOException $e) {
            die($e->getMessage());
        }

        return $obj;
    }

    public function getDiscussionByTopic($activityId) {

        $discussion = new stdClass();

        try {
            $stmt = $this->pdo->prepare("SELECT discussion_id FROM discussion_tb WHERE activity_id = ?");
            $values = array($activityId);
            $stmt->execute($values);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);

            $discussion = $this->getDiscussion($result["discussion_id"]);
            $discussionConversation = array();

            if ($discussion->discussion == "") {
                
            } else {
                $discussionArr = json_decode($discussion->discussion, true);

                foreach ($discussionArr as $key => $value) {

                    $obj = new stdClass();
                    $obj->commenter = $value["commenter"];
                    $obj->comment = $value["comment"];
                    $obj->timeofComment = $value["timeOfComment"];

                    array_push($discussionConversation, $obj);
                }
            }

            $discussion->discussionConversation = $discussionConversation;
        } catch (PDOException $e) {
            die($e->getMessage());
        }

        /* for($i = 0; $i < 10; $i++){
          $obj = new stdClass();
          $obj->commenter = "Moses Mwale";
          $obj->comment = "It's a live demo of the template. I have created Charisma to "
          . "ease the repeat work I have to do on my projects. "
          . "Now I re-use Charisma as a base for my admin panel work and I am sharing it with you :)";
          $obj->time = "2020-05-24 17:50";

          array_push($discussionList, $obj);

          } */

        return $discussion;
    }

    public function getSubjectsByClass($classId) {

        $subjectList = array();
        try {

            $stmt = $this->pdo->prepare("SELECT class_subjects FROM class_tb WHERE class_id = ?");
            $values = array($classId);
            $stmt->execute($values);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);

            $teacherClassArr = json_decode($result["class_subjects"], true);

            foreach ($teacherClassArr as $key => $value) {
                $subjectObj = $this->getSubject($value["subjectId"]);
                array_push($subjectList, $subjectObj);
            }
        } catch (PDOException $e) {
            die($e->getMessage());
        }
        return $subjectList;
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


        return $classObj;
    }

    public function getMActivity($id) {

        $stmt = $this->pdo->prepare("SELECT * FROM activity_tb WHERE activity_id = ?");
        $arr = array($id);
        $stmt->execute($arr);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        $activityObj = new MActivity;
        $activityObj->setActivityId($result["activity_id"]);
        $activityObj->setActivityName($result["activity_name"]);
        $activityObj->setActivityType($result["activity_type"]);
        $activityObj->setDescription($result["description"]);
        $activityObj->setClassId($result["class_id"]);
        $activityObj->setTopicId($result["topic_id"]);
        $activityObj->setStartDate($result["start_date"]);
        $activityObj->setEndDate($result["end_date"]);
        $activityObj->setStatus($result["status"]);
        $activityObj->setRemarks($result["remarks"]);

        return $activityObj;
    }

    public function getMFile($id) {

        $stmt = $this->pdo->prepare("SELECT * FROM files_tb WHERE file_id = ?");
        $arr = array($id);
        $stmt->execute($arr);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        $fileObj = new MFile;
        $fileObj->setFileId($result["file_id"]);
        $fileObj->setFileName($result["file_name"]);
        $fileObj->setTopicId($result["topic_id"]);
        $fileObj->setClassId($result["class_id"]);


        return $fileObj;
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

    public function getRemarks($pupilId, $activityId) {

        $remarksJ = $this->getMActivity($activityId)->getRemarks();
        $remarksArr = array();

        if ($remarksJ == "") {
            
        } else {
            $tRemarksArr = json_decode($remarksJ, true);
            $acdemicsController = new AcademicsController();

            try {

                foreach ($tRemarksArr as $key => $value) {

                    if ($value["pupilId"] == $pupilId) {
                        $remarksArr = $value["teacherRemarks"];
                    }
                }
            } catch (PDOException $e) {
                die($e->getMessage());
            }
        }


        return $remarksArr;
    }

    public function getTeacherSubjects($teacherClassJ) {

        $subjectList = array();

        if ($teacherClassJ == "") {
            
        } else {
            $teacherClassArr = json_decode($teacherClassJ, true);
            $acdemicsController = new AcademicsController();

            try {

                foreach ($teacherClassArr as $key => $value) {
                    $classObj = $this->getMClass($value["classId"]);
                    $subjectsArr = $value["subjects"];
                    foreach ($subjectsArr as $key => $value) {
                        $subjectObj = $acdemicsController->getSubject($value["subjectId"]);
                        array_push($subjectList, $subjectObj);
                    }
                }
            } catch (PDOException $e) {
                die($e->getMessage());
            }
        }

        return $subjectList;
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

    public function getFilesByTopic($topicId, $classId) {


        $filesList = array();

        try {

            $stmt = $this->pdo->prepare("SELECT file_id FROM files_tb WHERE topic_id = ? AND class_id = ?");
            $arr = array($topicId, $classId);
            $stmt->execute($arr);
            $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($results as $result) {
                $file = $this->getMFile($result["file_id"]);

                array_push($filesList, $file);
            }
        } catch (PDOException $e) {
            die($e->getMessage());
        }

        return $filesList;
    }

    public function getActivitiesByTopic($topicId, $classId) {


        $activityList = array();

        try {

            $stmt = $this->pdo->prepare("SELECT activity_id FROM activity_tb WHERE topic_id = ? AND class_id = ?");
            $arr = array($topicId, $classId);
            $stmt->execute($arr);
            $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($results as $result) {
                $activity = $this->getMActivity($result["activity_id"]);


                array_push($activityList, $activity);
            }
        } catch (PDOException $e) {
            die($e->getMessage());
        }

        return $activityList;
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

//$controller = new TeacherController;
//$controller->mainFunc();
//$userController = new UserController;
// $teacher  = $userController->getTeacher(1);
//$subjectList = $controller->getTeacherSubjects($teacher->getTeacherClasses());
// print_r($subjectList);

if (null !== (filter_input(INPUT_POST, 'action'))) {
    $controller = new TeacherController;
    $controller->mainFunc();
} /* else {
  $result = "true";

  die(json_encode(array('return' => $result)));
  } */
?>