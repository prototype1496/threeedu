<?php

/**
 * Description of Login
 *
 * @author Alinuswe #prototype
 */
class Login {

    function authenticate($User) {
        //this functiion is used to authenticate the user by usinng only the user name and reterning details of the user
        $Connection = new Connection();
        $conn = $Connection->connect();

        $query = "CALL GetUserByUsername(:username)";
        $stm = $conn->prepare($query);
        $stm->execute(array(':username' => $User->username));

        if ($stm->rowCount() > 0) {

            //not the below code retuns an assaciative arrey with all the users infomation 
            $row = $stm->fetch(PDO::FETCH_ASSOC);
            return $row;
        }
    }

    function verify_password($user_data, $entered_password) {

        //$hashedPassword = password_hash($entered_password, PASSWORD_DEFAULT);
        //This function is used to verify if the entered password is the same as the one in the databes 
        //so as to authenticate the user
        $hushed_password = $user_data['Password'];
        $verifid_password = password_verify($entered_password, $hushed_password);


        return $verifid_password;
    }

    function genarate_tocken($size) {
        //this function genarates a rnadom tocken with a spesifc size given
        return bin2hex(random_bytes($size));
    }

    function create_session($User) {
        //the below function creates a session in the databes for every log in 
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            $user_master_public_id = $User['PublicID']; //the public id of user
            $user_name = $User['UserName']; //username of user
            $seq_no = 3; //the sequence number for serial sequnce 
            $tocken = Login::genarate_tocken(32); //the token genarated calls the genarate token function
            $token_time_genarated = $_SERVER["REQUEST_TIME"];
            $conn->beginTransaction();

            //query to delet all privious sessions
            $query = "DELETE FROM `session` WHERE UserMasterPublicID = :user_master_public_id";
            $stm = $conn->prepare($query);

            $stm->execute(array(':user_master_public_id' => $user_master_public_id));
//                $row = $stm->fetch(PDO::FETCH_ASSOC);
//                $row['UserMasterPublicID'];
            //query to get the serial id;
            $query2 = "CALL GetSequence(:seq_no)";
            $stm = $conn->prepare($query2);
            $stm->execute(array(':seq_no' => $seq_no));

            $row = $stm->fetch(PDO::FETCH_ASSOC);
            $sequence_number = $row['SequnceNumber'];

            //Insets data new session into the session table
            $query3 = "INSERT INTO `session` (`UserMasterPublicID`, `SerialID`,`TokenID`,`TokenCreatedTime`,`UpdatedBy`) VALUES (:usermaster_public_id,:serial_id,:token_id,:tocken_created_time,:updated_by)";
            $stm = $conn->prepare($query3);
            $stm->execute(array(':usermaster_public_id' => $user_master_public_id, ':serial_id' => $sequence_number, ':token_id' => $tocken, ':tocken_created_time' => $token_time_genarated, ':updated_by' => $user_name));

//                
            $conn->commit();
            $conn = Null;
            return TRUE;
        } catch (Exception $exc) {
            $conn->rollBack();
            echo $exc->getMessage();
            return FALSE;
        }
    }

    public static function redirect_user($User) {
        //This function is used to redirect useres based on their user type
        $user_type_id = $User['UserTypeID'];
        
        if ($user_type_id == 1) {
 Login::set_sessions($User['UserName'], $User['PublicID'],$User['Name'],$User['ShortHand'],$user_type_id,$User['TenantID'],$User['SchoolPublicID'],$User['LogoPicURL'],$User['ProfilPicURL']);
             header('location:/threeedu/view/admin/');  
        } else if ($user_type_id == 2) {
            Login::set_sessions($User['UserName'], $User['PublicID'],$User['Name'],$User['ShortHand'],$user_type_id,$User['TenantID'],$User['SchoolPublicID'],$User['LogoPicURL'],$User['ProfilPicURL']);
             header('location:/threeedu/view/student/'); 
        } 
        else if ($user_type_id == 4) {
            Login::set_sessions($User['UserName'], $User['PublicID'],$User['Name'],$User['ShortHand'],$user_type_id,$User['TenantID'],$User['SchoolPublicID'],$User['LogoPicURL'],$User['ProfilPicURL']);
              header('location:/threeedu/view/admin/');  
        }
         else if ($user_type_id == 5) {
            Login::set_sessions($User['UserName'], $User['PublicID'],$User['Name'],$User['ShortHand'],$user_type_id,$User['TenantID'],$User['SchoolPublicID'],$User['LogoPicURL'],$User['ProfilPicURL']);
              header('location:/threeedu/view/accounts/');  
        }
        
        else if ($user_type_id == 3) {
            
           if ( $User['PositionID'] == 1){
               
               
               
   Login::set_sessions($User['UserName'], $User['PublicID'],$User['Name'],$User['ShortHand'],$user_type_id,$User['TenantID'],$User['SchoolPublicID'],$User['LogoPicURL'],$User['ProfilPicURL']);
             header('location:/threeedu/view/teacher/');  
           }
           else if ($User['PositionID'] == 3)
               {
  Login::set_sessions($User['UserName'], $User['PublicID'],$User['Name'],$User['ShortHand'],$user_type_id,$User['TenantID'],$User['SchoolPublicID'],$User['LogoPicURL'],$User['ProfilPicURL']);
             header('location:/threeedu/view/headteacher/');   
               }
           else {
               
               Login::set_sessions($User['UserName'], $User['PublicID'],$User['Name'],$User['ShortHand'],$user_type_id,$User['TenantID'],$User['SchoolPublicID'],$User['LogoPicURL'],$User['ProfilPicURL']);
             header('location:/threeedu/view/teacher/');   
           }
              
        }
        else {
//            Login::set_sessions($User['UserName'], $User['PublicID'],$User['Name'],$User['ShortHand']);
             header('location:/threeedu');
        }
    }

    public static function set_sessions($username, $public_id,$user_names,$department,$user_id,$tenant_id,$school_id,$logo_pic_url,$profile_pic_url) {
        // This functionis used to set the username and public id session 
        // so as to use it the the system 
        $_SESSION['threeedu_username'] = $username;
        $_SESSION['threeedu_public_id'] = $public_id;
        $_SESSION['threeedu_user_id'] = $user_id;
        $_SESSION['threeedu_names'] = $user_names;
        $_SESSION['threeedu_department_code'] = $department;
         $_SESSION['threeedu_tenantid'] = $tenant_id;
          $_SESSION['threeedu_schoolid'] = $school_id;
           $_SESSION['threeedu_logo_pic_url'] = $logo_pic_url;
            $_SESSION['threeedu_profile_pic'] = $profile_pic_url;
        
    }

    
    public static function encription_data($string, $action = 'e'){
        
       
    // you may change these values to your own
    $secret_key = '8534afe86d07040b05f6b10c158ae6c202c543715499086ff137abe0cb620ff88f3efa8fa8f203cc38bbb051ac0787da9124ff396316775d4d5922c2a46b06f9';
    $secret_iv = 'affd6d71c3b0aeb053fe2c7ca9088aa3b0e0aedcb75e9118307a13b3845c618adee1fffe1f5163e08596fa4a4c2b83ac1c76b4fff2ef2aefee4cbe74d685a198';

    $output = false;
    $encrypt_method = "AES-256-CBC";
    $key = hash( 'sha256', $secret_key );
    $iv = substr( hash( 'sha256', $secret_iv ), 0, 16 );

    if( $action == 'e' ) {
        $output = base64_encode( openssl_encrypt( $string, $encrypt_method, $key, 0, $iv ) );
    }
    else if( $action == 'd' ){
        $output = openssl_decrypt( base64_decode( $string ), $encrypt_method, $key, 0, $iv );
    }

    return $output;


    }
    
    public static function create_cookie($UserData,$entered_password) {
        //This function is used to create a cookies that will be uses for the remmebr me component             
        try {
            $Connection = new Connection();
            $conn = $Connection->connect();
            $user_public_id = $UserData['PublicID'];
            $query = " CALL GetSessionDetailsByUserMasterPublicID(:user_public_id)";
            $stm = $conn->prepare($query);
            $stm->execute(array(':user_public_id' => $user_public_id));

            $row = $stm->fetch(PDO::FETCH_ASSOC);
            
            
            

            $token_id = $row['TokenID'];
            $token_created_time = $row['TokenCreatedTime'];
            $username = $UserData['UserName'];
            $password_hush = $UserData['Password'];
            
            
            $encripted_password = Login::encription_data($entered_password, 'e');
             $encripted_username = Login::encription_data($username, 'e');
             $encripted_user_public_id = Login::encription_data($user_public_id, 'e');

            //The below code sets the following cookeis 
            setcookie('token_id', $token_id, time() + (86400) * 14, "/");
            setcookie('token_created_time', $token_created_time, time() + (86400) * 14, "/");
            setcookie('username', $encripted_username, time() + (86400) * 14, "/");
            setcookie('password', $encripted_password, time() + (86400) * 14, "/");
            setcookie('user_public_id', $encripted_user_public_id, time() + (86400) * 14, "/");

            //The code below calls the redirect function to direct the user to the apropriate 
            // pasge based on the user type ID 
            Login::redirect_user($UserData);
            return TRUE;
        } catch (Exception $exc) {
            echo 'Error:cooki set 3003 Pleas Contact Admin and check your internet conectionn';
            return FALSE;
        }
    }

    function check_login_state() {

        if (isset($_COOKIE['token_id']) && isset($_COOKIE['token_created_time']) && isset($_COOKIE['username'])) {
            
            
            $user_name = $_COOKIE['username'];             
            $token_created_time = $_COOKIE['token_created_time'];
            $token_id = $_COOKIE['token_id'];
            //$password_hush = $_COOKIE['password_hush'];
            $user_public_id = $_COOKIE['user_public_id'];
            $token_expiration_time = 1209600;
            $Connection = new Connection();
            $conn = $Connection->connect();
            
            
            $dencripted_username = Login::encription_data($user_name, 'd');
             
             $dencripted_user_public_id = Login::encription_data($user_public_id, 'd');
            
            
        
            $query = " CALL GetSessionDetailsByUserMasterPublicID(:user_public_id)";
            $stm = $conn->prepare($query);
            $stm->execute(array(':user_public_id' => $dencripted_user_public_id));

            
            if ($stm->rowCount() > 0){
                
                    $row = $stm->fetch(PDO::FETCH_ASSOC); 
                    
                     if (
                        $row['TokenID'] == $token_id &&
                        $row['Username'] == $dencripted_username &&
                        $row['TokenCreatedTime'] == $token_created_time &&                          
                        $row['UserMasterPublicID'] == $dencripted_user_public_id 
                             
                ) 
                         {
                         
                       //check if the token is valid 
                         $is_token_not_valid =  ($_SERVER["REQUEST_TIME"] - $token_created_time) > $token_expiration_time;
                         
                         if(!$is_token_not_valid){
                             
                             return TRUE;
                             
                         }else
                         {
                             
                             return FALSE;
                         }
                         
                }else{
                    return FALSE;
                }
                
            } else {
                return FALSE;    
            }
            
       
          
        }
    }

}
