<!DOCTYPE html>
<link href="./lib/Toast/jquery.toast.min.css" rel="stylesheet" type="text/css"/>
 
<?php
$user_name = trim(filter_input(INPUT_POST, 'username', FILTER_SANITIZE_EMAIL));
$password = trim(filter_input(INPUT_POST, 'password', FILTER_DEFAULT));
$btn_submit = trim(filter_input(INPUT_POST, 'btn_login', FILTER_SANITIZE_STRING));

$is_remember_me = trim(filter_input(INPUT_POST, 'chk_rmember_me', FILTER_SANITIZE_STRING));


if (isset($user_name) && !empty($user_name) && isset($password) && !empty($password)) {

    $login_model = new Login();


    if ($user_data = $login_model->authenticate(new User($user_name, $password))) {


        $is_password_correct = $login_model->verify_password($user_data, $password);

        if ($is_password_correct) {

            //check if user is aactive or not
            $is_active = $user_data['IsActive'];

            if ($is_active == 1) {

                if ($login_model->create_session($user_data)) {


                    if (isset($is_remember_me) && $is_remember_me != Null && $is_remember_me != '') {

                        $login_model->create_cookie($user_data, $password);
                        //save cookies and sessions then redirect user
                        //echo 'Cooki set';
                    } else {
                        $login_model->redirect_user($user_data);
                        //redirect user only dont save cookie
                        //echo 'Sucess';
                    }
                } else {

                    echo 'error';
                }
            } else {

//                $isset = $user_data['EmailAddress'];
//                $user_name = $user_data['UserName'];
//                header('location:/threeedu');
            }


            //$login_model->create_session($user_data);
        } else {
            echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Wrong Username or Pasword', {
            sticky: false,
            header: 'Erro',
            theme: 'jnoty-danger',
            close: function() {window.location.replace('/threeedu/')},
            });   
            }); 
            </script>";
            //diplay worng password message
        }
    } else {
        //echo 'Wrong Username or Pasword';
        echo "<script>               
          showSuccessToast('Patint Booked Successfully');
            </script>";
        // notify user of wrong username entered  
    }
} else {
    //echo 'Wrong Username or Pasword';
    echo 'Hi';
    // pnotify wrong username or password 
}
?>

<html lang="en">
    <!-- Mirrored from yasirkareem.com/alps/log-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 29 Jul 2019 09:06:03 GMT -->
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="keywords" content="app, app landing, app landing page, agency, startup, saas, startup template, saas template, app, app template, app website, clean app landing, app landing, app landing template, business, creative, landing, marketing, product, software, software landing, Simple App Landing, webapp">
        <meta name="author" content="YasirKareem">
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
        
        
        
        
        <meta name="apple-mobile-web-app-title" content="Alps">
        <meta name="application-name" content="Alps">
        <meta name="msapplication-TileColor" content="#1cb2d3">
        <meta name="msapplication-TileImage" content="img/favicons/mstile-144x144.png">
        <meta name="msapplication-config" content="img/favicons/browserconfig.xml">
        <meta name="theme-color" content="#ffffff"><!--[if lt IE 9]> <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script> <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/response.js/0.10.0/response.min.js"></script><![endif]-->
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
                            <div class="logo"> 
                                <img class="navbar-brand" src="img/logo/logo-top.png" alt="logo"> 
                            </div>
                            <form method="POST" action="./index.php"> 
                                <h3>welcome to 3Eedu</h3> 
                                <div class="name"> 
                                    <input id="user_name" type="text" name="username" placeholder="Username">
                                </div>
                                <div class="password"> 
                                    <input id="password-field" type="password" name="password" placeholder="Password"> 
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
       <script src="./lib/Toast/alerts.js" type="text/javascript"></script>
        <script src="./lib/Toast/jquery.toast.min.js" type="text/javascript"></script>
        
        
    </body>
    <!-- Mirrored from yasirkareem.com/alps/log-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 29 Jul 2019 09:06:08 GMT -->
</html>