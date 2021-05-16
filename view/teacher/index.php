<?php require '../../controller/super/SessionStart.php'; ?>
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
<div class="page-body">
<div class="row">

<div class="col-xl-3 col-md-6">
<div class="card bg-c-yellow text-white">
<div class="card-block">
<div class="row align-items-center">
<div class="col">
<p class="m-b-5">New Customer</p>
<h4 class="m-b-0">852</h4>
</div>
<div class="col col-auto text-right">
<i class="feather icon-user f-50 text-c-yellow"></i>
 </div>
</div>
</div>
</div>
</div>
<div class="col-xl-3 col-md-6">
<div class="card bg-c-green text-white">
<div class="card-block">
<div class="row align-items-center">
<div class="col">
<p class="m-b-5">Income</p>
<h4 class="m-b-0">$5,852</h4>
</div>
<div class="col col-auto text-right">
<i class="feather icon-credit-card f-50 text-c-green"></i>
</div>
</div>
</div>
</div>
</div>
<div class="col-xl-3 col-md-6">
<div class="card bg-c-pink text-white">
<div class="card-block">
<div class="row align-items-center">
<div class="col">
<p class="m-b-5">Ticket</p>
<h4 class="m-b-0">42</h4>
</div>
<div class="col col-auto text-right">
<i class="feather icon-book f-50 text-c-pink"></i>
</div>
</div>
</div>
</div>
</div>
<div class="col-xl-3 col-md-6">
<div class="card bg-c-blue text-white">
<div class="card-block">
<div class="row align-items-center">
<div class="col">
<p class="m-b-5">Orders</p>
<h4 class="m-b-0">$5,242</h4>
</div>
<div class="col col-auto text-right">
<i class="feather icon-shopping-cart f-50 text-c-blue"></i>
</div>
</div>
</div>
</div>
</div>


<div class="col-xl-8 col-md-12">
 <div class="card">
<div class="card-header">
<div class="card-header-left ">
<h5>Monthly View</h5>
<span class="text-muted">For more details about usage, please refer <a href="https://www.amcharts.com/online-store/" target="_blank">amCharts</a> licences.</span>
</div>
</div>
<div class="card-block-big">
<div id="monthly-graph" style="height:250px"></div>
</div>
</div>
</div>
<div class="col-xl-4 col-md-12">
<div class="card feed-card">
<div class="card-header">
<h5>Feeds</h5>
</div>
<div class="card-block">
<div class="row m-b-30">
<div class="col-auto p-r-0">
<i class="feather icon-bell bg-simple-c-blue feed-icon"></i>
</div>
<div class="col">
<h6 class="m-b-5">You have 3 pending tasks. <span class="text-muted f-right f-13">Just Now</span></h6>
</div>
</div>
<div class="row m-b-30">
<div class="col-auto p-r-0">
<i class="feather icon-shopping-cart bg-simple-c-pink feed-icon"></i>
</div>
<div class="col">
<h6 class="m-b-5">New order received <span class="text-muted f-right f-13">Just Now</span></h6>
</div>
</div>
<div class="row m-b-30">
<div class="col-auto p-r-0">
<i class="feather icon-file-text bg-simple-c-green feed-icon"></i>
</div>
<div class="col">
<h6 class="m-b-5">You have 3 pending tasks. <span class="text-muted f-right f-13">Just Now</span></h6>
</div>
</div>
<div class="row m-b-30">
<div class="col-auto p-r-0">
<i class="feather icon-shopping-cart bg-simple-c-pink feed-icon"></i>
</div>
 <div class="col">
<h6 class="m-b-5">New order received <span class="text-muted f-right f-13">Just Now</span></h6>
</div>
</div>
<div class="row m-b-30">
<div class="col-auto p-r-0">
<i class="feather icon-file-text bg-simple-c-green feed-icon"></i>
</div>
<div class="col">
<h6 class="m-b-5">You have 3 pending tasks. <span class="text-muted f-right f-13">Just Now</span></h6>
</div>
</div>
</div>
</div>
</div>


