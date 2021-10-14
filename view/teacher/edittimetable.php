<?php
require '../../controller/super/SessionStart.php';

require_once '../../db_connection/dbconfig.php';
require_once '../../model/TeacherModel.php';
require_once '../../model/SuperModel.php';
$tenant_id = $_SESSION['threeedu_tenantid'];
$school_id = $_SESSION['threeedu_schoolid'];
$stm = TeacherModel::get_all_student_details($tenant_id);

$classmaster_id = "";
$period_ids = array();
$subjects_arry = array();
$periods = array();
$monday = array();
$tuesday = array();
$wednsday = array();
$thursday = array();
$friday = array();
$periods = array();
if (isset($_GET['id']) && isset($_GET['day'])) {

    $day_of_week = $_GET['day'];
    $classmaster_id = trim(filter_input(INPUT_GET, 'id', FILTER_DEFAULT));

    $subjects = SuperModel::get_subjects_by_class_id($classmaster_id,$school_id);

    while ($row = $subjects->fetch(PDO::FETCH_ASSOC)) {
        $subjects_arry[$row['SujectCode']] = $row['SubjectName'];
    }


    $get_timtable_data = SuperModel::get_timtable($classmaster_id);
    $cunt = 0;
    while ($row = $get_timtable_data->fetch(PDO::FETCH_ASSOC)) {
        // array_push($monday[],$row['Monday']);
        $cunt++;
        $periods[$row['Monday'] . $cunt] = $row['PeriodName'];
        $monday[$row['Monday'] . $cunt] = $row['SubjectCodeM'];
        $period_ids[$row['Monday'] . $cunt] = $row['TimeTableDetailsID'];

        $periods[$row['Tuesday'] . $cunt] = $row['PeriodName'];
        $tuesday[$row['Tuesday'] . $cunt] = $row['SubjectCodeT'];
        $period_ids[$row['Tuesday'] . $cunt] = $row['TimeTableDetailsID'];

        $periods[$row['Wednesday'] . $cunt] = $row['PeriodName'];
        $wednsday[$row['Wednesday'] . $cunt] = $row['SubjectCodeW'];
        $period_ids[$row['Wednesday'] . $cunt] = $row['TimeTableDetailsID'];

        $periods[$row['Thursday'] . $cunt] = $row['PeriodName'];
        $thursday[$row['Thursday'] . $cunt] = $row['SubjectCodeTH'];
        $period_ids[$row['Thursday'] . $cunt] = $row['TimeTableDetailsID'];

        $periods[$row['Friday'] . $cunt] = $row['PeriodName'];
        $friday[$row['Friday'] . $cunt] = $row['SubjectCodeF'];
        $period_ids[$row['Friday'] . $cunt] = $row['TimeTableDetailsID'];
    }
} else {
    
}
?>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from colorlib.com//polygon/adminty/default/dt-ext-buttons-html-5-data-export.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:48:50 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <head>
        <title>Time Table</title>


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

        <link rel="stylesheet" type="text/css" href="../../files/assets/icon/themify-icons/themify-icons.css">

        <link rel="stylesheet" type="text/css" href="../../files/assets/icon/icofont/css/icofont.css">

        <link rel="stylesheet" type="text/css" href="../../files/assets/icon/feather/css/feather.css">

        <link rel="stylesheet" type="text/css" href="../../files/bower_components/datatables.net-bs4/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="../../files/assets/pages/data-table/css/buttons.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="../../files/bower_components/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="../../files/assets/pages/data-table/extensions/buttons/css/buttons.dataTables.min.css">

        <link rel="stylesheet" type="text/css" href="../../files/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="../../files/assets/css/jquery.mCustomScrollbar.css">
        <link rel="stylesheet" href="../../files/bower_components/select2/css/select2.min.css" />
        <link rel="stylesheet" type="text/css" href="../../files/assets/css/style.css">
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
<?php require'./navbar.php'; ?>
                <!--nva bar end  -->




                <div class="pcoded-main-container">
                    <div class="pcoded-wrapper">



                        <!--side bar start  -->
    <!--side bar start  -->
