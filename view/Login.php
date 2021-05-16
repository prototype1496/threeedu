<!DOCTYPE html>
<html class="body-full-height">
	
<head>
	<title>Login</title>
        
		<meta charset="utf-8">
               

		<meta name="viewport" content="width=device-width, initial-scale=1">
                <link rel="shortcut icon" href="./img/favicon.ico">
<!--                <link href="./css/style_home.css" rel="stylesheet" type="text/css"/>-->
                 <link rel="stylesheet" type="text/css" id="theme" href="./css/vims-theme.css"/>
        <link rel="stylesheet" type="text/css"  href="./css/full_html.css"/>
        <link rel="stylesheet" type="text/css"  href="./css/custom_buttons.css"/>
		<!--webfonts-->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:600italic,400,300,600,700' rel='stylesheet' type='text/css'>
		<!--//webfonts-->
                
               
</head>

<body>
	<div class="login-container">

            <div class="login-box animated fadeInDown">
                <div class="login-logo"></div>
                <div class="login-body">
                    <div class="login-title"><strong>Welcome</strong>, Please Login</div>
                    <form method="POST" action="./controller/super/Login.php">
                        <div class="form-group">
                            <div class="col-md-12">
                                <input type="text" class="form-control" placeholder="Username" name="username"/> <br>
                            </div>
                        </div>
                       
                          <div class="form-group">
                            <div class="col-md-12">
                                <input type="password" class="form-control" placeholder="Password" name="password"/> <br> <br>
                            </div>
                        </div>
                       
                              

                        <div class="form-group">
                            
                            
                            <div class="col-md-4">
                               
                                <button type="submit" name="submit" class="btn btn-facebook btn-block">Log In</button>
                               
                            </div>
                            
                             <div class="pull-right">
                               
                                
                                 <a href="#" style="padding: 10px;color: #000;"><b>Forgot Password ?</b></a>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="login-footer">
				
				
					
                    <div class="pull-left">
                        <b> &copy; <script>document.write(new Date().getFullYear())</script> S.C.A.S </b>
                    </div>
					
                    <div class="pull-right">
                        
                        <b><a href="#">Privacy</a> |
                            <a href="#">Contact Us</a> </b>
                    </div>
                </div>
            </div>

        </div>
				 <!-----start-main---->
<!--				<div class="login-form">
					
				 <form method="POST" action="./controller/super/Login.php">
					<li>
                                            <input type="text" class="text" name="username" id ="user_name"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'USERNAME';}" ><a href="#" class=" icon user"></a>
					</li>
					<li>
						<input type="password"  id = "password" name="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}"><a href="#" class=" icon lock"></a>
					</li>
					
                                         <div style="color:#fff;">
					
					<label class="checkbox"><input type="checkbox"  name="chk_rmember_me" ><i></i>Remember Me</label>
								
							
					</div>
                                        <center> <input  type="submit"  value="SIGN IN"></center><br><br><br>
					
					<div style="color:#fff;">
					
                                            <label  style="float:right;"><a href="#">Forgot Password ?</a></i></label>
							
					</div>
                                       
				</form>
				
				
			</div>
			
				
		  ---start-copyright--
   					<div class="copy-right">
						<center><p>Powered by: F.P.R @Copyright <script>document.write(new Date().getFullYear())</script></p> </center>
					</div>-->
				<!-----//end-copyright---->
		 		
</body>
</html>