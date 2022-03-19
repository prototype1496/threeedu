<?php 
require '../../controller/super/SessionStart.php'; 
include '../../model/SuperModel.php';
include '../../Config/Config.php';
include '../../db_connection/dbconfig.php';

$tenant_id = $_SESSION['threeedu_tenantid'];
$school_id = $_SESSION['threeedu_schoolid'];

$stm_position_data = SuperModel::get_teacher_positions();
$stm_depatment_data = SuperModel::get_departments_school_id($school_id);
$stm_maritalstatus_data = SuperModel::get_marital_status();
$stm_province_data = SuperModel::get_provinces();
 

?>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from colorlib.com//polygon/adminty/default/dashboard-crm.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:45:47 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
<title>Reset Password</title>


<!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="#">
<meta name="keywords" content="Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="#">

<link rel="icon" href="https://colorlib.com//polygon/adminty/files/assets/images/favicon.ico" type="image/x-icon">

<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="../../files/bower_components/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" href="../../files/assets/pages/chart/radial/css/radial.css" type="text/css" media="all">

<link rel="stylesheet" type="text/css" href="../../files/assets/icon/feather/css/feather.css">

<link rel="stylesheet" type="text/css" href="../../files/assets/css/style.css">
<link rel="stylesheet" type="text/css" href="../../files/assets/css/jquery.mCustomScrollbar.css">

<link href="../../lib/Toast/jquery.toast.min.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link href="../../lib/grid/grid.css" rel="stylesheet" type="text/css"/>
</head>

<body>

<div class="theme-loader">
<div class="ball-scale">
<div class='contain'>
<div class="ring">
<div class="frame"></div>
</div>
<div class="ring">
<div class="frame"></div>
</div>
<div class="ring">
<div class="frame"></div>
</div>
<div class="ring">
<div class="frame"></div>
</div>
<div class="ring">
<div class="frame"></div>
</div>
<div class="ring">
<div class="frame"></div>
</div>
<div class="ring">
<div class="frame"></div>
</div>
<div class="ring">
<div class="frame"></div>
</div>
<div class="ring">
<div class="frame"></div>
</div>
<div class="ring">
<div class="frame"></div>
</div>
</div>
</div>
</div>

<div id="pcoded" class="pcoded">
<div class="pcoded-overlay-box"></div>
<div class="pcoded-container navbar-wrapper">
  <div class="pcoded-container navbar-wrapper">
                <!--nva bar start  -->
                    <?php require'./navbar.php'; ?>
                <!--nva bar end  -->


                <div class="pcoded-main-container">
                    <div class="pcoded-wrapper">


                         <!--side bar start  -->
                        <?php
                        if ($_SESSION['threeedu_user_id'] == 1) {
                            require './sidbar.php';
                        } else if ($_SESSION['threeedu_user_id'] == 4) {
                            require './itadminsidbar.php';
                        }
                        ?>
                        <!--side bar end  -->








<div class="pcoded-content">
<div class="pcoded-inner-content">
<div class="main-body">
<div class="page-wrapper">
<div class="page-body">
    <form onsubmit="event.preventDefault(); validatepassword();" id="teacher_details"   method="POST" action="../../controller/super/ActionPerformed.php" >

        
        
         <div class="row">
   
    <div class="col-sm-12">
    <div class="card">
        <div class="card-header  text-white" style="background-color: #FE9365; margin-bottom: 20px;">
             
        
      <div class="row align-items-end ">
                                            <div class="col-lg-8">
                                                <div class="">
                                                    <div class="">
                                                        
                                                    Reset Password
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="page-header-breadcrumb">
                                                    <ul class="breadcrumb-title">
                                                      
                                                       
                                                        <li class="breadcrumb-item">
                                                         / User / Password Rest Model
                                                        </li>
                                                    </ul>
                                                </div>
                                                  
                                            </div>
         
                                        </div>
           
           
       
    </div>
        <div class="card-block">
          
                
                <div class="row">
                    
                    <input required="" value="<?php echo (isset($_GET['user_id_reset_20220091']))?  $_GET['user_id_reset_20220091']:""; ?>" name="public_id" type="hidden" class="form-control">
                        
                    
           <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">Details</label>
                          <input readonly="" value="<?php echo (isset($_GET['name']))?  $_GET['name']:"No Name"; ?>" name="name" type="text" class="form-control">
                        
                        </div>
                      </div>
                    
                      <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">Password</label>
                          <input required="" minlength="6" id="password" name="password" type="password" class="form-control">
                        </div>
                      </div>
                    
                     <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">Confirm Password</label>
                          <input required="" minlength="6" id="confirm_password" name="confirm_password" type="password" class="form-control">
                        </div>
                      </div>
            
        </div>
            
             <div class="col-sm-12">
   
                 <input name="btn_reset_password" value="btn_reset_password" type="hidden"/> <!-- this is the id to check if the registration is for a teacher-->
   <br> <button name="" type="submit" style="float: right;"   class="btn btn-warning btn-round">Submit</button>
      
 
    
    


