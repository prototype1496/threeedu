<?php 
require '../../controller/super/SessionStart.php'; 
require '../../db_connection/dbconfig.php'; 
require '../../model/SuperModel.php'; 

$student_no = trim(filter_input(INPUT_GET, 'id', FILTER_DEFAULT));

$row = SuperModel::get_student_details_by_student_no($student_no);


if (isset($row['PublicID'])){

      $student_public_id =   trim($row['StudentMasterPublicID']);
$student_data = SuperModel::get_all_transaction_history($student_public_id);

}else{
  $student_data = SuperModel::get_all_transaction_history('');  
    
}

?>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from colorlib.com//polygon/adminty/default/dashboard-crm.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:45:47 GMT -->
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

<link rel="stylesheet" href="../../files/assets/pages/chart/radial/css/radial.css" type="text/css" media="all">

<link rel="stylesheet" type="text/css" href="../../files/assets/icon/feather/css/feather.css">


<link rel="stylesheet" type="text/css" href="../../files/bower_components/ekko-lightbox/css/ekko-lightbox.css">
<link rel="stylesheet" type="text/css" href="../../files/bower_components/lightbox2/css/lightbox.css">

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
                    
                    <?php if ($student_no == "" || !isset($student_no)){
                        
                             echo '<center><h1><b>Student profile inactive<b> </h1></center>';
                        
                    }else { ?>
                    

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">

                                <div class="card-block">

                                    <div class="form">
                                        <div>
                                            <h4>Student Profile</h4>
                                        </div>
                                        <br />
                                    </div>



                                    <div class="row">

                                        <div class="col-md-6">
                                            <div class="form-group">

                                                <div>
                                                    <a href="<?php echo $row['ProfilePic'] ; ?>" data-lightbox="roadtrip" class="profile-image" >
                                                    <img src="<?php echo $row['ProfilePic'] ; ?>" class="img-circle" alt="Cinque Terre" width="200" height="200" />
                                                    </a>
                                                </div>
                                                <br />

                                                <br />
                                                <br />
                                                <br />
                                                <h1 style="color:purple; font-family: verdana; font-size: 140%; "> <?php echo $row['Name'] ; ?></h1>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">


                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div>
                                                            <p> </p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div>
                                                            <div class="form-group">
                                                                <H4 class="text-c-blue">Student ID</H4>
                                                                <h1 style="color:maroon; font-family: 'Times New Roman'; font-size: 120%; "><?php echo $row['PublicID'] ; ?></h1>

                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>



                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <dt>
                                                            <p class="text-right">Grade</p>
                                                        </dt>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div>
                                                            <?php echo $row['ClassName'] ; ?>
                                                        </div>
                                                    </div>
                                                </div>





                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <dt>
                                                            <p class="text-right">Gender</p>
                                                        </dt>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div>
                                                            <?php echo $row['Gender'] ; ?>

                                                        </div>
                                                    </div>
                                                </div>





                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <dt>
                                                            <p class="text-right">Date Of Birth</p>
                                                        </dt>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div>
                                                            <?php echo $row['DOB'] ; ?>

                                                        </div>
                                                    </div>
                                                </div>






                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <dt>
                                                            <p class="text-right">Father's Names</p>
                                                        </dt>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div>
                                                           <?php echo $row['GuardianMaleName'] ; ?>

                                                        </div>
                                                    </div>
                                                </div>



                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <dt>
                                                            <p class="text-right">Mother's Names</p>
                                                        </dt>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div>
                                                           <?php echo $row['GuardianFemaleName'] ; ?>

                                                        </div>
                                                    </div>
                                                </div>



                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <dt>
                                                            <p class="text-right">Phone Number</p>
                                                        </dt>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div>
                                                            <?php echo $row['ContactNo'] ; ?>

                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                 <div class="row">
                                                    <div class="col-md-6">
                                                        <dt>
                                                            <p class="text-right">Email Address</p>
                                                        </dt>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div>
                                                            <?php echo $row['EmailAddress'] ; ?>

                                                        </div>
                                                    </div>
                                                </div>




                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <dt>
                                                            <p class="text-right">Address</p>
                                                        </dt>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="text-c-orenge">
                                                           <?php echo $row['Address'] ; ?>

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




                    <div class="row">
                        <div class="col-md-6">
                           
                               
                              
                               
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5>Academic Performance Panel</h5>
                                                        
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="feather icon-maximize full-card"></i></li>
                                                                <li><i class="feather icon-minus minimize-card"></i></li>
                                                               
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <div id="sales-analytics" style="height: 265px;"></div>
                                                    </div>
                                                </div>
                                            
                                
                                
                            
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                                
                               
                               
                                    <div class="card-block contact-details">
                                        <center> <h4>Payment Details Panel</h4></center>
<div class="data_table_main table-responsive dt-responsive">

 <table id="simpletable2" class="table  table-striped table-bordered nowrap">
<thead>
<tr>
     <th>Amount Paid</th>
     <th>Balance</th>
<th>Date Paid</th>


</tr>
</thead>
<tbody>
    <?php
while ($row = $student_data->fetch(PDO::FETCH_ASSOC)) {

    ?>
    <tr>
          <td></td>
      
        <td><?php echo $row['PaidAmout']; ?></td>
        <td><?php echo $row['Balace']; ?></td>
     
         
            <td><?php echo $row['BilledOn']; ?></td>
         

    </tr>

<?php } ?>



</tbody>
<tfoot>
<tr>
      <th>Amount Paid</th>
     <th>Balance</th>
<th>Date Paid</th>

</tr>
</tfoot>
</table>   
    
    
    
</div>
</div>

                            </div>
                        </div>

                    </div>

                    <div class="card borderless-card">
                        <div class="card-block info-breadcrumb">
                            <div class="breadcrumb-header">
                                <h5>Books Borrowed</h5>
                                <span>O</span>
                            </div>


                            <div>
                               none
                            </div>


                            <div class="page-header-breadcrumb">
                                <ul class="breadcrumb-title">
                                    <li class="breadcrumb-item">
                                        <a href="#!">
                                            <i class="icofont icofont-home"></i>
                                        </a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="#!">Breadcrumb</a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="#!">Caption Breadcrumb</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <?php }?>
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