<div class="col-xl-4 col-md-6">
<div class="card">
<div class="card-header">
<h5>Total Leads</h5>
<div class="card-header-right">
<ul class="list-unstyled card-option">
<li><i class="fa fa fa-wrench open-card-option"></i></li>
<li><i class="fa fa-window-maximize full-card"></i></li>
<li><i class="fa fa-minus minimize-card"></i></li>
<li><i class="fa fa-refresh reload-card"></i></li>
<li><i class="fa fa-trash close-card"></i></li>
</ul>
</div>
</div>
<div class="card-block">
<p class="text-c-green f-w-500"><i class="feather icon-chevrons-up m-r-5"></i> 18% High than last month</p>
<div class="row">
<div class="col-4 b-r-default">
<p class="text-muted m-b-5">Overall</p>
<h5>76.12%</h5>
</div>
<div class="col-4 b-r-default">
<p class="text-muted m-b-5">Monthly</p>
<h5>16.40%</h5>
</div>
<div class="col-4">
<p class="text-muted m-b-5">Day</p>
<h5>4.56%</h5>
</div>
</div>
 </div>
<canvas id="tot-lead" height="150"></canvas>
</div>
</div>
<div class="col-xl-4 col-md-6">
<div class="card">
<div class="card-header">
<h5>Total Vendors</h5>
<div class="card-header-right">
<ul class="list-unstyled card-option">
<li><i class="fa fa fa-wrench open-card-option"></i></li>
<li><i class="fa fa-window-maximize full-card"></i></li>
<li><i class="fa fa-minus minimize-card"></i></li>
<li><i class="fa fa-refresh reload-card"></i></li>
<li><i class="fa fa-trash close-card"></i></li>
</ul>
</div>
</div>
<div class="card-block">
<p class="text-c-pink f-w-500"><i class="feather icon-chevrons-down m-r-15"></i> 24% High than last month</p>
<div class="row">
<div class="col-4 b-r-default">
<p class="text-muted m-b-5">Overall</p>
<h5>68.52%</h5>
</div>
<div class="col-4 b-r-default">
<p class="text-muted m-b-5">Monthly</p>
<h5>28.90%</h5>
</div>
<div class="col-4">
<p class="text-muted m-b-5">Day</p>
<h5>13.50%</h5>
</div>
</div>
</div>
<canvas id="tot-vendor" height="150"></canvas>
</div>
</div>
<div class="col-xl-4 col-md-12">
<div class="card">
<div class="card-header">
<h5>Invoice Generate</h5>
<div class="card-header-right">
<ul class="list-unstyled card-option">
<li><i class="fa fa fa-wrench open-card-option"></i></li>
<li><i class="fa fa-window-maximize full-card"></i></li>
<li><i class="fa fa-minus minimize-card"></i></li>
 <li><i class="fa fa-refresh reload-card"></i></li>
<li><i class="fa fa-trash close-card"></i></li>
</ul>
</div>
</div>
<div class="card-block">
<p class="text-c-green f-w-500"><i class="feather icon-chevrons-up m-r-15"></i> 20% High than last month</p>
<div class="row">
<div class="col-4 b-r-default">
<p class="text-muted m-b-5">Overall</p>
<h5>68.52%</h5>
</div>
<div class="col-4 b-r-default">
<p class="text-muted m-b-5">Monthly</p>
<h5>28.90%</h5>
</div>
<div class="col-4">
<p class="text-muted m-b-5">Day</p>
<h5>13.50%</h5>
</div>
</div>
</div>
<canvas id="invoice-gen" height="150"></canvas>
</div>
</div>


<div class="col-xl-6 col-md-12">
<div class="card table-card">
<div class="card-header">
<h5>Recent Tickets</h5>
<div class="card-header-right">
<ul class="list-unstyled card-option">
<li><i class="fa fa fa-wrench open-card-option"></i></li>
<li><i class="fa fa-window-maximize full-card"></i></li>
<li><i class="fa fa-minus minimize-card"></i></li>
<li><i class="fa fa-refresh reload-card"></i></li>
<li><i class="fa fa-trash close-card"></i></li>
</ul>
</div>
</div>
<div class="card-block">
<div class="table-responsive">
<table class="table table-hover table-borderless">
<thead>
<tr>
<th>Status</th>
<th>Subject</th>
 <th>Department</th>
