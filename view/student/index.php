<?php 
require '../../controller/super/SessionStart.php'; 
require '../../db_connection/dbconfig.php'; 
require_once '../../model/TeacherModel.php';
require_once '../../model/SuperModel.php';

   $student_pulic_id  =  $_SESSION['threeedu_public_id'];
   $tenant_id  =  $_SESSION['threeedu_tenantid'];
   
   $attendancy_data = SuperModel::get_student_attendncy_days($student_pulic_id);

   $stm_get_atendance_history = SuperModel::get_single_studnet_attendance_report_by_id($student_pulic_id);
$get_stuednt_details = SuperModel::get_student_details_by_student_public_id($student_pulic_id);

$get_stdent_asscement = SuperModel::get_student_assecemnttype_by_public_id($student_pulic_id);

$student_data = SuperModel::get_all_transaction_history($student_pulic_id);

//print_r($student_pulic_id);

$stm = TeacherModel::get_all_student_details($tenant_id);

$classes = SuperModel::get_all_classes_with_mapped_subjects($tenant_id);
$classmaster_id = $get_stuednt_details['ClassMasterPublicID'];
 $monday  = array();
            $tuesday  = array();
            $wednsday  = array();
            $thursday  = array();
            $friday  = array();
            $saturday = array();
            $sunday= array();
            $periods = array();

            $classmaster_id  = $classmaster_id;
            $get_timtable_data = SuperModel::get_timtable($classmaster_id);
            
            $classname =  SuperModel::get_class_name($classmaster_id);
           
            while($row = $get_timtable_data->fetch(PDO::FETCH_ASSOC)){
             array_push($monday,$row['SubjectCodeM']);
             array_push($tuesday,$row['SubjectCodeT']);
             array_push($wednsday,$row['SubjectCodeW']);
             array_push($thursday,$row['SubjectCodeTH']);
             array_push($friday,$row['SubjectCodeF']);
                array_push($saturday, $row['SubjectCodeS']);
        array_push($sunday, $row['SubjectCodeSN']);
             array_push($periods,$row['PeriodName']);
          
            }
            
            
            
            
            
         
?>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from colorlib.com//polygon/adminty/default/user-profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:45:26 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
<title>Pupil Profile </title>


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

<link rel="stylesheet" type="text/css" href="../../files/bower_components/font-awesome/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="../../files/assets/pages/advance-elements/css/bootstrap-datetimepicker.css">

<link rel="stylesheet" type="text/css" href="../../files/bower_components/bootstrap-daterangepicker/css/daterangepicker.css" />

<link rel="stylesheet" type="text/css" href="../../files/bower_components/datedropper/css/datedropper.min.css" />

<link rel="stylesheet" type="text/css" href="../../files/bower_components/datatables.net-bs4/css/dataTables.bootstrap4.min.css">

<link rel="stylesheet" type="text/css" href="../../files/assets/icon/themify-icons/themify-icons.css">

<link rel="stylesheet" type="text/css" href="../../files/assets/icon/icofont/css/icofont.css">

<link rel="stylesheet" type="text/css" href="../../files/assets/icon/feather/css/feather.css">

<link rel="stylesheet" type="text/css" href="../../files/assets/css/style_student.css">
<link rel="stylesheet" type="text/css" href="../../files/assets/css/jquery.mCustomScrollbar.css">
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




<div class="">
<div class="pcoded-inner-content">

<div class="main-body">
<div class="page-wrapper">



<div class="page-body">

<div class="row">
<div class="col-lg-12">
<div class="cover-profile">
<div class="profile-bg-img">
<img class="profile-bg-img img-fluid" src="../../files/assets/images/user-profile/bg-img1.jpg" alt="bg-img">
<div class="card-block user-info">
<div class="col-md-12">
<div class="media-left">
<a href="#" class="profile-image">
<img class="user-img img-100" src="<?php echo $get_stuednt_details['ProfilePic']; ?>" alt="user-img">
</a>
</div>
<div class="media-body row">
<div class="col-lg-12">
<div class="user-title">
<h2><?php echo $get_stuednt_details['Name']; ?></h2>
<span class="text-white">Student <?php echo $get_stuednt_details['ClassName']; ?></span>
</div>
</div>
<div>
 <div class="pull-right cover-btn">
     <h1 class="text-white"><?php echo $get_stuednt_details['StudenNo']; ?></h1>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-lg-12">

