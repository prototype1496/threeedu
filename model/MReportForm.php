<?php


class MReportForm {
    
    private $pupilId;
    private $assessmentId;
    private $assessmentResults;
    private $subjectMarks;
    private $position;
    private $classTotal;
    
    function getPupilId() {
        return $this->pupilId;
    }

    function getAssessmentId() {
        return $this->assessmentId;
    }

    function getAssessmentResults() {
        return $this->assessmentResults;
    }

    function setPupilId($pupilId) {
        $this->pupilId = $pupilId;
    }

    function setAssessmentId($assessmentId) {
        $this->assessmentId = $assessmentId;
    }

    function setAssessmentResults($assessmentResults) {
        $this->assessmentResults = $assessmentResults;
    }

    function getSubjectMarks() {
        return $this->subjectMarks;
    }

    function getPosition() {
        return $this->position;
    }

    function getClassTotal() {
        return $this->classTotal;
    }

    function setSubjectMarks($subjectMarks) {
        $this->subjectMarks = $subjectMarks;
    }

    function setPosition($position) {
        $this->position = $position;
    }

    function setClassTotal($classTotal) {
        $this->classTotal = $classTotal;
    }



}