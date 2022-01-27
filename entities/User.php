<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of User
 *
 * @author HP
 */
class User {
    public $username ;
    public $password;
   
    function __construct($username, $password) {
        $this->username = $username;
        $this->password = $password;
    }

    
}
