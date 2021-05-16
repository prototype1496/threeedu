<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of MAdministrator
 *
 * @author Greenford
 */

include_once "TContact.php";
include_once "MUser.php";

class MTeacher extends MUser {
    
    use TContact;
    
    private $teacherId;
    private $teacherClasses;
    private $gradeTeacherClasses;
            
    function getTeacherId() {
        return $this->teacherId;
    }

    function setTeacherId($teacherId) {
        $this->teacherId = $teacherId;
    }

    function getTeacherClasses() {
        return $this->teacherClasses;
    }

    function setTeacherClasses($teacherClasses) {
        $this->teacherClasses = $teacherClasses;
    }
    
    function getGradeTeacherClasses() {
        return $this->gradeTeacherClasses;
    }

    function setGradeTeacherClasses($gradeTeacherClasses) {
        $this->gradeTeacherClasses = $gradeTeacherClasses;
    }



    
}
