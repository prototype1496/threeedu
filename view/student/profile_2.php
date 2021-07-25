<?php require '../../controller/super/SessionStart.php'; ?>
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

<link rel="stylesheet" type="text/css" href="../../files/assets/css/style.css">
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


<!--side bar start  -->
<?php require './sidbar.php'; ?>
<!--side bar end  -->


<div class="pcoded-content">
<div class="pcoded-inner-content">

<div class="main-body">
<div class="page-wrapper">

<div class="page-header">
<div class="row align-items-end">
<div class="col-lg-8">
<div class="page-header-title">
<div class="d-inline">
<h4>User Profile</h4>
<span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span>
</div>
</div>
</div>
<div class="col-lg-4">
<div class="page-header-breadcrumb">
<ul class="breadcrumb-title">
<li class="breadcrumb-item">
<a href="index.html"> <i class="feather icon-home"></i> </a>
</li>
<li class="breadcrumb-item"><a href="#!">User Profile</a>
</li>
<li class="breadcrumb-item"><a href="#!">User Profile</a>
</li>
</ul>
</div>
</div>
</div>
</div>


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
<img class="user-img img-radius" src="../../files/assets/images/user-profile/user-img.jpg" alt="user-img">
</a>
</div>
<div class="media-body row">
<div class="col-lg-12">
<div class="user-title">
<h2>Josephin Villa</h2>
<span class="text-white">Web designer</span>
</div>
</div>
<div>
 <div class="pull-right cover-btn">
<button type="button" class="btn btn-primary m-r-10 m-b-5"><i class="icofont icofont-plus"></i> Follow</button>
<button type="button" class="btn btn-primary"><i class="icofont icofont-ui-messaging"></i> Message</button>
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
<a class="nav-link" data-toggle="tab" href="#binfo" role="tab">User's Services</a>
<div class="slide"></div>
</li>
<li class="nav-item">
<a class="nav-link" data-toggle="tab" href="#contacts" role="tab">User's Contacts</a>
<div class="slide"></div>
</li>
<li class="nav-item">
<a class="nav-link" data-toggle="tab" href="#review" role="tab">Reviews</a>
<div class="slide"></div>
</li>
</ul>
</div>


<div class="tab-content">

<div class="tab-pane active" id="personal" role="tabpanel">

<div class="card">
<div class="card-header">
<h5 class="card-header-text">About Me</h5>
<button id="edit-btn" type="button" class="btn btn-sm btn-primary waves-effect waves-light f-right">
 <i class="icofont icofont-edit"></i>