<div class="tab-header card">
<ul class="nav nav-tabs md-tabs tab-timeline" role="tablist" id="mytab">
<li class="nav-item">
<a class="nav-link active" data-toggle="tab" href="#personal" role="tab">Personal Info</a>
<div class="slide"></div>
</li>
<li class="nav-item">
<a class="nav-link" data-toggle="tab" href="#binfo" role="tab">Time Table</a>
<div class="slide"></div>
</li>
<li class="nav-item">
<a class="nav-link" data-toggle="tab" href="#contacts" role="tab">Attendance</a>
<div class="slide"></div>
</li>
<li class="nav-item">
<a class="nav-link" data-toggle="tab" href="#review" role="tab">Academic  Results</a>
<div class="slide"></div>
</li>

<li class="nav-item">
<a class="nav-link" data-toggle="tab" href="#account" role="tab">Accounts History</a>
<div class="slide"></div>
</li>


</ul>
</div>


<div class="tab-content">

<div class="tab-pane active" id="personal" role="tabpanel">

<div class="card">
<div class="card-header">
<h5 class="card-header-text">About Me</h5>
<!--<button id="edit-btn" type="button" class="btn btn-sm btn-primary waves-effect waves-light f-right">
 <i class="icofont icofont-edit"></i>
</button>-->
</div>
<div class="card-block">
<div class="view-info">
<div class="row">
<div class="col-lg-12">
<div class="general-info">
<div class="row">
<div class="col-lg-12 col-xl-6">
<div class="table-responsive">
<table class="table m-0">
<tbody>
<tr>
<th scope="row">Full Name</th>
<td><?php echo $get_stuednt_details['Name']; ?></td>
</tr>
<tr>
<th scope="row">Gender</th>
<td><?php echo $get_stuednt_details['Gender']; ?></td>
</tr>
<tr>
<th scope="row">Birth Date</th>
<td><?php echo $get_stuednt_details['DOB']; ?></td>
</tr>
<tr>
<th scope="row">Marital Status</th>
<td><?php echo $get_stuednt_details['MaritalStatus']; ?></td>
</tr>
<tr>
<th scope="row">Location</th>
<td><?php echo $get_stuednt_details['Address']; ?></td>
</tr>
</tbody>
</table>
</div>
</div>

 <div class="col-lg-12 col-xl-6">
<div class="table-responsive">
<table class="table">
<tbody>
    <tr>
<th scope="row">Student No</th>
<td><a href="#!"><?php echo $get_stuednt_details['StudenNo']; ?></a></td>
</tr>
<tr>
<th scope="row">Email</th>
<td><a href="#!"><span class="__cf_email__" ><?php echo$get_stuednt_details['EmailAddress']; ?></span></a></td>
</tr>
<tr>
<th scope="row">Contact Number</th>
<td><?php echo $get_stuednt_details['ContactNo']; ?></td>
</tr>
<tr>
<th scope="row">Male Guardian Name</th>
<td><?php echo $get_stuednt_details['GuardianMaleName']; ?></td>
</tr>
<tr>
<th scope="row">Female Guardian Name</th>
<td><?php echo $get_stuednt_details['GuardianFemaleName']; ?></td>
</tr>

</tbody>
</table>
</div>
</div>

</div>

</div>

</div>

</div>

 </div>

<div class="edit-info">
<div class="row">
<div class="col-lg-12">
<div class="general-info">
<div class="row">
<div class="col-lg-6">
<table class="table">
<tbody>
<tr>
<td>
<div class="input-group">
<span class="input-group-addon"><i class="icofont icofont-user"></i></span>
<input type="text" class="form-control" placeholder="Full Name">
</div>
</td>
</tr>
<tr>
<td>
<div class="form-radio">
<div class="group-add-on">
<div class="radio radiofill radio-inline">
<label>
<input type="radio" name="radio" checked><i class="helper"></i> Male
</label>
</div>
<div class="radio radiofill radio-inline">
<label>
<input type="radio" name="radio"><i class="helper"></i> Female
</label>
</div>
</div>
</div>
 </td>
</tr>
<tr>
<td>
<input id="dropper-default" class="form-control" type="text" placeholder="Select Your Birth Date" />
</td>
</tr>
<tr>
<td>
<select id="hello-single" class="form-control">
<option value="">---- Marital Status ----</option>
<option value="married">Married</option>
<option value="unmarried">Unmarried</option>
</select>
</td>
</tr>
<tr>
<td>
<div class="input-group">
<span class="input-group-addon"><i class="icofont icofont-location-pin"></i></span>
<input type="text" class="form-control" placeholder="Address">
</div>
</td>
</tr>
</tbody>
</table>
</div>

