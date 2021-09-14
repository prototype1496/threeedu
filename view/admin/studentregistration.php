<?php 
require '../../controller/super/SessionStart.php'; 
include '../../model/SuperModel.php';
include '../../db_connection/dbconfig.php';
$tenant_id = $_SESSION['threeedu_tenantid'];
//$get_department_stm = SuperModel:: get_teacher_departments();
//$get_position_stm = SuperModel:: get_teacher_positions();
$get_subjets_stm  = SuperModel:: get_all_subjectts();
$get_subjets_stm2 = SuperModel:: get_all_subjectts();
$get_subjets_stm3 = SuperModel:: get_all_subjectts();
$get_subjets_stm4 = SuperModel:: get_all_subjectts();
$get_subjets_stm5 = SuperModel:: get_all_subjectts();
$get_subjets_stm6 = SuperModel:: get_all_subjectts();
$get_subjets_stm7 = SuperModel:: get_all_subjectts();
$get_subjets_stm8 = SuperModel:: get_all_subjectts();

$grade = SuperModel:: get_active_grades_by_tenant_id($tenant_id);
?>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from colorlib.com//polygon/adminty/default/dashboard-crm.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:45:47 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
<title>Teacher Dashboared </title>


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
<!--nva bar start  -->
<?php require'./navbar.php';  ?>
<!--nva bar end  -->


<div class="pcoded-main-container">
<div class="pcoded-wrapper">


<!--side bar start  -->
 <?php
                        if ($_SESSION['threeedu_user_id'] == 1)
                            {
                             require './sidbar.php';
                            } 
                        else if ($_SESSION['threeedu_user_id'] == 4) 
                        {
                            require './itadminsidbar.php';
                        }
                        ?>
<!--side bar end  -->




<div class="pcoded-content">
<div class="pcoded-inner-content">
<div class="main-body">
<div class="page-wrapper">
<div class="page-body">
    
    
<div class="row">
    <div class="col-sm-12">
    <div class="card">
        <div class="card-header  text-white" style="background-color: #FE9365; margin-bottom: 20px;">
             
        
      <div class="row align-items-end ">
                                            <div class="col-lg-8">
                                                <div class="">
                                                    <div class="">
                                                        
                                                     Student Registration
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="page-header-breadcrumb">
                                                    <ul class="breadcrumb-title">
                                                      
                                                       
                                                        <li class="breadcrumb-item">
                                                         / Students / Registration Model
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
          
                                        </div>
           
           
       
    </div>
        <div class="card-block">
            <form enctype="multipart/form-data" method="POST" action="../../controller/admin/ActionPerformed.php" >
                
                <div class="form-group row">
                      <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">First Name</label>
                          <input required="" name="first_name" type="text" class="form-control">
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">Last Name</label>
                          <input required="" name="last_name" type="text" class="form-control">
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">Other Name</label>
                          <input name="other_name" type="text" class="form-control">
                        </div>
                      </div>
                    </div>
                
                
                
                  <div class="form-group row">
                      <div class="col-md-4">
                        <div class="form-group">
                          <div class="form-select-list">
                               <label class="bmd-label-floating">Gender</label>
                                        <select required="" class="form-control custom-select-value" name="gender_id">
                                            <option value="" disabled="disabled" selected="selected">Select Gender</option>
                                                <option value="1">Male</option>
                                                <option value="2">Female</option>
                                                
                                       </select>
                                    </div>
                        </div>
                          
                          
                      </div>
                      
                      <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">Date Of Birth</label>
                          <input required="" type="date"  name="dob" class="form-control" />
                        </div>
                      </div>
                      
                      
                        <div class="col-md-4">
                        <div class="form-group">
                           <label class="bmd-label-floating">Marital Status</label>
                          <div class="form-select-list">
                                        <select  required="" class="form-control custom-select-value" name="marital_status_id">
                                            <option value="" disabled="disabled" selected="selected">Select Marital Status</option>
                                            <option value="1">Married</option>
                                                <option value="2">Widow</option>
                                                <option value="3">Divorced</option>
                                                <option value="4">Single</option>
                                       </select>
                                    </div>
                        </div>
                      </div>
                     
                      
                      
                    </div>
                

                
                
                <div class="form-group row">
                    <div class="col-md-4">
                          <div class="form-group">
                         <label class="bmd-label-floating">Profile Pic</label>
                              <input type="file" accept="image/png,image/jpeg" name="profile_pic" class="form-control" />
                        </div>
                      </div>
                       
                 <div class="col-md-4">
                        <div class="form-group">
                           <label class="bmd-label-floating">Grade</label>
                          <div class="form-select-list">
                              <select id="grade_id" onclick="get_class()"  required="" class="form-control custom-select-value" name="grade_id">
                                            <option value="" disabled="disabled" selected="selected">Select Grade</option>
                                                                                                
                            <?php
                              while ($row = $grade->fetch(PDO::FETCH_ASSOC)) {
                                  ?>
                                  <option value="<?php echo $row['GradeMasterID']; ?>"><?php echo $row['Grade']; ?></option>

                              <?php } ?>
                                                    
                                                
                                               
                                       </select>
                                    </div>
                        </div>
                      </div>
                    
                    
                    <div class="col-md-4" id="class_name"></div>
                    
                     
                    
                </div>
                
               
                
                
               
                
         
            
        </div>
        
    </div>
    
    </div>
    

    
 
    
    