</button>
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
<td>Josephine Villa</td>
</tr>
<tr>
<th scope="row">Gender</th>
<td>Female</td>
</tr>
<tr>
<th scope="row">Birth Date</th>
<td>October 25th, 1990</td>
</tr>
<tr>
<th scope="row">Marital Status</th>
<td>Single</td>
</tr>
<tr>
<th scope="row">Location</th>
<td>New York, USA</td>
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
<th scope="row">Email</th>
<td><a href="#!"><span class="__cf_email__" data-cfemail="3f7b5a52507f5a475e524f535a115c5052">[email&#160;protected]</span></a></td>
</tr>
<tr>
<th scope="row">Mobile Number</th>
<td>(0123) - 4567891</td>
</tr>
<tr>
<th scope="row">Twitter</th>
<td>@xyz</td>
</tr>
<tr>
<th scope="row">Skype</th>
<td>demo.skype</td>
</tr>
<tr>
<th scope="row">Website</th>
<td><a href="#!">www.demo.com</a></td>
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
<h5 class="card-header-text">User Services</h5>
</div>
<div class="card-block">
<div class="row">
<div class="col-md-6">
<div class="card b-l-success business-info services m-b-20">
<div class="card-header">
<div class="service-header">
<a href="#">
<h5 class="card-header-text">Shivani Hero</h5>
</a>
</div>
<span class="dropdown-toggle addon-btn text-muted f-right service-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" role="tooltip">
</span>
<div class="dropdown-menu dropdown-menu-right b-none services-list">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i> Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i> Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i> View</a>
</div>
</div>
<div class="card-block">
<div class="row">
<div class="col-sm-12">
 <p class="task-detail">Lorem ipsum dolor sit amet, consectet ur adipisicing elit, sed do eiusmod temp or incidi dunt ut labore et.Lorem ipsum dolor sit amet, consecte.</p>
</div>

</div>

</div>

</div>
</div>
<div class="col-md-6">
<div class="card b-l-danger business-info services">
<div class="card-header">
<div class="service-header">
<a href="#">
<h5 class="card-header-text">Dress and Sarees</h5>
</a>
</div>
<span class="dropdown-toggle addon-btn text-muted f-right service-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" role="tooltip">
</span>
<div class="dropdown-menu dropdown-menu-right b-none services-list">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i> Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i> Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i> View</a>
</div>
</div>
<div class="card-block">
<div class="row">
<div class="col-sm-12">
<p class="task-detail">Lorem ipsum dolor sit amet, consectet ur adipisicing elit, sed do eiusmod temp or incidi dunt ut labore et.Lorem ipsum dolor sit amet, consecte.</p>
</div>

</div>

</div>

</div>
</div>
<div class="col-md-6">
<div class="card b-l-info business-info services">
<div class="card-header">
<div class="service-header">
<a href="#">
<h5 class="card-header-text">Shivani Auto Port</h5>
</a>
</div>
<span class="dropdown-toggle addon-btn text-muted f-right service-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" role="tooltip">
</span>
<div class="dropdown-menu dropdown-menu-right b-none services-list">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i> Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i> Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i> View</a>
</div>
</div>
<div class="card-block">
<div class="row">
<div class="col-sm-12">
<p class="task-detail">Lorem ipsum dolor sit amet, consectet ur adipisicing elit, sed do eiusmod temp or incidi dunt ut labore et.Lorem ipsum dolor sit amet, consecte.</p>
</div>

</div>

</div>

</div>
</div>
<div class="col-md-6">
<div class="card b-l-warning business-info services">
<div class="card-header">
<div class="service-header">
<a href="#">
<h5 class="card-header-text">Hair stylist</h5>
 </a>
</div>
<span class="dropdown-toggle addon-btn text-muted f-right service-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" role="tooltip">
</span>
<div class="dropdown-menu dropdown-menu-right b-none services-list">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i> Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i> Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i> View</a>
</div>
</div>
<div class="card-block">
<div class="row">
<div class="col-sm-12">
<p class="task-detail">Lorem ipsum dolor sit amet, consectet ur adipisicing elit, sed do eiusmod temp or incidi dunt ut labore et.Lorem ipsum dolor sit amet, consecte.</p>
</div>

</div>

</div>

</div>
</div>
<div class="col-md-6">
<div class="card b-l-danger business-info services">
<div class="card-header">
<div class="service-header">
<a href="#">
<h5 class="card-header-text">BMW India</h5>
</a>
</div>
<span class="dropdown-toggle addon-btn text-muted f-right service-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" role="tooltip">
</span>
<div class="dropdown-menu dropdown-menu-right b-none services-list">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i> Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i> Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i> View</a>
</div>
</div>
<div class="card-block">
<div class="row">
<div class="col-sm-12">
<p class="task-detail">Lorem ipsum dolor sit amet, consectet ur adipisicing elit, sed do eiusmod temp or incidi dunt ut labore et.Lorem ipsum dolor sit amet, consecte.</p>
</div>

</div>

</div>

</div>
</div>
<div class="col-md-6">
<div class="card b-l-success business-info services">
<div class="card-header">
<div class="service-header">
<a href="#">
<h5 class="card-header-text">Shivani Hero</h5>
</a>
</div>
<span class="dropdown-toggle addon-btn text-muted f-right service-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" role="tooltip">
</span>
<div class="dropdown-menu dropdown-menu-right b-none services-list">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i> Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i> Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i> View</a>
</div>
</div>
<div class="card-block">
<div class="row">
<div class="col-sm-12">
<p class="task-detail">Lorem ipsum dolor sit amet, consectet ur adipisicing elit, sed do eiusmod temp or incidi dunt ut labore et.Lorem ipsum dolor sit amet, consecte.</p>
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
<div class="card">
<div class="card-header">
<h5 class="card-header-text">Profit</h5>
</div>
<div class="card-block">
<div id="main" style="height:300px;width: 100%;"></div>
</div>
</div>
</div>
</div>

</div>


<div class="tab-pane" id="contacts" role="tabpanel">
<div class="row">
<div class="col-xl-3">

<div class="card">
<div class="card-header contact-user">
<img class="img-radius img-40" src="../../files/assets/images/avatar-4.jpg" alt="contact-user">
<h5 class="m-l-10">John Doe</h5>
</div>
<div class="card-block">
<ul class="list-group list-contacts">
<li class="list-group-item active"><a href="#">All Contacts</a></li>
<li class="list-group-item"><a href="#">Recent Contacts</a></li>
<li class="list-group-item"><a href="#">Favourite Contacts</a></li>
</ul>
</div>
 <div class="card-block groups-contact">
<h4>Groups</h4>
<ul class="list-group">
<li class="list-group-item justify-content-between">
Project
<span class="badge badge-primary badge-pill">30</span>
</li>
<li class="list-group-item justify-content-between">
Notes
<span class="badge badge-success badge-pill">20</span>
</li>
<li class="list-group-item justify-content-between">
Activity
<span class="badge badge-info badge-pill">100</span>
</li>
<li class="list-group-item justify-content-between">
Schedule
<span class="badge badge-danger badge-pill">50</span>
</li>
</ul>
</div>
</div>
<div class="card">
<div class="card-header">
<h4 class="card-title">Contacts<span class="f-15"> (100)</span></h4>
</div>
<div class="card-block">
<div class="connection-list">
<a href="#"><img class="img-fluid img-radius" src="../../files/assets/images/user-profile/follower/f-1.jpg" alt="f-1" data-toggle="tooltip" data-placement="top" data-original-title="Airi Satou">
</a>
<a href="#"><img class="img-fluid img-radius" src="../../files/assets/images/user-profile/follower/f-2.jpg" alt="f-2" data-toggle="tooltip" data-placement="top" data-original-title="Angelica Ramos">
</a>
<a href="#"><img class="img-fluid img-radius" src="../../files/assets/images/user-profile/follower/f-3.jpg" alt="f-3" data-toggle="tooltip" data-placement="top" data-original-title="Ashton Cox">
</a>
<a href="#"><img class="img-fluid img-radius" src="../../files/assets/images/user-profile/follower/f-4.jpg" alt="f-4" data-toggle="tooltip" data-placement="top" data-original-title="Cara Stevens">
</a>
<a href="#"><img class="img-fluid img-radius" src="../../files/assets/images/user-profile/follower/f-5.jpg" alt="f-5" data-toggle="tooltip" data-placement="top" data-original-title="Garrett Winters">
</a>
<a href="#"><img class="img-fluid img-radius" src="../../files/assets/images/user-profile/follower/f-1.jpg" alt="f-6" data-toggle="tooltip" data-placement="top" data-original-title="Cedric Kelly">
</a>
<a href="#"><img class="img-fluid img-radius" src="../../files/assets/images/user-profile/follower/f-3.jpg" alt="f-7" data-toggle="tooltip" data-placement="top" data-original-title="Brielle Williamson">
</a>
<a href="#"><img class="img-fluid img-radius" src="../../files/assets/images/user-profile/follower/f-5.jpg" alt="f-8" data-toggle="tooltip" data-placement="top" data-original-title="Jena Gaines">
</a>
</div>
</div>
</div>

</div>
<div class="col-xl-9">
<div class="row">
<div class="col-sm-12">

<div class="card">
<div class="card-header">
<h5 class="card-header-text">Contacts</h5>
</div>
<div class="card-block contact-details">
<div class="data_table_main table-responsive dt-responsive">
<table id="simpletable" class="table  table-striped table-bordered nowrap">
<thead>
<tr>
<th>Name</th>
<th>Email</th>
<th>Mobileno.</th>
<th>Favourite</th>
<th>Action</th>
</tr>
 </thead>
<tbody>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="8beae9e8bab9b8cbece6eae2e7a5e8e4e6">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="7f1e1d1c4e4d4c3f18121e1613511c1012">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star-o" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="c6a7a4a5f7f4f586a1aba7afaae8a5a9ab">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
 <a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="cfaeadacfefdfc8fa8a2aea6a3e1aca0a2">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="3352515002010073545e525a5f1d505c5e">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star-o" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="a2c3c0c1939091e2c5cfc3cbce8cc1cdcf">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="0766656436353447606a666e6b2964686a">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="afcecdcc9e9d9cefc8c2cec6c381ccc0c2">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="dcbdbebfedeeef9cbbb1bdb5b0f2bfb3b1">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
 <a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="81e0e3e2b0b3b2c1e6ece0e8edafe2eeec">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star-o" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
 <td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="f9989b9ac8cbcab99e94989095d79a9694">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="28494a4b191a1b684f45494144064b4745">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
 <a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="6302010052515023040e020a0f4d000c0e">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
 <tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="5130333260636211363c30383d7f323e3c">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="e2838081d3d0d1a2858f838b8ecc818d8f">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star-o" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="dabbb8b9ebe8e99abdb7bbb3b6f4b9b5b7">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
 </div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="0f6e6d6c3e3d3c4f68626e6663216c6062">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star-o" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="44252627757677042329252d286a272b29">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button> 
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="dfbebdbceeedec9fb8b2beb6b3f1bcb0b2">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="18797a7b292a2b587f75797174367b7775">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star-o" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="fa9b9899cbc8c9ba9d979b9396d4999597">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
 <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="9afbf8f9aba8a9dafdf7fbf3f6b4f9f5f7">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
 <a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="8cedeeefbdbebfccebe1ede5e0a2efe3e1">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star-o" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="0e6f6c6d3f3c3d4e69636f6762206d6163">[email&#160;protected]</a></td>
<td>9989988988</td>
 <td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="2c4d4e4f1d1e1f6c4b414d4540024f4341">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="5736353466656417303a363e3b7934383a">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
 <td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="64050607555657240309050d084a070b09">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="74151617454647341319151d185a171b19">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
 <a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="bcdddedf8d8e8ffcdbd1ddd5d092dfd3d1">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
 </tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="b8d9dadb898a8bf8dfd5d9d1d496dbd7d5">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="b3d2d1d0828180f3d4ded2dadf9dd0dcde">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
 <a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="4726252476757407202a262e2b6924282a">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="3756555406050477505a565e5b1954585a">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="79181b1a484b4a391e14181015571a1614">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="1776757426252457707a767e7b3974787a">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
 <a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="6a0b08095b58592a0d070b030644090507">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="1c7d7e7f2d2e2f5c7b717d7570327f7371">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
 <td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="1e7f7c7d2f2c2d5e79737f7772307d7173">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="19787b7a282b2a597e74787075377a7674">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="f8999a9bc9cacbb89f95999194d69b9795">[email&#160;protected]</a></td>
 <td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="9ffefdfcaeadacdff8f2fef6f3b1fcf0f2">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
 <a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="1273707123202152757f737b7e3c717d7f">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
 <tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="2041424311121360474d41494c0e434f4d">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="0263606133303142656f636b6e2c616d6f">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="6302010052515023040e020a0f4d000c0e">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
 </td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="0263606133303142656f636b6e2c616d6f">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="dcbdbebfedeeef9cbbb1bdb5b0f2bfb3b1">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
 <div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="7213101143404132151f131b1e5c111d1f">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
 <a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="4627242577747506212b272f2a6825292b">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="bcdddedf8d8e8ffcdbd1ddd5d092dfd3d1">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
 <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
<tr>
<td>Garrett Winters</td>
<td><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="8aebe8e9bbb8b9caede7ebe3e6a4e9e5e7">[email&#160;protected]</a></td>
<td>9989988988</td>
<td><i class="fa fa-star" aria-hidden="true"></i></td>
<td class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i></button>
<div class="dropdown-menu dropdown-menu-right b-none contact-menu">
<a class="dropdown-item" href="#!"><i class="icofont icofont-edit"></i>Edit</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-delete"></i>Delete</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye-alt"></i>View</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-tasks-alt"></i>Project</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-ui-note"></i>Notes</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-eye"></i>Activity</a>
<a class="dropdown-item" href="#!"><i class="icofont icofont-badge"></i>Schedule</a>
</div>
</td>
</tr>
</tbody>
<tfoot>
<tr>
<th>Name</th>
<th>Email</th>
<th>Mobileno.</th>
<th>Favourite</th>
<th>Action</th>
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
<div class="card">
<div class="card-header">
<h5 class="card-header-text">Review</h5>
</div>
<div class="card-block">
<ul class="media-list">
<li class="media">
<div class="media-left">
<a href="#">
<img class="media-object img-radius comment-img" src="../../files/assets/images/avatar-1.jpg" alt="Generic placeholder image">
</a>
</div>
<div class="media-body">
 <h6 class="media-heading">Sortino media<span class="f-12 text-muted m-l-5">Just now</span></h6>
<div class="stars-example-css review-star">
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
</div>
<p class="m-b-0">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.</p>
<div class="m-b-25">
<span><a href="#!" class="m-r-10 f-12">Reply</a></span><span><a href="#!" class="f-12">Edit</a> </span>
</div>
<hr>

<div class="media mt-2">
<a class="media-left" href="#">
<img class="media-object img-radius comment-img" src="../../files/assets/images/avatar-2.jpg" alt="Generic placeholder image">
</a>
<div class="media-body">
<h6 class="media-heading">Larry heading <span class="f-12 text-muted m-l-5">Just now</span></h6>
<div class="stars-example-css review-star">
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
</div>
<p class="m-b-0"> Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.</p>
<div class="m-b-25">
<span><a href="#!" class="m-r-10 f-12">Reply</a></span><span><a href="#!" class="f-12">Edit</a> </span>
</div>
 <hr>

<div class="media mt-2">
<div class="media-left">
<a href="#">
<img class="media-object img-radius comment-img" src="../../files/assets/images/avatar-3.jpg" alt="Generic placeholder image">
</a>
</div>
<div class="media-body">
<h6 class="media-heading">Colleen Hurst <span class="f-12 text-muted m-l-5">Just now</span></h6>
<div class="stars-example-css review-star">
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
</div>
<p class="m-b-0">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.</p>
<div class="m-b-25">
<span><a href="#!" class="m-r-10 f-12">Reply</a></span><span><a href="#!" class="f-12">Edit</a> </span>
</div>
</div>
<hr>
</div>
</div>
</div>

<div class="media mt-2">
<div class="media-left">
<a href="#">
<img class="media-object img-radius comment-img" src="../../files/assets/images/avatar-1.jpg" alt="Generic placeholder image">
</a>
</div>
 <div class="media-body">
<h6 class="media-heading">Cedric Kelly<span class="f-12 text-muted m-l-5">Just now</span></h6>
<div class="stars-example-css review-star">
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
</div>
<p class="m-b-0">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.</p>
<div class="m-b-25">
<span><a href="#!" class="m-r-10 f-12">Reply</a></span><span><a href="#!" class="f-12">Edit</a> </span>
</div>
<hr>
</div>
</div>
<div class="media mt-2">
<a class="media-left" href="#">
<img class="media-object img-radius comment-img" src="../../files/assets/images/avatar-4.jpg" alt="Generic placeholder image">
</a>
<div class="media-body">
<h6 class="media-heading">Larry heading <span class="f-12 text-muted m-l-5">Just now</span></h6>
<div class="stars-example-css review-star">
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
</div>
<p class="m-b-0"> Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.</p>
<div class="m-b-25">
 <span><a href="#!" class="m-r-10 f-12">Reply</a></span><span><a href="#!" class="f-12">Edit</a> </span>
</div>
<hr>

<div class="media mt-2">
<div class="media-left">
<a href="#">
<img class="media-object img-radius comment-img" src="../../files/assets/images/avatar-3.jpg" alt="Generic placeholder image">
</a>
</div>
<div class="media-body">
<h6 class="media-heading">Colleen Hurst <span class="f-12 text-muted m-l-5">Just now</span></h6>
<div class="stars-example-css review-star">
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
</div>
<p class="m-b-0">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.</p>
<div class="m-b-25">
<span><a href="#!" class="m-r-10 f-12">Reply</a></span><span><a href="#!" class="f-12">Edit</a> </span>
</div>
</div>
<hr>
</div>
</div>
</div>
<div class="media mt-2">
<div class="media-left">
<a href="#">
<img class="media-object img-radius comment-img" src="../../files/assets/images/avatar-2.jpg" alt="Generic placeholder image">
 </a>
</div>
<div class="media-body">
<h6 class="media-heading">Mark Doe<span class="f-12 text-muted m-l-5">Just now</span></h6>
<div class="stars-example-css review-star">
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
<i class="icofont icofont-star"></i>
</div>
<p class="m-b-0">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.</p>
<div class="m-b-25">
<span><a href="#!" class="m-r-10 f-12">Reply</a></span><span><a href="#!" class="f-12">Edit</a> </span>
</div>
<hr>
</div>
</div>
</div>
</li>
</ul>
<div class="input-group">
<input type="text" class="form-control" placeholder="Right addon">
<span class="input-group-addon"><i class="icofont icofont-send-mail"></i></span>
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

<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/i18next/js/i18next.min.js"></script>
<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/i18next-xhr-backend/js/i18nextXHRBackend.min.js"></script>
<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/i18next-browser-languagedetector/js/i18nextBrowserLanguageDetector.min.js"></script>
<script type="fc62f3ba96b90a09d14681a9-text/javascript" src="../../files/bower_components/jquery-i18next/js/jquery-i18next.min.js"></script>
<script src="../../files/assets/pages/user-profile.js" type="fc62f3ba96b90a09d14681a9-text/javascript"></script>
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
