<!DOCTYPE html>
<?php
  
include '../../controller/super/ResetPassword.php';
?>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>CHANGE PASSWORD</title>
                <link rel="stylesheet" href="../../css/changepass/bootstrap.min.css">
<script src="../../css/changepass/jquery.min.js"></script>
<script src="../../css/changepass/bootstrap.min.js"></script>
<link href="changepasswordStyle.css" rel="stylesheet" id="">
    </head>

    <body >
        <div class="login">
  <h1>Change Password</h1>
        <form action="#" method="POST">
                       
            <div><?php 
            //this is were the erro is bing didplayided inthe array named $errors
                foreach ($errors as $key => $value) {
                    
                    echo ' <div class="alert alert-danger fade in">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        '.$value.'
    </div>';
                    
                }
            
             ?></div>
            
                        <input name="email" type="hidden" value="<?php echo  $email = $_GET['data']; ?>" /> 
                            <input name="username" type="hidden" value="<?php echo  $username = $_GET['name']; ?>" /> 

                            <input name="password" type="password" placeholder="Enter Password" />
                            <input name="rentered_password" type="password" placeholder="Re-enter Password" />
  
           
                            <input class="btn btn-primary btn-large" name="submit" type="submit" value="Login"/>



                        </form>
         </div>
    </body>

</html>
