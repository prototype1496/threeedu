<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
class Connection{
    
    
  public function connect() {
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "3edu_db";

        // Create connection
//        $conn = new mysqli($servername, $username, $password, $dbname);
//
//        // Check connection
//        if ($conn->connect_error) {
//            die("Connection failed: " . $conn->connect_error);
//        }
        //echo "Connected successfully";
        
        try{
        $conn = new PDO(    'mysql:host='.$servername.';dbname='.$dbname.';charset=utf8mb4',
                            ''.$username.'',
                            ''.$password.'',
                    array(
                        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                        PDO::ATTR_PERSISTENT => false
                    )
                );
        
//         foreach($conn->query('SELECT UM.FirstName FROM usermaster UM ') as $row) {
//        print_r($row);
//        }
            return  $conn;
         } catch (PDOException $e) {
            print "Connection Error: ". "<br/>";
            $conn=Null;
            die();
}
  


         }   
         
         
         
         
         public function accounts_db_connect() {
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "3edu_accounts_db";

        // Create connection
//        $conn = new mysqli($servername, $username, $password, $dbname);
//
//        // Check connection
//        if ($conn->connect_error) {
//            die("Connection failed: " . $conn->connect_error);
//        }
        //echo "Connected successfully";
        
        try{
        $connection = new PDO(    'mysql:host='.$servername.';dbname='.$dbname.';charset=utf8mb4',
                            ''.$username.'',
                            ''.$password.'',
                    array(
                        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                        PDO::ATTR_PERSISTENT => false
                    )
                );
        
//         foreach($conn->query('SELECT UM.FirstName FROM usermaster UM ') as $row) {
//        print_r($row);
//        }
            return  $connection;
         } catch (PDOException $e) {
            print "Connection Error: ". "<br/>";
            $conn=Null;
            die();
}
  


         }  
  
}