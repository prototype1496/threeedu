<link href="../../lib/Toast/jquery.toast.min.css" rel="stylesheet" type="text/css"/>
<script src="../../lib/grid/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="../../lib/Toast/alerts.js" type="text/javascript"></script>
<script src="../../lib/Toast/jquery.toast.min.js" type="text/javascript"></script>
<?php
require '../../controller/super/SessionStart.php';
include '../../model/SuperModel.php';
include '../../db_connection/dbconfig.php';
include '../../controller/super/MaterController.php';

$tenant_id = $_SESSION['threeedu_tenantid'];
$school_id = $_SESSION['threeedu_schoolid'];
$get_departments = SuperModel::get_departments_school_id($school_id);
?>
<?php ?>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from colorlib.com//polygon/adminty/default/dashboard-crm.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:45:47 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <head>
        <title>Department Master</title>


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
                                                <!--    -->
                                                <form  enctype="multipart/form-data"   method="POST" action="departmentmaster.php" >

                                                    <button name="btn_depatment_master" type="submit" style="float: right;"   class="btn btn-warning btn-round">Submit</button><br><br><br>

                                                    <div class="row">

                                                        <div class="col-sm-12">
                                                            <div class="card">
                                                                <div class="card-header  text-white" style="background-color: #FE9365; margin-bottom: 20px;">


                                                                    <div class="row align-items-end ">
                                                                        <div class="col-lg-8">
                                                                            <div class="">
                                                                                <div class="">

                                                                                    Department Master
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4">
                                                                            <div class="page-header-breadcrumb">
                                                                                <ul class="breadcrumb-title">


                                                                                    <li class="breadcrumb-item">
                                                                                        / Master / Department Model
                                                                                    </li>
                                                                                </ul>
                                                                            </div>

                                                                        </div>

                                                                    </div>



                                                                </div>
                                                                <div class="card-block">


                                                                    <div class="row">

                                                                        <div class="col-sm-12">
                                                                            <div class="card">

                                                                                <div class="card-block">






                                                                                    <div class="row">
                                                                                        <div class="col-sm-12">
                                                                                            <div class="">






                                                                                                <div class="col-md-12">
                                                                                                    <div class="">
                                                                                                        <div class="table-responsive">
                                                                                                            <table class="table table-striped table-bordered" id="edu_example-3">
                                                                                                                <thead>
                                                                                                                    <tr>
                                                                                                                    
                                                                                                                        <th>Department Name</th>

<!--                                                                                                                        <th>Department Short Name</th>-->
                                                                                                                        <th>Actions</th>
                                                                                                                    </tr>
                                                                                                                </thead>
                                                                                                                <tbody>

                                                                                                                    <?php while ($data = $get_departments->fetch(PDO::FETCH_ASSOC)) { ?> 
                                                                                                                        <tr>
                                                                                                                            
                                                                                                                             
                                                                                                                            
                                                                                                                           
<!--                                                                                                                            <td>
                                                                                                                               
                                                                                                                                <input  id="txt_data_shortname" value="<?php echo $data['ShortHand']; ?>" type="text" name="department_shortname[]" /> 
                                                                                                                                
                                                                                                                            </td>-->
                                                                                                                                  <td>
                                                                                                                                 <?php echo $data['DepartmentName'] ?>
                                                                                                                                <input  id="txt_data_name" value="<?php echo $data['DepartmentName']; ?>" type="hidden" name="grade_name[]" /> 
                                                                                                                                <input  value="<?php echo $data['DepartmentID']; ?>" type="hidden" name="grade_public_id[]"  />
                                                                                                                            </td>
                                                                                                                            
                                                                                                                            <td>  <input type="checkbox"  name="chk_subject" value="1" checked>&nbsp;&nbsp;
                                                                                                                                <a class="add" title="Add" data-toggle="tooltip" id="0"><i class="fa fa-user-plus"></i></a>
                                                                                                                                <a class="edit" title="Edit" data-toggle="tooltip" id="1"><i class="fa fa-pencil"></i></a>

                                                                                                                            </td>

                                                                                                                        </tr>
<?php } ?> 

                                                                                                                </tbody>
                                                                                                            </table>
                                                                                                        </div>

                                                                                                        <button type="button" class="btn btn-primary waves-effect waves-light add-new"><i class="fa fa-plus"></i> Add New</button>
                                                                                                    </div>

                                                                                                </div>






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
                                    </div>



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




                                    <!--      script for grid-->
                                    <script src="../../lib/grid/grid_department_master.js" type="text/javascript"></script>
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







                                    <script src="../../files/rocket-loader.min.js" data-cf-settings="960c3b30522fb895a4c59633-|49" defer=""></script></body>

                                    <!-- Mirrored from colorlib.com//polygon/adminty/default/dashboard-crm.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:45:54 GMT -->
                                    </html>


                                    <!--This is donne becasue of the notification java script-->
