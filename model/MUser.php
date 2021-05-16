<?php


class MUser {
   
    private $userId;
    private $firstName;
    private $lastName;
    private $gender; 
    private $userRole;

    function getUserId() {
        return $this->userId;
    }

    function getFirstName() {
        return $this->firstName;
    }

    function setUserId($userId) {
        $this->userId = $userId;
    }

    function setFirstName($firstName) {
        $this->firstName = $firstName;
    }
    
    function getUserRole() {
        return $this->userRole;
    }

    function setUserRole($userRole) {
        $this->userRole = $userRole;
    }
    
    function getLastName() {
        return $this->lastName;
    }

    function getGender() {
        return $this->gender;
    }


    function setLastName($lastName) {
        $this->lastName = $lastName;
    }

    function setGender($gender) {
        $this->gender = $gender;
    }  
  
    

}