</div>
        </div>
    </div>
    
    </div>

    
 
    
    


</div>
    
   
</form>
        
</div>
</div>
</div>
</div>
</div>
</div>


 <script src="../../lib/grid/jquery-3.5.1.min.js" type="text/javascript"></script>
<script type="960c3b30522fb895a4c59633-text/javascript" src="../../files/bower_components/jquery-ui/js/jquery-ui.min.js"></script>
<script type="960c3b30522fb895a4c59633-text/javascript" src="../../files/bower_components/popper.js/js/popper.min.js"></script>
<script type="960c3b30522fb895a4c59633-text/javascript" src="../../files/bower_components/bootstrap/js/bootstrap.min.js"></script>

<script type="960c3b30522fb895a4c59633-text/javascript" src="../../files/bower_components/jquery-slimscroll/js/jquery.slimscroll.js"></script>

<script type="960c3b30522fb895a4c59633-text/javascript" src="../../files/bower_components/modernizr/js/modernizr.js"></script>
<script type="960c3b30522fb895a4c59633-text/javascript" src="../../files/bower_components/modernizr/js/css-scrollbars.js"></script>

<script type="960c3b30522fb895a4c59633-text/javascript" src="../../files/bower_components/chart.js/js/Chart.js"></script>

<script src="../../../../../../../../developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js" type="960c3b30522fb895a4c59633-text/javascript"></script>
<script type="960c3b30522fb895a4c59633-text/javascript" src="https://maps.google.com/maps/api/js?sensor=true"></script>
<script type="960c3b30522fb895a4c59633-text/javascript" src="../../files/assets/pages/google-maps/gmaps.js"></script>



<script src="../../lib/Toast/alerts.js" type="text/javascript"></script>
<script src="../../lib/Toast/jquery.toast.min.js" type="text/javascript"></script>
<!--      script for grid-->
         <script src="../../lib/grid/grid_reacher_registration.js" type="text/javascript"></script>
         <!--          script fro grid end -->

<script src="../../files/assets/pages/widget/gauge/gauge.min.js" type="960c3b30522fb895a4c59633-text/javascript"></script>
<script src="../../files/assets/pages/widget/amchart/amcharts.js" type="960c3b30522fb895a4c59633-text/javascript"></script>
<script src="../../files/assets/pages/widget/amchart/serial.js" type="960c3b30522fb895a4c59633-text/javascript"></script>
<script src="../../files/assets/pages/widget/amchart/gauge.js" type="960c3b30522fb895a4c59633-text/javascript"></script>
<script src="../../files/assets/pages/widget/amchart/pie.js" type="960c3b30522fb895a4c59633-text/javascript"></script>
<script src="../../files/assets/pages/widget/amchart/light.js" type="960c3b30522fb895a4c59633-text/javascript"></script>

<script src="../../files/assets/js/pcoded.min.js" type="960c3b30522fb895a4c59633-text/javascript"></script>
<script src="../../files/assets/js/vartical-layout.min.js" type="960c3b30522fb895a4c59633-text/javascript"></script>
<script src="../../files/assets/js/jquery.mCustomScrollbar.concat.min.js" type="960c3b30522fb895a4c59633-text/javascript"></script>
<script type="960c3b30522fb895a4c59633-text/javascript" src="../../files/assets/pages/dashboard/crm-dashboard.min.js"></script>
<script type="960c3b30522fb895a4c59633-text/javascript" src="../../files/assets/js/script.js"></script>

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13" type="960c3b30522fb895a4c59633-text/javascript"></script>
 
<!--This is to load the province comb box -->
<script src="../../js/RelaodDistrict.js" type="text/javascript"></script>
<!--This is to load the province comb box  end -->

<!--   This is to validate username and password     -->
<script src="../../js/teacher_registration_form_validator.js" type="text/javascript"></script>
<!--  This is to validate username and password end    -->



<script src="../../files/rocket-loader.min.js" data-cf-settings="960c3b30522fb895a4c59633-|49" defer=""></script></body>

<!-- Mirrored from colorlib.com//polygon/adminty/default/dashboard-crm.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:45:54 GMT -->
</html>