<script type="960c3b30522fb895a4c59633-text/javascript" src="../../files/bower_components/ekko-lightbox/js/ekko-lightbox.js"></script>
<script type="960c3b30522fb895a4c59633-text/javascript" src="../../files/bower_components/lightbox2/js/lightbox.js"></script>

<script src="../../files/assets/pages/widget/gauge/gauge.min.js" type="960c3b30522fb895a4c59633-text/javascript"></script>
<script src="../../files/assets/pages/widget/amchart/amcharts.js" type="960c3b30522fb895a4c59633-text/javascript"></script>
<script src="../../files/assets/pages/widget/amchart/serial.js" type="960c3b30522fb895a4c59633-text/javascript"></script>
<script src="../../files/assets/pages/widget/amchart/gauge.js" type="960c3b30522fb895a4c59633-text/javascript"></script>
<script src="../../files/assets/pages/widget/amchart/pie.js" type="960c3b30522fb895a4c59633-text/javascript"></script>
<script src="../../files/assets/pages/widget/amchart/light.js" type="960c3b30522fb895a4c59633-text/javascript"></script>
 <script src="../files/assets/js/jquery.mCustomScrollbar.concat.min.js" type="960c3b30522fb895a4c59633-text/javascript"></script>

<script src="../../files/assets/js/pcoded.min.js" type="960c3b30522fb895a4c59633-text/javascript"></script>
<script src="../../files/assets/js/vartical-layout.min.js" type="960c3b30522fb895a4c59633-text/javascript"></script>


 <script type="960c3b30522fb895a4c59633-text/javascript" src="../../files/assets/pages/dashboard/custom-dashboard.js"></script>
 
 
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