<div class="col-lg-6">
<table class="table">
<tbody>
<tr>
<td>
<div class="input-group">
<span class="input-group-addon"><i class="icofont icofont-mobile-phone"></i></span>
 <input type="text" class="form-control" placeholder="Mobile Number">
</div>
</td>
</tr>
<tr>
<td>
<div class="input-group">
<span class="input-group-addon"><i class="icofont icofont-social-twitter"></i></span>
<input type="text" class="form-control" placeholder="Twitter Id">
</div>
</td>
</tr>

<tr>
<td>
<div class="input-group">
<span class="input-group-addon"><i class="icofont icofont-social-skype"></i></span>
<input type="email" class="form-control" placeholder="Skype Id">
</div>
</td>
</tr>
<tr>
<td>
<div class="input-group">
<span class="input-group-addon"><i class="icofont icofont-earth"></i></span>
<input type="text" class="form-control" placeholder="website">
 </div>
</td>
</tr>
</tbody>
</table>
</div>

</div>

<div class="text-center">
<a href="#!" class="btn btn-primary waves-effect waves-light m-r-20">Save</a>
<a href="#!" id="edit-cancel" class="btn btn-default waves-effect">Cancel</a>
</div>
</div>

</div>

</div>

</div>

</div>

</div>


</div>


<div class="tab-pane" id="binfo" role="tabpanel">

<div class="card">
<div class="card-header">
<h5 class="card-header-text">Time Table </h5>
</div>
      

     <div class="card">
                                    <?php if (isset($classname)){
                                           ?>
                                    
                                       <h2><b>Class Time Table For <?php echo $classname; ?></b></h2><br> 
                                        
                                  
                                    
                                    <div class="card-block table-border-style">
                                        <div class="table-responsive">
                                            <table class="table table-styling table-hover table-striped table-primary">
                                                <thead>
                                                    <tr>
                                                        <th>Days</th>
                                                         <?php  
                                                         
                                                       $headers = $periods;
                                                       

                                                      foreach ($headers as $key => $value) {

                                                                             ?>

                                                 <?php ?>
                                                 <th><?php echo $value; ?></th>

                                                 <?php } ?>
                                                     
                                                    </tr>
                                                    
                                                                               
<tr>
   
    <td  class="text-c-yellow" bgcolor="47706a" style="font-size: 20px; font-weight: bold;" >Monday</td>
     <?php foreach ($monday as $key => $value) {
                         
                      ?>
    <td><?php echo $value ?></td>
       
     <?php   } ?>
 
   
</tr>

                                                                               
<tr>
   
    <td  class="text-c-yellow" bgcolor="47706a" style="font-size: 20px; font-weight: bold;" >Tuesday</td>
     <?php foreach ($tuesday as $key => $value) {
                         
                      ?>
    <td><?php echo $value ?></td>
       
     <?php   } ?>
   
</tr>


                                                                               
<tr>
   
    <td  class="text-c-yellow" bgcolor="47706a" style="font-size: 20px; font-weight: bold;" >Wednesday</td>
     <?php foreach ($wednsday as $key => $value) {
                         
                      ?>
    <td><?php echo $value ?></td>
       
     <?php   } ?>
   
</tr>


                                                                               
<tr>
   
    <td  class="text-c-yellow" bgcolor="47706a" style="font-size: 20px; font-weight: bold;" >Thursday </td>
     <?php foreach ($thursday as $key => $value) {
                         
                      ?>
    <td><?php echo $value ?></td>
       
     <?php   } ?>
   
</tr>


                                                                               
<tr>
   
    <td  class="text-c-yellow" bgcolor="47706a" style="font-size: 20px; font-weight: bold;" >Friday</td>
     <?php foreach ($friday as $key => $value) {
                         
                      ?>
    <td><?php echo $value ?></td>
       
     <?php   } ?>
  
</tr>

<tr>
   
    <td  class="text-c-yellow" bgcolor="47706a" style="font-size: 20px; font-weight: bold;" >Saturday</td>
     <?php foreach ($saturday as $key => $value) {
                         
                      ?>
    <td><?php echo $value ?></td>
       
     <?php   } ?>
  
</tr>



<tr>
   
    <td  class="text-c-yellow" bgcolor="47706a" style="font-size: 20px; font-weight: bold;" >Sunday</td>
     <?php foreach ($sunday as $key => $value) {
                         
                      ?>
    <td><?php echo $value ?></td>
       
     <?php   } ?>
  
</tr>

                                                </thead>
                                                
                                            </table>
                                        </div>
                                    </div>
                                       
                                        <?php } else { ?>
                                       
                                      <center>  <h5>Please Select Class</h5>
                                                   <img src="../../img/timetable.png"/></center>
                                       
                                      <?php } ?>
                                </div>