</div>
    
    
    
    <div class="row">
    <div class="col-sm-12">
    <div class="card">
        
        <div class="card-block">
         
                
                <div class="form-group row">
                    
                      
                    
                       <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">Guardian Name (M)</label>
                          <input name="male_gardian_name" type="text" class="form-control"><br>
                        </div>
                      </div>
                          
                       <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">Guardian Name (F)</label>
                          <input name="female_gardian_name" type="text" class="form-control"><br>
                        </div>
                      </div>
                    
                    
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">Guardian Number</label>
                          <input required="" name="gardian_contact_no" type="text" class="form-control"><br>
                        </div>
                      </div>
                    
                    <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">Email</label>
                          <input name="email_address" type="email" class="form-control"><br>
                        </div>
                      </div>
                    
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Address</label>
                          <textarea required="" type="date"  name="address" class="form-control"  rows="3" ></textarea>
                        </div>
                      </div>
                    
                    </div>
                
                
                
              
            <button type="submit" name="btn_reg_pupil" class="btn btn-warning btn-round">Submit</button>
              
               
            </form>
            
        </div>
        
    </div>
    
    </div>
    

    
 
    
    


</div>
</div>
</div>

</div>
</div>
</div>
</div>
</div>
</div>
</div>


<!--[if lt IE 10]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="../../files/assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="../../files/assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="../../files/assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="../../files/assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="../../files/assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->

<script src="../../js/ReloadClass.js" type="text/javascript"></script>
<script src="../../js/ReloadSubject.js" type="text/javascript"></script>
<script src="../../js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="../../lib/Toast/alerts.js" type="text/javascript"></script>
<script src="../../lib/Toast/jquery.toast.min.js" type="text/javascript"></script>


<script type="960c3b30522fb895a4c59633-text/javascript" src="../../files/bower_components/jquery/js/jquery.min.js"></script>
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
<script type="960c3b30522fb895a4c59633-text/javascript">
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>

