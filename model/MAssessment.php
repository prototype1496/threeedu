<?php


class MAssessment {
    
    private $assessmentId;
    private $assessmentName;
    private $startDate;
    private $endDate;
    private $term;
    private $year;
    private $classId;
    
    function getAssessmentId() {
        return $this->assessmentId;
    }

    function getAssessmentName() {
        return $this->assessmentName;
    }

    function getStartDate() {
        return $this->startDate;
    }

    function getEndDate() {
        return $this->endDate;
    }

    function getTerm() {
        return $this->term;
    }

    function getYear() {
        return $this->year;
    }

    function getClassId() {
        return $this->classId;
    }

    function setAssessmentId($assessmentId) {
        $this->assessmentId = $assessmentId;
    }

    function setAssessmentName($assessmentName) {
        $this->assessmentName = $assessmentName;
    }

    function setStartDate($startDate) {
        $this->startDate = $startDate;
    }

    function setEndDate($endDate) {
        $this->endDate = $endDate;
    }

    function setTerm($term) {
        $this->term = $term;
    }

    function setYear($year) {
        $this->year = $year;
    }

    function setClassId($classId) {
        $this->classId = $classId;
    }

}