<th>Date</th>
</tr>
</thead>
<tbody>
<tr>
<td><label class="label label-success">open</label></td>
<td>Website down for one week</td>
<td>Support</td>
<td>Today 2:00</td>
</tr>
<tr>
<td><label class="label label-primary">progress</label></td>
<td>Loosing control on server</td>
<td>Support</td>
<td>Yesterday</td>
</tr>
<tr>
<td><label class="label label-danger">closed</label></td>
<td>Authorizations keys</td>
<td>Support</td>
<td>27, Aug</td>
</tr>
<tr>
<td><label class="label label-success">open</label></td>
<td>Restoring default settings</td>
<td>Support</td>
<td>Today 9:00</td>
</tr>
<tr>
<td><label class="label label-primary">progress</label></td>
<td>Loosing control on server</td>
<td>Support</td>
<td>Yesterday</td>
</tr>
<tr>
<td><label class="label label-success">open</label></td>
<td>Restoring default settings</td>
<td>Support</td>
<td>Today 9:00</td>
</tr>
<tr>
<td><label class="label label-danger">closed</label></td>
<td>Authorizations keys</td>
<td>Support</td>
<td>27, Aug</td>
</tr>
<tr>
<td><label class="label label-success">open</label></td>
<td>Restoring default settings</td>
<td>Support</td>
<td>Today 9:00</td>
</tr>
<tr>
<td><label class="label label-primary">progress</label></td>
<td>Loosing control on server</td>
<td>Support</td>
<td>Yesterday</td>
</tr>
</tbody>
</table>
<div class="text-right m-r-20">
<a href="#!" class=" b-b-primary text-primary">View all Projects</a>
</div>
</div>
</div>
</div>
</div>
<div class="col-xl-6 col-md-12">
<div class="card latest-update-card">
<div class="card-header">
<h5>Latest Updates</h5>
<div class="card-header-right">
<ul class="list-unstyled card-option">
<li><i class="fa fa fa-wrench open-card-option"></i></li>
<li><i class="fa fa-window-maximize full-card"></i></li>
<li><i class="fa fa-minus minimize-card"></i></li>
<li><i class="fa fa-refresh reload-card"></i></li>
<li><i class="fa fa-trash close-card"></i></li>
</ul>
</div>
</div>
<div class="card-block">
<div class="latest-update-box">
<div class="row p-t-20 p-b-30">
<div class="col-auto text-right update-meta">
<p class="text-muted m-b-0 d-inline">2 hrs ago</p>
<i class="feather icon-twitter bg-info update-icon"></i>
</div>
 <div class="col">
<h6>+ 1652 Followers</h6>
<p class="text-muted m-b-0">You’re getting more and more followers, keep it up!</p>
</div>
</div>
<div class="row p-b-30">
<div class="col-auto text-right update-meta">
<p class="text-muted m-b-0 d-inline">4 hrs ago</p>
<i class="feather icon-briefcase bg-simple-c-pink update-icon"></i>
</div>
<div class="col">
<h6>+ 5 New Products were added!</h6>
<p class="text-muted m-b-0">Congratulations!</p>
</div>
</div>
<div class="row p-b-30">
<div class="col-auto text-right update-meta">
<p class="text-muted m-b-0 d-inline">1 day ago</p>
<i class="feather icon-check bg-simple-c-yellow  update-icon"></i>
</div>
<div class="col">
<h6>Database backup completed!</h6>
<p class="text-muted m-b-0">Download the <span class="text-c-blue">latest backup</span>.</p>
</div>
</div>
<div class="row p-b-0">
<div class="col-auto text-right update-meta">
<p class="text-muted m-b-0 d-inline">2 day ago</p>
<i class="feather icon-facebook bg-simple-c-green update-icon"></i>
</div>
<div class="col">
<h6>+2 Friend Requests</h6>
<p class="text-muted m-b-10">This is great, keep it up!</p>
<div class="table-responsive">
<table class="table table-hover">
<tr>
<td class="b-none">
<a href="#!" class="align-middle">
<img src="../../files/assets/images/avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
<div class="d-inline-block">
 <h6>Jeny William</h6>
<p class="text-muted m-b-0">Graphic Designer</p>
</div>
</a>
</td>
</tr>
<tr>
<td class="b-none">
<a href="#!" class="align-middle">
<img src="../../files/assets/images/avatar-1.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
<div class="d-inline-block">
<h6>John Deo</h6>
<p class="text-muted m-b-0">Web Designer</p>
</div>
</a>
</td>
</tr>
</table>
</div>
</div>
</div>
</div>
<div class="text-center">
<a href="#!" class="b-b-primary text-primary">View all Projects</a>
</div>
</div>
</div>
</div>