<?php require './sidbar.php'; ?>
<!--side bar end  --> 
                        <!--side bar end  --> 

                        <div class="pcoded-content">
                            <div class="pcoded-inner-content">

                                <div class="main-body">
                                    <div class="page-wrapper">

                                        <div class="page-header">
                                            <div class="row align-items-end">
                                                <div class="col-lg-8">


                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="page-body">
                                        <div class="row">
                                            <div class="col-sm-12">



                                                <div class="">
                                                    <div class="">
                                                        <div class="main-body">
                                                            <div class="page-wrapper">

                                                                <div class="page-body">
                                                                    <div class="row">
                                                                        <div class="col-sm-12">
                                                                            <div class="card">

                                                                                <div class="card">

                                                                                    <div class="card-block warning-breadcrumb">
                                                                                        <div class="breadcrumb-header">
                                                                                            <h5>Edit TimeTable</h5>

                                                                                        </div>
                                                                                        <div class="page-header-breadcrumb">
                                                                                            <ul class="breadcrumb-title">
                                                                                                <li class="breadcrumb-item">
                                                                                                    <a href="#!">
                                                                                                        <i class="icofont icofont-home"></i>
                                                                                                    </a>
                                                                                                </li>
                                                                                                <li class="breadcrumb-item">
                                                                                                    <span>Time Table</span>
                                                                                                </li>
                                                                                                <li class="breadcrumb-item">
                                                                                                    <a href="#!">TimeTable Model</a>
                                                                                                </li>
                                                                                            </ul>
                                                                                        </div>
                                                                                    </div>

                                                                                </div>
                                                                                <div class="card-block">
                                                                                    <div class="form">
                                                                                        <div class="row">



                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">

                                                                                                    <div>
                                                                                                        <h1 style="color:maroon; font-family: 'Times New Roman'; font-size: 180%; ">
                                                                                                     <?PHP echo $day_of_week; ?>
                                                                                                        </h1>

                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>


                                                                                        </div>



                                                                                        <form action="../../controller/admin/ActionPerformed.php" method="POST" >

                                                                                            <input type="hidden" name="day_of_week" value="<?php echo $day_of_week; ?>"/>
                                                                                            <input type="hidden" name="class_master_id" value="<?php echo $classmaster_id; ?>"/>

                                                                                            <div class="col-sm-12">
                                                                                                <div class="row">
                                                                                                    <?php
                                                                                                    if ($day_of_week == 'Monday') {



                                                                                                        foreach ($monday as $key => $value) {
                                                                                                            ?>
                                                                                                                    <div class="col-sm-6">
                                                                                                                <input type="hidden" name="timtable_deatails_id[]" value="<?php echo $period_ids[$key]; ?>"/>
                                                                                                                <label class="label-form"><b><?php echo $periods[$key]; ?></b></label>
                                                                                                                <div class="form-group">
                                                                                                                    <select name="subject_code[]" onchange="" name="classid" class="js-example-data-array col-sm-4">
                                                                                                                        <option value="<?PHP echo substr($key, 0, -1); ?>"   selected="selected" ><?PHP echo $value; ?></option>
                                                                                                                        <option value=""   >Free Period</option>
                                                                                                            <?php
                                                                                                            foreach ($subjects_arry as $key => $value) {
                                                                                                                ?>
                                                                                                                            <option value="<?php echo $key; ?>"><?php echo $value; ?></option>                      
                                                                                                            <?php }
                                                                                                            ?>

                                                                                                                    </select>
                                                                                                                </div>  
                                                                                                            </div>

                                                                                                    <?php
                                                                                                }
                                                                                            }

                                                                                            //Tusday
                                                                                            else if ($day_of_week == 'Tuesday') {



                                                                                                foreach ($tuesday as $key => $value) {
                                                                                                    ?>
                                                                                                            <div class="col-sm-6">
                                                                                                                <input type="hidden" name="timtable_deatails_id[]" value="<?php echo $period_ids[$key]; ?>"/>
                                                                                                                <label class="label-form"><b><?php echo $periods[$key]; ?></b></label>
                                                                                                                <div class="form-group">
                                                                                                                    <select id="" onchange=""  name="subject_code[]" class="js-example-data-array col-sm-4">
                                                                                                                        <option value="<?PHP echo substr($key, 0, -1); ?>"  selected="selected" ><?PHP echo $value; ?></option>
                                                                                                                        <option value=""   >Free Period</option>
                                                                                                            <?php
                                                                                                            foreach ($subjects_arry as $key => $value) {
                                                                                                                ?>
                                                                                                                            <option value="<?php echo$key; ?>"><?php echo $value; ?></option>                      
                                                                                                            <?php }
                                                                                                            ?>

                                                                                                                    </select>
                                                                                                                </div>  
                                                                                                            </div>

                                                                                                            <?php
                                                                                                        }
                                                                                                    }


                                                                                                    // This is wedniday start 
                                                                                                    else if ($day_of_week == 'Wednesday') {



                                                                                                        foreach ($wednsday as $key => $value) {
                                                                                                            ?>
                                                                                                            <div class="col-sm-6">
                                                                                                                <input type="hidden" name="timtable_deatails_id[]" value="<?php echo $period_ids[$key]; ?>"/>
                                                                                                                <label class="label-form"><b><?php echo $periods[$key]; ?></b></label>
                                                                                                                <div class="form-group">
                                                                                                                    <select id="" onchange=""  name="subject_code[]" class="js-example-data-array col-sm-4">
                                                                                                                        <option value="<?PHP echo substr($key, 0, -1); ?>"  selected="selected" ><?PHP echo $value; ?></option>
                                                                                                                         <option value=""   >Free Period</option>
                                                                                                            <?php
                                                                                                            foreach ($subjects_arry as $key => $value) {
                                                                                                                ?>
                                                                                                                            <option value="<?php echo$key; ?>"><?php echo $value; ?></option>                      
                                                                                                            <?php }
                                                                                                            ?>

                                                                                                                    </select>
                                                                                                                </div>  
                                                                                                            </div>

                                                                                                            <?php
                                                                                                        }
                                                                                                    }

                                                                                                    //This is thursday start 
                                                                                                    else if ($day_of_week == 'Thursday') {



                                                                                                        foreach ($thursday as $key => $value) {
                                                                                                            ?>
                                                                                                            <div class="col-sm-6">
                                                                                                                <input type="hidden" name="timtable_deatails_id[]" value="<?php echo $period_ids[$key]; ?>"/>
                                                                                                                <label class="label-form"><b><?php echo $periods[$key]; ?></b></label>
                                                                                                                <div class="form-group">
                                                                                                                    <select id="" onchange=""  name="subject_code[]" class="js-example-data-array col-sm-4">
                                                                                                                        <option value="<?PHP echo substr($key, 0, -1); ?>"  selected="selected" ><?PHP echo $value; ?></option>
                                                                                                                         <option value=""   >Free Period</option>
                                                                                                                <?php
                                                                                                                foreach ($subjects_arry as $key => $value) {
                                                                                                                    ?>
                                                                                                                            <option value="<?php echo$key; ?>"><?php echo $value; ?></option>                      
                                                                                                            <?php }
                                                                                                            ?>

                                                                                                                    </select>
                                                                                                                </div>  
                                                                                                            </div>

                                                                                                            <?php
                                                                                                        }
                                                                                                    }

                                                                                                    //This is friday Start 
                                                                                                    else if ($day_of_week == 'Friday') {



                                                                                                        foreach ($friday as $key => $value) {
                                                                                                            ?>
                                                                                                            <div class="col-sm-6">
                                                                                                                <input type="hidden" name="timtable_deatails_id[]" value="<?php echo $period_ids[$key]; ?>"/>
                                                                                                                <label class="label-form"><b><?php echo $periods[$key]; ?></b></label>
                                                                                                                <div class="form-group">
                                                                                                                    <select id="" onchange=""  name="subject_code[]" class="js-example-data-array col-sm-4">
                                                                                                                        <option value="<?PHP echo substr($key, 0, -1); ?>"  selected="selected" ><?PHP echo $value; ?></option>
                                                                                                                         <option value=""   >Free Period</option>
                                                                                                                        <?php
                                                                                                                        foreach ($subjects_arry as $key => $value) {
                                                                                                                            ?>
                                                                                                                            <option value="<?php echo$key; ?>"><?php echo $value; ?></option>                      
        <?php }
        ?>

                                                                                                                    </select>
                                                                                                                </div>  
                                                                                                            </div>

                                                                                                            <?php
                                                                                                        }
                                                                                                    }
                                                                                                    ?> 




                                                                                                </div>         </div>  

                                                                                            <div class="col-sm-6">
                                                                                                <input type="submit" name="btn_upadte_time_table" value="Update" class="btn btn-warning btn-round" />
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

                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>



