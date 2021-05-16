<?php


class MSubject {
    
    private $subjectId;
    private $subjectName;
    private $grade;
    
    function getSubjectId() {
        return $this->subjectId;
    }

    function getSubjectName() {
        return $this->subjectName;
    }

    function getGrade() {
        return $this->grade;
    }

    function setSubjectId($subjectId) {
        $this->subjectId = $subjectId;
    }

    function setSubjectName($subjectName) {
        $this->subjectName = $subjectName;
    }

    function setGrade($grade) {
        $this->grade = $grade;
    }


}
