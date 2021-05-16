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

class MAdministrator extends MUser {
    
    use TContact;
    
    private $administratorId;
    
    function getAdministratorId() {
        return $this->administratorId;
    }

    function setAdministratorId($administratorId) {
        $this->administratorId = $administratorId;
    }


    
}
