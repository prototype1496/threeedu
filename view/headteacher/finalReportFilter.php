<?php
require '../../controller/super/SessionStart.php';
require_once '../../db_connection/dbconfig.php';
require_once '../../model/TeacherModel.php';
require_once '../../model/SuperModel.php';

$tenant_id = $_SESSION['threeedu_tenantid'];
$school_id = $_SESSION['threeedu_schoolid'];
$stm = TeacherModel::get_all_student_details($tenant_id);
$classes = SuperModel::get_all_classes_by_tenant_id($tenant_id);

?>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from colorlib.com//polygon/adminty/default/dt-ext-buttons-html-5-data-export.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:48:50 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->
<head>
    <title>Final Report</title>
    <!--[if lt IE 10]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description" content="#">
    <meta name="keywords"
          content="Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="#">

    <link rel="icon" href="https://colorlib.com//polygon/adminty/files/assets/images/favicon.ico" type="image/x-icon">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="../../files/bower_components/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="../../files/assets/icon/themify-icons/themify-icons.css">

    <link rel="stylesheet" type="text/css" href="../../files/assets/icon/icofont/css/icofont.css">

    <link rel="stylesheet" type="text/css" href="../../files/assets/icon/feather/css/feather.css">

    <link rel="stylesheet" type="text/css"
          href="../../files/bower_components/datatables.net-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="../../files/assets/pages/data-table/css/buttons.dataTables.min.css">
    <link rel="stylesheet" type="text/css"
          href="../../files/bower_components/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css"
          href="../../files/assets/pages/data-table/extensions/buttons/css/buttons.dataTables.min.css">

    <link rel="stylesheet" type="text/css" href="../../files/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="../../files/assets/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="../../files/bower_components/select2/css/select2.min.css"/>
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
        <?php require './navbar.php'; ?>
        <!--nva bar end  -->
        <div class="pcoded-main-container">
            <div class="pcoded-wrapper">
                <!--side bar start  -->
                <?php require './sidbar.php'; ?>
                <!--side bar end  -->
                <div class="pcoded-content">
                    <div class="pcoded-inner-content">
                        <div class="main-body">
                            <div class="page-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="">
                                            <div class="">
                                                <div class="">
                                                    <div class="">

                                                        <div class="">
                                                            <div class="">
                                                                <div class="">
                                                                    <div class="">
                                                                        <div class="main-body">
                                                                            <div class="page-wrapper">
                                                                                <div class="page-body">
                                                                                    <div class="card">
                                                                                        <div class="card-block primary-breadcrumb">
                                                                                            <div class="breadcrumb-header">
                                                                                                <h5>Final Report
                                                                                                    Filter</h5>
                                                                                            </div>
                                                                                            <div class="page-header-breadcrumb">
                                                                                                <ul class="breadcrumb-title">
                                                                                                    <li class="breadcrumb-item">
                                                                                                        <a href="#!">
                                                                                                            <i class="icofont icofont-home"></i>
                                                                                                        </a>
                                                                                                    </li>
                                                                                                    <li class="breadcrumb-item">
                                                                                                        <span>Academics</span>
                                                                                                    </li>
                                                                                                    <li class="breadcrumb-item">
                                                                                                        <a href="#!">Report</a>
                                                                                                    </li>
                                                                                                </ul>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="card-block">
                                                                                            <div class="form">
                                                                                                <form method="POST"
                                                                                                      action="../../controller/pupil/PupilCommentsController.php"
                                                                                                >
                                                                                                    <div class="row">
                                                                                                        <hr>
                                                                                                        <div class="col-sm-12">
                                                                                                            <div class="row">

                                                                                                                <input type="hidden"
                                                                                                                       id="tenant_id"
                                                                                                                       name="tenant_id"
                                                                                                                       value="<?php echo $tenant_id; ?>"/>

                                                                                                                <div class="col-sm-12 col-xl-3 m-b-30">
                                                                                                                    <label for="selected_class_id">
                                                                                                                        Student
                                                                                                                        Name
                                                                                                                    </label>
                                                                                                                    <select id="selected_class_id"
                                                                                                                            required=""
                                                                                                                            name="publicId"
                                                                                                                            class="js-example-data-array col-sm-4">
                                                                                                                        <option value=""
                                                                                                                                disabled="disabled"
                                                                                                                                selected="selected">
                                                                                                                            Student
                                                                                                                            Name
                                                                                                                        </option>
                                                                                                                        <?php while ($row = $stm->fetch()) { ?>
                                                                                                                            <option value="<?php echo $row['StudentMasterPublicID']; ?>"><?php echo $row['PublicID']; ?></option>
                                                                                                                        <?php } ?>
                                                                                                                    </select>
                                                                                                                </div>
                                                                                                                <div
                                                                                                                     class="col-sm-12 col-xl-3 m-b-30">
                                                                                                                    <label for="term_id">Term</label>
                                                                                                                    <select id="term_id"
                                                                                                                            required
                                                                                                                            name="term_id"
                                                                                                                            class="js-example-data-array col-sm-4">
                                                                                                                    </select>
                                                                                                                </div>
                                                                                                                <div
                                                                                                                     class="col-sm-12 col-xl-3 m-b-30">
                                                                                                                    <label for="assessments">Assessments </label>
                                                                                                                    <select id="assessments"
                                                                                                                            required
                                                                                                                            name="assessments"
                                                                                                                            class="js-example-data-array col-sm-4">
                                                                                                                    </select>
                                                                                                                </div>
                                                                                                                <div
                                                                                                                        style="padding: 8px 30px 8px 30px;"
                                                                                                                        class="col-sm-12 col-xl-3 m-b-30">
                                                                                                                    <label for="datepicker">Date</label>
                                                                                                                    <input type="text"
                                                                                                                           required
                                                                                                                           id="datepicker"
                                                                                                                           name="date"
                                                                                                                           autocomplete="off"
                                                                                                                           class="form-control"
                                                                                                                           placeholder="date"/>
                                                                                                                </div>

                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <hr>
                                                                                                        <div class="col-md-2">
                                                                                                            <div class="form-group">
                                                                                                                <label class="col-form-label">.</label>
                                                                                                                <div class="col-md-offset-2 col-md-10">
                                                                                                                    <input name="btn_upload_lessonplan"
                                                                                                                           type="submit"
                                                                                                                           value="Submit"
                                                                                                                           class="btn btn-primary btn-round"/>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">

    function getSelectedValue(){
        const selectedAssessment = document.getElementById("assecmenttype_id");
        const assessmentName = selectedAssessment.options[selectedAssessment.selectedIndex].innerHTML;

        const assessmentNameField = document.getElementById('assessmentName')
        assessmentNameField.style.visibility = "visible" ;
        assessmentNameField.value = assessmentName
    }