<script>
function validate_subject_1_selection(){
            var subject_code_1 = document.getElementById("subject_code_1").value;
            var subject_code_2 = document.getElementById("subject_code_2").value;
            var subject_code_3 = document.getElementById("subject_code_3").value;
            var subject_code_4 = document.getElementById("subject_code_4").value;
            var subject_code_5 = document.getElementById("subject_code_5").value;
            var subject_code_6 = document.getElementById("subject_code_6").value;
            var subject_code_7 = document.getElementById("subject_code_7").value;
            var subject_code_8 = document.getElementById("subject_code_8").value;
              
       
        
            
//            if ((subject_code_1==null || subject_code_1==""))
//			{
//			subject_code_1 = -1;
//			}
                        
            if ((subject_code_2==null || subject_code_2==""))
			{
			subject_code_2 = -1;
			}
                        
            if ((subject_code_3==null || subject_code_3==""))
			{
			subject_code_3 = -1;
			}
                        
            if ((subject_code_4==null || subject_code_4==""))
			{
			subject_code_4 = -1;
			}
                        
                        
                        
             if ((subject_code_5==null || subject_code_5==""))
			{
			subject_code_5 = -1;
			}
                        
                        
                        
              if ((subject_code_6==null || subject_code_6==""))
			{
			subject_code_6 = -1;
			}
             
              if ((subject_code_7==null || subject_code_7==""))
			{
			subject_code_7 = -1;
			}
                        
                if ((subject_code_8==null || subject_code_8==""))
			{
			subject_code_8 = -1;
			}
                     
      
            var i = 0;
            var items = [subject_code_2,subject_code_3,subject_code_4,subject_code_5,subject_code_6,subject_code_7,subject_code_8];
            
            for (i;i<8;i++){
                if(subject_code_1 == items[i]){
                    var subject_code_1 = document.getElementById("subject_code_1").value="";
                           showInfoToast('You can not select same subject twice');
                    }
                }
            
        }
        
        
        
         function validate_subject_2_selection(){
            var subject_code_1 = document.getElementById("subject_code_1").value;
            var subject_code_2 = document.getElementById("subject_code_2").value;
            var subject_code_3 = document.getElementById("subject_code_3").value;
            var subject_code_4 = document.getElementById("subject_code_4").value;
            var subject_code_5 = document.getElementById("subject_code_5").value;
            var subject_code_6 = document.getElementById("subject_code_6").value;
            var subject_code_7 = document.getElementById("subject_code_7").value;
            var subject_code_8 = document.getElementById("subject_code_8").value;
              
       
        
            
//            if ((subject_code_1==null || subject_code_1==""))
//			{
//			subject_code_1 = -1;
//			}
                        
            if ((subject_code_1==null || subject_code_1==""))
			{
			subject_code_1 = -1;
			}
                        
            if ((subject_code_3==null || subject_code_3==""))
			{
			subject_code_3 = -1;
			}
                        
            if ((subject_code_4==null || subject_code_4==""))
			{
			subject_code_4 = -1;
			}
                        
                        
                        
             if ((subject_code_5==null || subject_code_5==""))
			{
			subject_code_5 = -1;
			}
                        
                        
                        
              if ((subject_code_6==null || subject_code_6==""))
			{
			subject_code_6 = -1;
			}
             
              if ((subject_code_7==null || subject_code_7==""))
			{
			subject_code_7 = -1;
			}
                        
                if ((subject_code_8==null || subject_code_8==""))
			{
			subject_code_8 = -1;
			}
                     
      
            var i = 0;
            var items = [subject_code_1,subject_code_3,subject_code_4,subject_code_5,subject_code_6,subject_code_7,subject_code_8];
            
            for (i;i<8;i++){
                if(subject_code_2 == items[i]){
                    var subject_code_2 = document.getElementById("subject_code_2").value="";
                    
                    showInfoToast('You can not select same subject twice');
                        
                    }
                }
            
        }
        
        
        
        
        
        
        
        
         function validate_subject_3_selection(){
            var subject_code_1 = document.getElementById("subject_code_1").value;
            var subject_code_2 = document.getElementById("subject_code_2").value;
            var subject_code_3 = document.getElementById("subject_code_3").value;
            var subject_code_4 = document.getElementById("subject_code_4").value;
            var subject_code_5 = document.getElementById("subject_code_5").value;
            var subject_code_6 = document.getElementById("subject_code_6").value;
            var subject_code_7 = document.getElementById("subject_code_7").value;
            var subject_code_8 = document.getElementById("subject_code_8").value;
              
       
        
            
//            if ((subject_code_1==null || subject_code_1==""))
//			{
//			subject_code_1 = -1;
//			}
                        
            if ((subject_code_1==null || subject_code_1==""))
			{
			subject_code_1 = -1;
			}
                        
            if ((subject_code_2==null || subject_code_2==""))
			{
			subject_code_2 = -1;
			}
                        
            if ((subject_code_4==null || subject_code_4==""))
			{
			subject_code_4 = -1;
			}
                        
                        
                        
             if ((subject_code_5==null || subject_code_5==""))
			{
			subject_code_5 = -1;
			}
                        
                        
                        
              if ((subject_code_6==null || subject_code_6==""))
			{
			subject_code_6 = -1;
			}
             
              if ((subject_code_7==null || subject_code_7==""))
			{
			subject_code_7 = -1;
			}
                        
                if ((subject_code_8==null || subject_code_8==""))
			{
			subject_code_8 = -1;
			}
                     
      
            var i = 0;
            var items = [subject_code_1,subject_code_2,subject_code_4,subject_code_5,subject_code_6,subject_code_7,subject_code_8];
            
            for (i;i<8;i++){
                if(subject_code_3 == items[i]){
                    var subject_code_3 = document.getElementById("subject_code_3").value="";
                       showInfoToast('You can not select same subject twice');
                    }
                }
            
        }
        
        
        
          function validate_subject_4_selection(){
            var subject_code_1 = document.getElementById("subject_code_1").value;
            var subject_code_2 = document.getElementById("subject_code_2").value;
            var subject_code_3 = document.getElementById("subject_code_3").value;
            var subject_code_4 = document.getElementById("subject_code_4").value;
            var subject_code_5 = document.getElementById("subject_code_5").value;
            var subject_code_6 = document.getElementById("subject_code_6").value;
            var subject_code_7 = document.getElementById("subject_code_7").value;
            var subject_code_8 = document.getElementById("subject_code_8").value;
              
       
        
            
//            if ((subject_code_1==null || subject_code_1==""))
//			{
//			subject_code_1 = -1;
//			}
                        
            if ((subject_code_1==null || subject_code_1==""))
			{
			subject_code_1 = -1;
			}
                        
            if ((subject_code_2==null || subject_code_2==""))
			{
			subject_code_2 = -1;
			}
                        
            if ((subject_code_3==null || subject_code_3==""))
			{
			subject_code_3 = -1;
			}
                        
                        
                        
             if ((subject_code_5==null || subject_code_5==""))
			{
			subject_code_5 = -1;
			}
                        
                        
                        
              if ((subject_code_6==null || subject_code_6==""))
			{
			subject_code_6 = -1;
			}
             
              if ((subject_code_7==null || subject_code_7==""))
			{
			subject_code_7 = -1;
			}
                        
                if ((subject_code_8==null || subject_code_8==""))
			{
			subject_code_8 = -1;
			}
                     
      
            var i = 0;
            var items = [subject_code_1,subject_code_2,subject_code_3,subject_code_5,subject_code_6,subject_code_7,subject_code_8];
            
            for (i;i<8;i++){
                if(subject_code_4 == items[i]){
                    var subject_code_4 = document.getElementById("subject_code_4").value="";
                        showInfoToast('You can not select same subject twice');
                    }
                }
            
        }
        
        
        
        
          function validate_subject_5_selection(){
            var subject_code_1 = document.getElementById("subject_code_1").value;
            var subject_code_2 = document.getElementById("subject_code_2").value;
            var subject_code_3 = document.getElementById("subject_code_3").value;
            var subject_code_4 = document.getElementById("subject_code_4").value;
            var subject_code_5 = document.getElementById("subject_code_5").value;
            var subject_code_6 = document.getElementById("subject_code_6").value;
            var subject_code_7 = document.getElementById("subject_code_7").value;
            var subject_code_8 = document.getElementById("subject_code_8").value;
              
       
        
            
//            if ((subject_code_1==null || subject_code_1==""))
//			{
//			subject_code_1 = -1;
//			}
                        
            if ((subject_code_1==null || subject_code_1==""))
			{
			subject_code_1 = -1;
			}
                        
            if ((subject_code_2==null || subject_code_2==""))
			{
			subject_code_2 = -1;
			}
                        
            if ((subject_code_3==null || subject_code_3==""))
			{
			subject_code_3 = -1;
			}
                        
                        
                        
             if ((subject_code_4==null || subject_code_4==""))
			{
			subject_code_4 = -1;
			}
                        
                        
                        
              if ((subject_code_6==null || subject_code_6==""))
			{
			subject_code_6 = -1;
			}
             
              if ((subject_code_7==null || subject_code_7==""))
			{
			subject_code_7 = -1;
			}
                        
                if ((subject_code_8==null || subject_code_8==""))
			{
			subject_code_8 = -1;
			}
                     
      
            var i = 0;
            var items = [subject_code_1,subject_code_2,subject_code_3,subject_code_4,subject_code_6,subject_code_7,subject_code_8];
            
            for (i;i<8;i++){
                if(subject_code_5 == items[i]){
                    var subject_code_5 = document.getElementById("subject_code_5").value="";
                          showInfoToast('You can not select same subject twice');
                    }
                }
            
        }
        
        
        
        
        
          function validate_subject_6_selection(){
            var subject_code_1 = document.getElementById("subject_code_1").value;
            var subject_code_2 = document.getElementById("subject_code_2").value;
            var subject_code_3 = document.getElementById("subject_code_3").value;
            var subject_code_4 = document.getElementById("subject_code_4").value;
            var subject_code_5 = document.getElementById("subject_code_5").value;
            var subject_code_6 = document.getElementById("subject_code_6").value;
            var subject_code_7 = document.getElementById("subject_code_7").value;
            var subject_code_8 = document.getElementById("subject_code_8").value;
              
       
        
            
//            if ((subject_code_1==null || subject_code_1==""))
//			{
//			subject_code_1 = -1;
//			}
                        
            if ((subject_code_1==null || subject_code_1==""))
			{
			subject_code_1 = -1;
			}
                        
            if ((subject_code_2==null || subject_code_2==""))
			{
			subject_code_2 = -1;
			}
                        
            if ((subject_code_3==null || subject_code_3==""))
			{
			subject_code_3 = -1;
			}
                        
                        
                        
             if ((subject_code_4==null || subject_code_4==""))
			{
			subject_code_4 = -1;
			}
                        
                        
                        
              if ((subject_code_5==null || subject_code_5==""))
			{
			subject_code_5 = -1;
			}
             
              if ((subject_code_7==null || subject_code_7==""))
			{
			subject_code_7 = -1;
			}
                        
                if ((subject_code_8==null || subject_code_8==""))
			{
			subject_code_8 = -1;
			}
                     
      
            var i = 0;
            var items = [subject_code_1,subject_code_2,subject_code_3,subject_code_4,subject_code_5,subject_code_7,subject_code_8];
            
            for (i;i<8;i++){
                if(subject_code_6 == items[i]){
                    var subject_code_6 = document.getElementById("subject_code_6").value="";
                           showInfoToast('You can not select same subject twice');
                    }
                }
            
        }
        
        
        
        
        function validate_subject_7_selection(){
            var subject_code_1 = document.getElementById("subject_code_1").value;
            var subject_code_2 = document.getElementById("subject_code_2").value;
            var subject_code_3 = document.getElementById("subject_code_3").value;
            var subject_code_4 = document.getElementById("subject_code_4").value;
            var subject_code_5 = document.getElementById("subject_code_5").value;
            var subject_code_6 = document.getElementById("subject_code_6").value;
            var subject_code_7 = document.getElementById("subject_code_7").value;
            var subject_code_8 = document.getElementById("subject_code_8").value;
              
       
        
            
//            if ((subject_code_1==null || subject_code_1==""))
//			{
//			subject_code_1 = -1;
//			}
                        
            if ((subject_code_1==null || subject_code_1==""))
			{
			subject_code_1 = -1;
			}
                        
            if ((subject_code_2==null || subject_code_2==""))
			{
			subject_code_2 = -1;
			}
                        
            if ((subject_code_3==null || subject_code_3==""))
			{
			subject_code_3 = -1;
			}
                        
                        
                        
             if ((subject_code_4==null || subject_code_4==""))
			{
			subject_code_4 = -1;
			}
                        
                        
                        
              if ((subject_code_5==null || subject_code_5==""))
			{
			subject_code_5 = -1;
			}
             
              if ((subject_code_6==null || subject_code_6==""))
			{
			subject_code_6 = -1;
			}
                        
                if ((subject_code_8==null || subject_code_8==""))
			{
			subject_code_8 = -1;
			}
                     
      
            var i = 0;
            var items = [subject_code_1,subject_code_2,subject_code_3,subject_code_4,subject_code_5,subject_code_6,subject_code_8];
            
            for (i;i<8;i++){
                if(subject_code_7 == items[i]){
                    var subject_code_7 = document.getElementById("subject_code_7").value="";
                          showInfoToast('You can not select same subject twice');
                    }
                }
            
        }
        
        
        
        
         function validate_subject_8_selection(){
            var subject_code_1 = document.getElementById("subject_code_1").value;
            var subject_code_2 = document.getElementById("subject_code_2").value;
            var subject_code_3 = document.getElementById("subject_code_3").value;
            var subject_code_4 = document.getElementById("subject_code_4").value;
            var subject_code_5 = document.getElementById("subject_code_5").value;
            var subject_code_6 = document.getElementById("subject_code_6").value;
            var subject_code_7 = document.getElementById("subject_code_7").value;
            var subject_code_8 = document.getElementById("subject_code_8").value;
              
       
        
            
//            if ((subject_code_1==null || subject_code_1==""))
//			{
//			subject_code_1 = -1;
//			}
                        
            if ((subject_code_1==null || subject_code_1==""))
			{
			subject_code_1 = -1;
			}
                        
            if ((subject_code_2==null || subject_code_2==""))
			{
			subject_code_2 = -1;
			}
                        
            if ((subject_code_3==null || subject_code_3==""))
			{
			subject_code_3 = -1;
			}
                        
                        
                        
             if ((subject_code_4==null || subject_code_4==""))
			{
			subject_code_4 = -1;
			}
                        
                        
                        
              if ((subject_code_5==null || subject_code_5==""))
			{
			subject_code_5 = -1;
			}
             
              if ((subject_code_6==null || subject_code_6==""))
			{
			subject_code_6 = -1;
			}
                        
                if ((subject_code_7==null || subject_code_7==""))
			{
			subject_code_8 = -1;
			}
                     
      
            var i = 0;
            var items = [subject_code_1,subject_code_2,subject_code_3,subject_code_4,subject_code_5,subject_code_6,subject_code_7];
            
            for (i;i<8;i++){
                if(subject_code_8 == items[i]){
                    var subject_code_8 = document.getElementById("subject_code_8").value="";
                          showInfoToast('You can not select same subject twice');
                    }
                }
            
        }
        
       
</script>


<script src="../../files/rocket-loader.min.js" data-cf-settings="960c3b30522fb895a4c59633-|49" defer=""></script></body>

<!-- Mirrored from colorlib.com//polygon/adminty/default/dashboard-crm.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:45:54 GMT -->
</html>
