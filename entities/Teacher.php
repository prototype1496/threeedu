<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Teacher
 *
 * @author HP
 */
class Teacher {
public $PublicID;
public $NRC;
public $Passport; 
public $UserName;
public $Password;
public $FirstName;
public $LastName;
public $OtherName;
public $EmailAddress;
public $ContactNo;
public $GenderID;
public $MaritalStatusID;
public $DOB;
public $UserTypeID;
public $UpdatedBy;
public $PositionID;
public $DepartmentID;
public $PrimaryAddress;
public $SecondaryAddress;
public $DistrictID;

      

function __construct($PublicID, $NRC, $Passport, $UserName, $Password, $FirstName, $LastName, $OtherName, $EmailAddress, $ContactNo, $GenderID, $MaritalStatusID, $DOB, $UserTypeID, $UpdatedBy, $PositionID,$DepartmentID, $PrimaryAddress, $SecondaryAddress, $DistrictID) {
    $this->PublicID = $PublicID;
    $this->NRC = $NRC;
    $this->Passport = $Passport;
    $this->UserName = $UserName;
    $this->Password = $Password;
    $this->FirstName = $FirstName;
    $this->LastName = $LastName;
    $this->OtherName = $OtherName;
    $this->EmailAddress = $EmailAddress;
    $this->ContactNo = $ContactNo;
    $this->GenderID = $GenderID;
    $this->MaritalStatusID = $MaritalStatusID;
    $this->DOB = $DOB;
    $this->UserTypeID = $UserTypeID;
    $this->UpdatedBy = $UpdatedBy;
    $this->PositionID = $PositionID;
    $this->DepartmentID = $DepartmentID;
    $this->PrimaryAddress = $PrimaryAddress;
    $this->SecondaryAddress = $SecondaryAddress;
    $this->DistrictID = $DistrictID;
}



}