</script>

<script src="../../lib/cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="../../lib/Toast/jquery.toast.min.css" rel="stylesheet" type="text/css"/>
<script src="../../lib/Toast/alerts.js" type="text/javascript"></script>
<script src="../../lib/Toast/jquery.toast.min.js" type="text/javascript"></script>
<script type="text/javascript">
    const url_string = window.location.href;
    const url = new URL(url_string);
    const error = url.searchParams.get("error");
    const originUrl = window.location.href.split('?')[0];
    if (error) {
        showWarningToast(error)
        console.log("originalUrl",originUrl);
        window.history.pushState({}, document.title,originUrl);
    }
</script>

<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/jquery/js/jquery.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/jquery-ui/js/jquery-ui.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/popper.js/js/popper.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/bootstrap/js/bootstrap.min.js"></script>

<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/jquery-slimscroll/js/jquery.slimscroll.js"></script>

<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/modernizr/js/modernizr.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/modernizr/js/css-scrollbars.js"></script>

<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/i18next/js/i18next.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/i18next-xhr-backend/js/i18nextXHRBackend.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/i18next-browser-languagedetector/js/i18nextBrowserLanguageDetector.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/jquery-i18next/js/jquery-i18next.min.js"></script>

<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/select2/js/select2.full.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/bootstrap-multiselect/js/bootstrap-multiselect.js">

</script>
<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/multiselect/js/jquery.multi-select.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/assets/js/jquery.quicksearch.js"></script>


<script src="../../files/bower_components/datatables.net/js/jquery.dataTables.min.js"
        type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-buttons/js/dataTables.buttons.min.js"
        type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/pages/data-table/js/jszip.min.js"
        type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/pages/data-table/js/pdfmake.min.js"
        type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/pages/data-table/js/vfs_fonts.js"
        type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/pages/data-table/extensions/buttons/js/dataTables.buttons.min.js"
        type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/pages/data-table/extensions/buttons/js/buttons.flash.min.js"
        type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/pages/data-table/extensions/buttons/js/jszip.min.js"
        type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/pages/data-table/extensions/buttons/js/vfs_fonts.js"
        type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/pages/data-table/extensions/buttons/js/buttons.colVis.min.js"
        type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-buttons/js/buttons.print.min.js"
        type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-buttons/js/buttons.html5.min.js"
        type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-bs4/js/dataTables.bootstrap4.min.js"
        type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-responsive/js/dataTables.responsive.min.js"
        type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"
        type="028b4b5e88a856df25e89945-text/javascript"></script>

<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/i18next/js/i18next.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/i18next-xhr-backend/js/i18nextXHRBackend.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/i18next-browser-languagedetector/js/i18nextBrowserLanguageDetector.min.js"></script>
<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/bower_components/jquery-i18next/js/jquery-i18next.min.js"></script>


<script src="../../js/RelaodTeacherAssecmentCombo.js" type="text/javascript"></script>

<script type="028b4b5e88a856df25e89945-text/javascript"
        src="../../files/assets/pages/advance-elements/select2-custom.js"></script>


<script src="../../files/assets/pages/data-table/extensions/buttons/js/extension-btns-custom.js"
        type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/js/pcoded.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/js/vartical-layout.min.js" type="028b4b5e88a856df25e89945-text/javascript"></script>
<script src="../../files/assets/js/jquery.mCustomScrollbar.concat.min.js"
        type="028b4b5e88a856df25e89945-text/javascript"></script>
<script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/assets/js/script.js"></script>

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"
        type="028b4b5e88a856df25e89945-text/javascript"></script>

<script type="028b4b5e88a856df25e89945-text/javascript">
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-23581568-13');




</script>

<script>
    function redirectWithID(id) {
        window.location.href = "#";
    }
</script>
<script src="../../files/rocket-loader.min.js" data-cf-settings="028b4b5e88a856df25e89945-|49" defer=""></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
      href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css">
<script type="text/javascript">
    $(document).ready(function () {
        $("#datepicker").datepicker({
            dateFormat: 'mm yy',
            changeMonth: true,
            changeYear: true,
            showButtonPanel: true,

            onClose: function (dateText, inst) {
                var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
                var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                $(this).val($.datepicker.formatDate('MM yy', new Date(year, month, 1)));
            }
        });

        $("#datepicker").focus(function () {
            $(".ui-datepicker-calendar").hide();
            // $("#ui-datepicker-div").position({
            //     my: "center top",
            //     at: "center bottom",
            //     of: $(this)
            // });
        });
    });
</script>

</body>

<!-- Mirrored from colorlib.com//polygon/adminty/default/dt-ext-buttons-html-5-data-export.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:48:50 GMT -->
</html>
