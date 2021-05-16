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

class MParent extends MUser {
    
    use TContact;
    
    private $parentId;
    private $registrationId;
    private $children;
    
    function getParentId() {
        return $this->parentId;
    }

    function getRegistrationId() {
        return $this->registrationId;
    }

    function getChildren() {
        return $this->children;
    }

    function setParentId($parentId) {
        $this->parentId = $parentId;
    }

    function setRegistrationId($registrationId) {
        $this->registrationId = $registrationId;
    }

    function setChildren($children) {
        $this->children = $children;
    } 

    
}