<div class="col-xl-8 col-md-12">
<div class="card latest-activity-card">
<div class="card-header">
<h5>Latest Activity</h5>
</div>
<div class="card-block">
<div class="latest-update-box">
<div class="row p-t-20 p-b-30">
<div class="col-auto text-right update-meta">
<p class="text-muted m-b-0 d-inline">just now</p>
<i class="feather icon-sunrise bg-simple-c-blue update-icon"></i>
</div>
<div class="col">
<h6>John Deo</h6>
<p class="text-muted m-b-15">The trip was an amazing and a life changing experience!!</p>
<img src="../../files/assets/images/mega-menu/01.jpg" alt="" class="img-fluid img-100 m-r-15 m-b-10">
<img src="../../files/assets/images/mega-menu/03.jpg" alt="" class="img-fluid img-100 m-r-15 m-b-10">
</div>
</div>
<div class="row p-b-30">
<div class="col-auto text-right update-meta">
<p class="text-muted m-b-0 d-inline">5 min ago</p>
<i class="feather icon-file-text bg-simple-c-blue update-icon"></i>
</div>
<div class="col">
<h6>Administrator</h6>
<p class="text-muted m-b-0">Free courses for all our customers at A1 Conference Room - 9:00 am tomorrow!</p>
</div>
</div>
<div class="row p-b-30">
<div class="col-auto text-right update-meta">
<p class="text-muted m-b-0 d-inline">3 hours ago</p>
<i class="feather icon-map-pin bg-simple-c-blue update-icon"></i>
</div>
<div class="col">
<h6>Jeny William</h6>
<p class="text-muted m-b-15">Happy Hour! Free drinks at <span class="text-c-blue">Cafe-Bar all </span>day long!</p>
<div id="markers-map" style="height:200px;width:100%"></div>
</div>
</div>
</div>
<div class="text-right">
<a href="#!" class=" b-b-primary text-primary">View all Activity</a>
</div>
</div>
</div>
</div>
<div class="col-xl-4 col-md-12">
<div class="card per-task-card">
<div class="card-header">
<h5>Your Tasks</h5>
</div>
<div class="card-block">
<div class="row per-task-block text-center">
<div class="col-6">
<div data-label="45%" class="radial-bar radial-bar-45 radial-bar-lg radial-bar-primary"></div>
<h6 class="text-muted">Finished</h6>
<p class="text-muted">642</p>
<button class="btn btn-primary btn-round btn-sm">Manage</button>
</div>
<div class="col-6">
<div data-label="30%" class="radial-bar radial-bar-30 radial-bar-lg radial-bar-primary"></div>
<h6 class="text-muted">Remaining</h6>
<p class="text-muted">495</p>
<button class="btn btn-primary btn-outline-primary btn-round btn-sm">Manage</button>
</div>
</div>
</div>
</div>
<div class="card feed-card">
<div class="card-header">
<h5>Upcoming Deadlines</h5>
<div class="card-header-right">
<ul class="list-unstyled card-option">
<li><i class="fa fa fa-wrench open-card-option"></i></li>
<li><i class="fa fa-window-maximize full-card"></i></li>
<li><i class="fa fa-minus minimize-card"></i></li>
<li><i class="fa fa-refresh reload-card"></i></li>
<li><i class="fa fa-trash close-card"></i></li>
</ul>
</div>
</div>
<div class="card-block">
<div class="row m-b-25">
<div class="col-auto p-r-0">
<img src="../../files/assets/images/mega-menu/01.jpg" alt="" class="img-fluid img-50">
</div>
<div class="col">
<h6 class="m-b-5">New able - Redesign</h6>
<p class="text-c-pink m-b-0">2 Days Remaining</p>
</div>
</div>
<div class="row m-b-25">
<div class="col-auto p-r-0">
<img src="../../files/assets/images/mega-menu/02.jpg" alt="" class="img-fluid img-50">
</div>
<div class="col">
<h6 class="m-b-5">New Admin Dashboard</h6>
<p class="text-c-pink m-b-0">Proposal in 6 Days</p>
</div>
</div>
 <div class="row m-b-25">
<div class="col-auto p-r-0">
<img src="../../files/assets/images/mega-menu/03.jpg" alt="" class="img-fluid img-50">
</div>
<div class="col">
<h6 class="m-b-5">Logo Design</h6>
<p class="text-c-green m-b-0">10 Days Remaining</p>
</div>
</div>
<div class="text-center">
<a href="#!" class="b-b-primary text-primary">View all Feeds</a>
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
<script src="../../files/rocket-loader.min.js" data-cf-settings="960c3b30522fb895a4c59633-|49" defer=""></script></body>

<!-- Mirrored from colorlib.com//polygon/adminty/default/dashboard-crm.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:45:54 GMT -->
</html>
