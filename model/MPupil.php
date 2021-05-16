<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *  
 * @author Greenford
 */

include_once "MUser.php";

class MPupil extends MUser {

    private $pupilId;
    private $parentId;
    private $grade;
    private $classId;

    function getPupilId() {
        return $this->pupilId;
    }

    function getParentId() {
        return $this->parentId;
    }

    function setPupilId($pupilId) {
        $this->pupilId = $pupilId;
    }

    function setParentId($parentId) {
        $this->parentId = $parentId;
    }
    
    function getGrade() {
        return $this->grade;
    }

    function setGrade($grade) {
        $this->grade = $grade;
    }
    function getClassId() {
        return $this->classId;
    }

    function setClassId($classId) {
        $this->classId = $classId;
    }



}