</div>
</div>


<div class="tab-pane" id="contacts" role="tabpanel">
<div class="row">
<div class="col-xl-3">

<div class="card">
<div class="card-header contact-user">
    <img class="img-radius img-40" src="<?php echo $get_stuednt_details['PicURL'];?>" alt="School Logo">
<h5 class="m-l-10">History</h5>
</div>
<div class="card-block">
<ul class="list-group list-contacts">
<li class="list-group-item active"><a href="#">Total Attendance</a></li>
<li class="list-group-item"><a href="#">Present Days: <?php echo $attendancy_data['TOTALPRESENTDAYS'];?></a></li>
<li class="list-group-item"><a href="#">Absent Days: <?php echo $attendancy_data['TOTALABSETDAYS'];?></a></li>
</ul>
</div>
 <div class="card-block groups-contact">
<h4>Awards</h4>
<ul class="list-group">
<li class="list-group-item justify-content-between">
Received
<span class="badge badge-primary badge-pill">0</span>
</li>

</ul>
</div>
</div>
<!--    This is for proper alignment div below -->
<div class="card">
<div class="">

</div>
</div>
<!--   END  This is for proper alignment div below -->

</div>
<div class="col-xl-9">
<div class="row">
<div class="col-sm-12">

<div class="card">
<div class="card-header">

</div>
<div class="card-block contact-details">
<div class="data_table_main table-responsive dt-responsive">

 <table id="simpletable" class="table  table-striped table-bordered nowrap">
<thead>
<tr>
<th>Student ID</th>

<th>Class</th>
<th>Reason</th>
<th>Status</th>
<th>Marked Date</th>

</tr>
</thead>
<tbody>
      <?php while($row_data = $stm_get_atendance_history->fetch(PDO::FETCH_ASSOC))
                            
                    {
                       
                            ?>
<tr>
   
         <td><?php echo $row_data['StudentNo'];?></td>
        
       
        <td ><?php echo $row_data['ClassName'];?></td>
          <td ><?php echo $row_data['Reason'];?></td>
            <td ><?php echo $row_data['Statue'];?></td>
              <td ><?php echo $row_data['MarkedOn'];?></td>
                
       


</tr>

     <?php } ?>





</tbody>
<tfoot>
<tr>
<th>Student ID</th>

<th>Class</th>
<th>Reason</th>
<th>Status</th>
<th>Marked Date</th>

</tr>
</tfoot>
</table>   
    
    
    
</div>
</div>
</div>

</div>
</div>
</div>
</div>
</div>

 <div class="tab-pane" id="review" role="tabpanel">
<div class="row">
<div class="col-xl-3">


</div>
<div class="col-xl-12">
<div class="row">
<div class="col-sm-12">

<div class="card">

<div class="card-block contact-details">
<div class="data_table_main table-responsive dt-responsive">

 <table id="simpletable2" class="table  table-striped table-bordered nowrap">
<thead>
<tr>
    <th>Grade</th>
<th>Subject</th>
<th>Type</th>
<th>Score</th>
<th>Marked Date</th>

</tr>
</thead>
<tbody>
      <?php while($row_data = $get_stdent_asscement->fetch(PDO::FETCH_ASSOC))
                            
                    {
                       
                            ?>
<tr>
   
         <td><?php echo $row_data['ClassName'];?></td>
        
       
        <td ><?php echo $row_data['Subject'];?></td>
          <td ><?php echo $row_data['AssecementName'];?></td>
            <td ><?php echo $row_data['Score'];?></td>
              <td ><?php echo $row_data['MarkedOn'];?></td>
                
       


</tr>

     <?php } ?>





</tbody>
<tfoot>
<tr>
       <th>Grade</th>
<th>Subject</th>
<th>Type</th>
<th>Score</th>
<th>Marked Date</th>

</tr>
</tfoot>
</table>   
    
    
    
</div>
</div>
</div>

</div>
</div>
</div>
</div>
</div>
    
   <div class="tab-pane" id="account" role="tabpane5">
