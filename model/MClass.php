<?php


class MClass {
    
    private $classId;
    private $section;
    private $grade;
    private $classSubjects;
    private $gradeTeacher;
   
    function getClassId() {
        return $this->classId;
    }

    function getSection() {
        return $this->section;
    }

    function getGrade() {
        return $this->grade;
    }

    function setClassId($classId) {
        $this->classId = $classId;
    }

    function setSection($section) {
        $this->section = $section;
    }

    function setGrade($grade) {
        $this->grade = $grade;
    }

    function getClassSubjects() {
        return $this->classSubjects;
    }

    function setClassSubjects($classSubjects) {
        $this->classSubjects = $classSubjects;
    }
    
    function getGradeTeacher() {
        return $this->gradeTeacher;
    }

    function setGradeTeacher($gradeTeacher) {
        $this->gradeTeacher = $gradeTeacher;
    }





}
