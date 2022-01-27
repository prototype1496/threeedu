<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of EmailService
 *
 * @author HP
 */
class EmailService {
   public $EmailSerial;
   public $EmailAddress;
   public $EmailSubject;
   public $SendData;
   public $Status;
   public $UpdatedBy;
   
   
   function __construct($EmailSerial, $EmailAddress, $EmailSubject, $SendData, $Status, $UpdatedBy) {
       $this->EmailSerial = $EmailSerial;
       $this->EmailAddress = $EmailAddress;
       $this->EmailSubject = $EmailSubject;
       $this->SendData = $SendData;
       $this->Status = $Status;
       $this->UpdatedBy = $UpdatedBy;
   }

}
