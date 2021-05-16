<?php


class MAssessmentMark {
    
    private $entryId;
    private $pupilId;
    private $assessmentId;
    private $assessmentResults;
   
    function getEntryId() {
        return $this->entryId;
    }

    function getPupilId() {
        return $this->pupilId;
    }

    function getAssessmentId() {
        return $this->assessmentId;
    }

    function getAssessmentResults() {
        return $this->assessmentResults;
    }

    function setEntryId($entryId) {
        $this->entryId = $entryId;
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



}
