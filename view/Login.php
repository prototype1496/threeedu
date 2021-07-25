<?php
require_once './controller/super/Login.php';
?>
<html lang="en">
   
    <head>
       
        <title>Login Page</title>
        
        
        
        <link rel="stylesheet" href="lib/cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="lib/use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,900" rel="stylesheet">
        <link rel="stylesheet" href="css/styles.css">
       
        <link rel="apple-touch-icon" sizes="180x180" href="img/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="img/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="img/favicons/favicon-16x16.png">
        <link rel="manifest" href="img/favicons/site.webmanifest">
        <link rel="mask-icon" href="img/favicons/safari-pinned-tab.svg" color="#1cb2d3">
        <link rel="shortcut icon" href="img/favicons/favicon.ico">
        
       
        
        
        
    </head>
    <body>
        <header class="sign-up log-in"> 
            <div class="bg"> 
                <img class="wave-purple" src="img/background/Education-in-Sierra-Leoen.jpg" alt=""> 
            </div

            <div class="sign-up-content"> 
                <div class="container"> 
                    <div class="row"> 
                        <div class="form-trial col-lg-5 col-md-5 col-sm-8 col-xs-12"> 
                           
                            <form method="POST" action="#"> 
                                <h3>Welcome To 3Eedu</h3> 
                                <div class="name"> 
                                    <input id="user_name" required=""  type="text" name="username" placeholder="Username">
                                </div>
                                <div class="password"> 
                                    <input id="password-field" required="" type="password" name="password" placeholder="Password"> 
                                    <span data-toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span> 
                                </div>
                                <div class="submit">
                                    <button class="form-submit" type="submit" name="submit" >Log in</button> 
                                </div>

                                <div class="log-in-option clearfix"> 
                                    <div class="log-in-checkbox"> 
                                        <input id="checkbox" class="checkbox" value="remember-me" type="checkbox"  name="chk_rmember_me"> 
                                        <label for="checkbox">Remember Me</label> </div><div class="forgot-password"> 
                                        <a href="#">Forgot password?</a> </div></div><div class="sign-social"> 

                                </div>
                            </form> 
                        </div>
                    </div>
                </div>
            </div>
        </header>
        
        <script src="lib/cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="lib/cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/script.js"></script>
   
    </body>
  
</html>
   
