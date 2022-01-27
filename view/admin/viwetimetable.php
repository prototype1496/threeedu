<?php
require '../../controller/super/SessionStart.php';
require_once '../../db_connection/dbconfig.php';
require_once '../../model/TeacherModel.php';
require_once '../../model/SuperModel.php';
$tenant_id = $_SESSION['threeedu_tenantid'];
$stm = TeacherModel::get_all_student_details($tenant_id);

$classes = SuperModel::get_all_classes_with_mapped_subjects($tenant_id);
$classmaster_id = "";
$monday = array();
$tuesday = array();
$wednsday = array();
$thursday = array();
$friday = array();
$periods = array();
if (isset($_GET['classmasterid'])) {
    $classmaster_id = trim(filter_input(INPUT_GET, 'classmasterid', FILTER_DEFAULT));
    $get_timtable_data = SuperModel::get_timtable($classmaster_id);

    $classname = SuperModel::get_class_name($classmaster_id);

    while ($row = $get_timtable_data->fetch(PDO::FETCH_ASSOC)) {
        array_push($monday, $row['SubjectCodeM']);
        array_push($tuesday, $row['SubjectCodeT']);
        array_push($wednsday, $row['SubjectCodeW']);
        array_push($thursday, $row['SubjectCodeTH']);
        array_push($friday, $row['SubjectCodeF']);
        array_push($periods, $row['PeriodName']);
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
                                                                                <hr>    
                                                                                <div class="col-sm-12">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-12 col-xl-3 m-b-30">

                                                                                            <form action="../../controller/super/ActionPerformed.php" method="POST" >
                                                                                                <select id="selected_class_id" onchange="" required="" name="classid" class="js-example-data-array col-sm-4">
                                                                                                    <option value="" disabled="disabled" selected="selected" >Select Class</option>
                                                                                                    <?php
                                                                                                    while ($row = $classes->fetch(PDO::FETCH_ASSOC)) {
                                                                                                        ?>
                                                                                                        <option value="<?php echo $row['ClassMasterPublicID']; ?>"><?php echo $row['Class']; ?></option>

                                                                                                    <?php } ?>
                                                                                                </select>
                                                                                        </div>
                                                                                        <div class="col-sm-12 col-xl-3 m-b-30">
                                                                                            <button class="btn btn-info" type="submit" name="btn_load_time_table_admin">Load Time Table</button>

                                                                                        </div>
                                                                                        </form>

                                                                                    </div>

                                                                                </div>

                                                                                <div class="card">
                                                                                    <?php if (isset($classname)) {
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
                                                                                                            <th></th>
                                                                                                        </tr>


                                                                                                        <tr>

                                                                                                            <td  class="text-c-yellow" bgcolor="47706a" style="font-size: 20px; font-weight: bold;" >Monday</td>
                                                                                                            <?php foreach ($monday as $key => $value) {
                                                                                                                ?>
                                                                                                                <td><?php echo $value ?></td>

                                                                                                            <?php } ?>

                                                                                                            <td> <button onclick="redirectWithID('<?php echo $classmaster_id; ?>', 'Monday')" style="padding: 1px 5px; font-size: 12px; line-height: 1.5; border-radius: 3px;" class="btn btn-info"><i class="feather icon-edit"></i></button>
                                                                                                            </td>
                                                                                                        </tr>


                                                                                                        <tr>

                                                                                                            <td  class="text-c-yellow" bgcolor="47706a" style="font-size: 20px; font-weight: bold;" >Tuesday</td>
                                                                                                            <?php foreach ($tuesday as $key => $value) {
                                                                                                                ?>
                                                                                                                <td><?php echo $value ?></td>

                                                                                                            <?php } ?>
                                                                                                            <td> <button onclick="redirectWithID('<?php echo $classmaster_id; ?>', 'Tuesday')" style="padding: 1px 5px; font-size: 12px; line-height: 1.5; border-radius: 3px;" class="btn btn-info"><i class="feather icon-edit"></i></button>
                                                                                                            </td>
                                                                                                        </tr>



                                                                                                        <tr>

                                                                                                            <td  class="text-c-yellow" bgcolor="47706a" style="font-size: 20px; font-weight: bold;" >Wednesday</td>
                                                                                                            <?php foreach ($wednsday as $key => $value) {
                                                                                                                ?>
                                                                                                                <td><?php echo $value ?></td>

                                                                                                            <?php } ?>
                                                                                                            <td> <button onclick="redirectWithID('<?php echo $classmaster_id; ?>', 'Wednesday')" style="padding: 1px 5px; font-size: 12px; line-height: 1.5; border-radius: 3px;" class="btn btn-info"><i class="feather icon-edit"></i></button>
                                                                                                            </td>
                                                                                                        </tr>



                                                                                                        <tr>

                                                                                                            <td  class="text-c-yellow" bgcolor="47706a" style="font-size: 20px; font-weight: bold;" >Thursday </td>
                                                                                                            <?php foreach ($thursday as $key => $value) {
                                                                                                                ?>
                                                                                                                <td><?php echo $value ?></td>

                                                                                                            <?php } ?>
                                                                                                            <td> <button onclick="redirectWithID('<?php echo $classmaster_id; ?>', 'Thursday')" style="padding: 1px 5px; font-size: 12px; line-height: 1.5; border-radius: 3px;" class="btn btn-info"><i class="feather icon-edit"></i></button>
                                                                                                            </td>
                                                                                                        </tr>



                                                                                                        <tr>

                                                                                                            <td  class="text-c-yellow" bgcolor="47706a" style="font-size: 20px; font-weight: bold;" >Friday</td>
                                                                                                            <?php foreach ($friday as $key => $value) {
                                                                                                                ?>
                                                                                                                <td><?php echo $value ?></td>

                                                                                                            <?php } ?>
                                                                                                            <td> <button onclick="redirectWithID('<?php echo $classmaster_id; ?>', 'Friday')" style="padding: 1px 5px; font-size: 12px; line-height: 1.5; border-radius: 3px;" class="btn btn-info"><i class="feather icon-edit"></i></button>
                                                                                                            </td>
                                                                                                        </tr>

                                                                                                    </thead>

                                                                                                </table>
                                                                                            </div>
                                                                                        </div>

                                                                                    <?php } else { ?>

                                                                                        <center>  <h5><b>Please Select Class<b></h5>
                                                                                                        <img src="../../img/timetable.png"/></center>

                                                                                                    <?php } ?>
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
                                                                                                                function redirectWithID(id, day) {
                                                                                                                    window.location.href = "/threeedu/view/admin/edittimetable.php?id=" + id + "&&day=" + day;

                                                                                                                }
                                                                                                    </script>
                                                                                                    <script src="../../files/rocket-loader.min.js" data-cf-settings="028b4b5e88a856df25e89945-|49" defer=""></script></body>

                                                                                                    <!-- Mirrored from colorlib.com//polygon/adminty/default/dt-ext-buttons-html-5-data-export.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:48:50 GMT -->
                                                                                                    </html>
