<?php

class MActivity {
    
    private $activityId;
    private $activityName;
    private $description;
    private $activityType;
    private $topicId;
    private $classId;
    private $startDate;
    private $endDate;
    private $status;
    private $remarks;
    
    function getActivityId() {
        return $this->activityId;
    }

    function getActivityName() {
        return $this->activityName;
    }

    function getActivityType() {
        return $this->activityType;
    }

    function getTopicId() {
        return $this->topicId;
    }

    function getClassId() {
        return $this->classId;
    }

    function getStartDate() {
        return $this->startDate;
    }

    function getEndDate() {
        return $this->endDate;
    }

    function setActivityId($activityId) {
        $this->activityId = $activityId;
    }

    function setActivityName($activityName) {
        $this->activityName = $activityName;
    }

    function setActivityType($activityType) {
        $this->activityType = $activityType;
    }

    function setTopicId($topicId) {
        $this->topicId = $topicId;
    }

    function setClassId($classId) {
        $this->classId = $classId;
    }

    function setStartDate($startDate) {
        $this->startDate = $startDate;
    }

    function setEndDate($endDate) {
        $this->endDate = $endDate;
    }
    function getStatus() {
        return $this->status;
    }

    function setStatus($status) {
        $this->status = $status;
    }

    function getDescription() {
        return $this->description;
    }

    function setDescription($description) {
        $this->description = $description;
    }
    
    function getRemarks() {
        return $this->remarks;
    }

    function setRemarks($remarks) {
        $this->remarks = $remarks;
    }


    
}
