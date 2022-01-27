<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Token
 *
 * @author HP
 */
class Token {
    
    public $token_username;
    public $token;
    public $reset_date;
    
    
    function __construct($token_username, $token, $resent_date) {
        $this->token_username = $token_username;
        $this->token = $token;
        $this->reset_date = $resent_date;
    }


       
    
}