<div class="row">
<div class="col-xl-3">


</div>
<div class="col-xl-12">
<div class="row">
<div class="col-sm-12">

<div class="card">

<div class="card-block contact-details">
<div class="data_table_main table-responsive dt-responsive">

 <table id="simpletable" class="table  table-striped table-bordered nowrap">
<thead>
<tr>

<tbody id="">
 <?php
while ($row_sd = $student_data->fetch(PDO::FETCH_ASSOC)) {

    ?>
    <tr>
          <td></td>
         
        <td><?php echo $row_sd['Name']; ?></td>
        <td><?php echo $row_sd['PaidAmout']; ?></td>
        <td><?php echo $row_sd['Balace']; ?></td>
        <td><?php echo $row_sd['PaymentType']; ?></td>
          <td><?php echo $row_sd['ReciptNo']; ?></td>
            <td><?php echo $row_sd['BilledOn']; ?></td>
              <td><?php echo $row_sd['UpdatedBy']; ?></td>

    </tr>

<?php } ?>





</tbody>
<tfoot>
<tr>
<th></th>
<th>Name</th>
<th>Paid Amount (K)</th>
<th>Balance (K)</th>
<th>Payment Method</th>
<th>receipt No.</th>
<th>Billed On</th>
<th>Billed By</th>
</tr>
</tfoot>
</table>   
    
    
    
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


<script data-cfasync="false" src="../../files/email-decode.min.js"></script><script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/jquery/js/jquery.min.js"></script>
<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/jquery-ui/js/jquery-ui.min.js"></script>
<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/popper.js/js/popper.min.js"></script>
<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/bootstrap/js/bootstrap.min.js"></script>

<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/jquery-slimscroll/js/jquery.slimscroll.js"></script>

<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/modernizr/js/modernizr.js"></script>
<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/modernizr/js/css-scrollbars.js"></script>

<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/assets/pages/advance-elements/moment-with-locales.min.js"></script>
<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/assets/pages/advance-elements/bootstrap-datetimepicker.min.js"></script>

<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/bootstrap-daterangepicker/js/daterangepicker.js"></script>

<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/datedropper/js/datedropper.min.js"></script>

<script src="../../files/bower_components/datatables.net/js/jquery.dataTables.min.js" type="fc62f3ba96b90a09d14681a9-text/javascript"></script>

<script src="../../files/bower_components/datatables.net-bs4/js/dataTables.bootstrap4.min.js" type="fc62f3ba96b90a09d14681a9-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-responsive/js/dataTables.responsive.min.js" type="fc62f3ba96b90a09d14681a9-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js" type="fc62f3ba96b90a09d14681a9-text/javascript"></script>

<script src="../../files/assets/pages/ckeditor/ckeditor.js" type="fc62f3ba96b90a09d14681a9-text/javascript"></script>

<script src="../../files/assets/pages/chart/echarts/js/echarts-all.js" type="fc62f3ba96b90a09d14681a9-text/javascript"></script>



<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/assets/pages/advance-elements/select2-custom.js"></script>



<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/i18next/js/i18next.min.js"></script>
<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/i18next-xhr-backend/js/i18nextXHRBackend.min.js"></script>
<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/i18next-browser-languagedetector/js/i18nextBrowserLanguageDetector.min.js"></script>
<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/jquery-i18next/js/jquery-i18next.min.js"></script>

<!--this of for the search on the tables -->
<script src="../../files/assets/pages/user-profile.js" type="fc62f3ba96b90a09d14681a9-text/javascript"></script>
<!--end this of for the search on the tables -->

<script src="../../files/assets/js/pcoded.min.js" type="fc62f3ba96b90a09d14681a9-text/javascript"></script>
<script src="../../files/assets/js/vartical-layout.min.js" type="fc62f3ba96b90a09d14681a9-text/javascript"></script>
<script src="../../files/assets/js/jquery.mCustomScrollbar.concat.min.js" type="fc62f3ba96b90a09d14681a9-text/javascript"></script>

<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/assets/js/script.js"></script>

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13" type="fc62f3ba96b90a09d14681a9-text/javascript"></script>
<script type="fc62f3ba96b90a09d14681a9-text/javascript">
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
<script src="../../files/rocket-loader.min.js" data-cf-settings="fc62f3ba96b90a09d14681a9-|49" defer=""></script></body>

<!-- Mirrored from colorlib.com//polygon/adminty/default/user-profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:45:46 GMT -->
</html>