<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/jquery/js/jquery.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/jquery-ui/js/jquery-ui.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/popper.js/js/popper.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/bootstrap/js/bootstrap.min.js"></script>

<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/jquery-slimscroll/js/jquery.slimscroll.js"></script>

<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/modernizr/js/modernizr.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/modernizr/js/css-scrollbars.js"></script>

<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/i18next/js/i18next.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/i18next-xhr-backend/js/i18nextXHRBackend.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/i18next-browser-languagedetector/js/i18nextBrowserLanguageDetector.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/jquery-i18next/js/jquery-i18next.min.js"></script>

<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/select2/js/select2.full.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/bootstrap-multiselect/js/bootstrap-multiselect.js">

</script>
<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/multiselect/js/jquery.multi-select.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/assets/js/jquery.quicksearch.js"></script>



<script src="../../files/bower_components/datatables.net/js/jquery.dataTables.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-buttons/js/dataTables.buttons.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/pages/data-table/js/jszip.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/pages/data-table/js/pdfmake.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/pages/data-table/js/vfs_fonts.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/pages/data-table/extensions/buttons/js/dataTables.buttons.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/pages/data-table/extensions/buttons/js/buttons.flash.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/pages/data-table/extensions/buttons/js/jszip.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/pages/data-table/extensions/buttons/js/vfs_fonts.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/pages/data-table/extensions/buttons/js/buttons.colVis.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-buttons/js/buttons.print.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-buttons/js/buttons.html5.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-bs4/js/dataTables.bootstrap4.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-responsive/js/dataTables.responsive.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>

<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/i18next/js/i18next.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/i18next-xhr-backend/js/i18nextXHRBackend.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/i18next-browser-languagedetector/js/i18nextBrowserLanguageDetector.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/jquery-i18next/js/jquery-i18next.min.js"></script>




<script src="../../js/RelaodTeacherAssecmentCombo.js" type="text/javascript"></script>

<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/assets/pages/advance-elements/select2-custom.js"></script>




<script src="../../files/assets/pages/data-table/extensions/buttons/js/extension-btns-custom.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/js/pcoded.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/js/vartical-layout.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/js/jquery.mCustomScrollbar.concat.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/assets/js/script.js"></script>




<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script type="028b4b5e88a856df25e89945-text/javascript">
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'UA-23581568-13');
</script>

<script>
    function redirectWithID(id) {
        window.location.href = "/threeedu/view/teacher/profile.php?id=" + id;

    }
</script>
<script src="../../files/rocket-loader.min.js" data-cf-settings="028b4b5e88a856df25e89945-|49" defer=""></script></body>

<!-- Mirrored from colorlib.com//polygon/adminty/default/dt-ext-buttons-html-5-data-export.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:48:50 GMT -->
</html>
