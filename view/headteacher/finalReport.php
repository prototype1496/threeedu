<?php
require '../../controller/super/SessionStart.php';
require_once '../../db_connection/dbconfig.php';
require_once '../../model/TeacherModel.php';
require_once '../../model/SuperModel.php';

$tenant_id = $_SESSION['threeedu_tenantid'];
$school_id = $_SESSION['threeedu_schoolid'];
$stm = TeacherModel::get_all_student_details($tenant_id);
$classes = SuperModel::get_all_classes_by_tenant_id($tenant_id);
$publicId = $_GET["public_id"];
$term = $_GET["term"];
$date = $_GET["date"];
$assessment_type_id = $_GET["assessment"];


print_r($date);
$studentAssesment = SuperModel::get_student_assecemnttype_by_public_id($publicId,$assessment_type_id);

$assecment_type_data = SuperModel::get_assesment_by_id($tenant_id,$assessment_type_id);
$studentDetails = SuperModel::getStudentDetailsByPublicId($publicId);
$schoolDetails = SuperModel::getSchoolDetailsByPublicId($publicId);
$studentComments = SuperModel::getStudentCommentsByPublicId($publicId, $term,$assessment_type_id,$date);
$year = date('Y', strtotime($date));

$assessment = $assecment_type_data['AssementTypeName'];

if(isset($studentComments)){
    header("");
}
$teacherName = $studentComments["TeaherMasterName"];
$headTeacherName = $studentComments["HeadTeacherName"];
$teacherComments = $studentComments["TeacherComment"];
$headTeacherComments = $studentComments["HeadTeacherComment"];

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
                                                                                                <h5>Final Report </h5>
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
                                                                                                <div class="row">
                                                                                                    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.8.1/html2pdf.bundle.min.js"
                                                                                                            integrity="sha512-vDKWohFHe2vkVWXHp3tKvIxxXg0pJxeid5eo+UjdjME3DBFBn2F8yWOE0XmiFcFbXxrEOR1JriWEno5Ckpn15A=="
                                                                                                            crossorigin="anonymous"
                                                                                                            referrerpolicy="no-referrer"></script>
                                                                                                    <button class=" btn btn-primary btn-flat"
                                                                                                            onclick="downloadPdf()">
                                                                                                        PDF
                                                                                                    </button>
                                                                                                    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.8.1/html2pdf.bundle.min.js"
                                                                                                            integrity="sha512-vDKWohFHe2vkVWXHp3tKvIxxXg0pJxeid5eo+UjdjME3DBFBn2F8yWOE0XmiFcFbXxrEOR1JriWEno5Ckpn15A=="
                                                                                                            crossorigin="anonymous"
                                                                                                            referrerpolicy="no-referrer"></script>

                                                                                                    <input type="hidden" id="tenant_id" name="tenant_id"
                                                                                                           value="<?php echo $tenant_id; ?>"/>

                                                                                                    <script type="text/javascript">
                                                                                                        function downloadPdf() {
                                                                                                            const element = document.getElementById('reportContainer')
                                                                                                            html2pdf(element, {
                                                                                                                margin: 0.2,
                                                                                                                filename: 'finalReport.pdf',
                                                                                                                image: {
                                                                                                                    type: 'jpeg',
                                                                                                                    quality: 0.98
                                                                                                                },
                                                                                                                html2canvas: {
                                                                                                                    dpi: 192,
                                                                                                                    letterRendering: true
                                                                                                                },
                                                                                                                jsPDF: {
                                                                                                                    unit: 'in',
                                                                                                                    format: 'letter',
                                                                                                                    orientation: 'landscape'
                                                                                                                }
                                                                                                            });
                                                                                                        }
                                                                                                    </script>
                                                                                                </div>
                                                                                                <hr>
                                                                                                <div  id="reportContainer" style="width: 100%">
                                                                                                <div id="reportContainer"
                                                                                                     style="width: 100%;height: 100%">
                                                                                                    <table
                                                                                                            id="table"
                                                                                                            class="col-sm-12"
                                                                                                            border='1'
                                                                                                            style="border-collapse: collapse;width: 100%;margin-top: auto; margin-left: auto;margin-right: auto"
                                                                                                            >
                                                                                                        <tbody>
                                                                                                        <tr
                                                                                                                style="font-size:1rem;  border: transparent; border-bottom: 1px solid black;"
                                                                                                        >
                                                                                                            <td colspan="1"
                                                                                                                align="left"
                                                                                                                style="height: 8rem;width:8rem;margin: auto ">
                                                                                                                <img alt="school logo"
                                                                                                                     src="<?php echo $schoolDetails['PicURL'] ?>"
                                                                                                                     style="height: 8rem;width:8rem;  margin: 1rem "/>
                                                                                                            </td>
                                                                                                            <td colspan="2"
                                                                                                                align="left"
                                                                                                                style="line-height: 2;">
                                                                                                                <h2 style="margin: 1.5rem; color: #0a6aa1">
                                                                                                                    <b><?php echo isset($schoolDetails['SchoolName']) ? $schoolDetails['SchoolName'] : '' ?></b>
                                                                                                                </h2>
                                                                                                                <br>
                                                                                                                <h6 style="margin-bottom: -1rem;margin-left: 1.5rem"><?php echo $schoolDetails['SchoolMotto'] ?></h6>
                                                                                                                <br>
                                                                                                                <h6 style="margin-bottom: 2rem;margin-left: 1.5rem"><?php echo $schoolDetails['Tel'] ?>
                                                                                                                    <?php echo $schoolDetails['PhoneNo'] ?></h6>
                                                                                                            </td>
                                                                                                            <td colspan="1"
                                                                                                                align="center"
                                                                                                                style="color: #0a6aa1; margin-bottom: 1rem;">
                                                                                                                <h2> <?php echo $studentDetails['ClassName'] ?></h2>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td
                                                                                                                    align="center"
                                                                                                                    style="font-size:1rem; border: transparent; border-bottom: 2px solid black;  padding:20px;">
                                                                                                                <b>NAME<br>
                                                                                                                    <?php echo $studentDetails['Name'] ?>
                                                                                                                </b>
                                                                                                            </td>
                                                                                                            <td
                                                                                                                    align="center"
                                                                                                                    style="font-size:1rem; border: transparent;   border-bottom: 2px solid black; padding:20px;">
                                                                                                                <b>CLASS
                                                                                                                    <br>
                                                                                                                    <?php echo $studentDetails['ClassName'] ?>
                                                                                                                </b>
                                                                                                            </td>
                                                                                                            <td
                                                                                                                    align="center"
                                                                                                                    style="font-size:1rem; border: transparent;  border-bottom: 2px solid black; padding:20px;">
                                                                                                                <b>TERM<br>
                                                                                                                    <?php echo $term ?>
                                                                                                                </b>
                                                                                                            </td>
                                                                                                            <td
                                                                                                                    align="center"
                                                                                                                    style="font-size:1rem; border: transparent;  border-bottom: 2px solid black; padding:20px;">
                                                                                                                <b>YEAR<br>
                                                                                                                    <?php echo $year ?>
                                                                                                                </b>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td rowspan='2'
                                                                                                                align="center"
                                                                                                                style="font-size:1rem; padding:20px; color: #0a6aa1;">
                                                                                                                <b>
                                                                                                                    Subjects
                                                                                                                </b>
                                                                                                            </td>
                                                                                                            <td align="center"
                                                                                                                colspan="3"
                                                                                                                style="font-size:1rem; padding:10px; color: #0a6aa1;">
                                                                                                                <b>
                                                                                                                    <?php echo isset($assessment)? $assessment:''; ?>
                                                                                                                   </b>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td align="center"
                                                                                                                style="background-color:#d0e4f7">
                                                                                                                PUPIL'S
                                                                                                                SCORE(100)
                                                                                                            </td>
                                                                                                            <td align="center"
                                                                                                                style="background-color:#d0e4f7">
                                                                                                                CLASS
                                                                                                                AVERAGE(100)
                                                                                                            </td>
                                                                                                            <td align="center"
                                                                                                                style="background-color:#d0e4f7">
                                                                                                                GRADE
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <?php while ($row_data = $studentAssesment->fetch(PDO::FETCH_ASSOC)) {
                                                                                                            $assessment = $row_data['AssecementName'];
                                                                                                            
                                                                                                            ?>
                                                                                                            <tr>
                                                                                                                <td align="center"><?php echo $row_data['Subject']; ?></td>
                                                                                                                <td align="center"><?php echo $row_data['Score']; ?></td>
                                                                                                                <td align="center">
                                                                                                                    70
                                                                                                                </td>
                                                                                                                <td align="center"><?php
                                                                                                                    $score = $row_data['Score'];
                                                                                                                    if ($score >= 0 && $score <= 50)
                                                                                                                        echo $grade = "Fail";
                                                                                                                    if ($score > 50 && $score <= 70)
                                                                                                                        echo $grade = "C";
                                                                                                                    if ($score > 70 && $score <= 80)
                                                                                                                        echo $grade = "B";
                                                                                                                    if ($score > 80 && $score <= 90)
                                                                                                                        echo $grade = "A";
                                                                                                                    if ($score > 90)
                                                                                                                        echo $grade = "E";
                                                                                                                    ?></td>
                                                                                                            </tr>
                                                                                                        <?php } ?>


                                                                                                        <tr style="font-size:1rem; border: transparent; border-bottom: 1px solid black;">
                                                                                                            <td colspan="4"
                                                                                                                align="left"
                                                                                                                style="height: 2rem;width:2rem; ">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr style="font-size:1rem; border-bottom: transparent;">
                                                                                                            <td colspan="2"
                                                                                                                align="left"
                                                                                                                style="height: 2rem; border: transparent">
                                                                                                                <h6 style="margin: 0.5rem; color: #0a6aa1">
                                                                                                                    <b>CLASS
                                                                                                                        TEACHER
                                                                                                                        COMMENT</b>
                                                                                                                </h6>
                                                                                                            </td>
                                                                                                            <td colspan="2"
                                                                                                                align="left"
                                                                                                                style="height: 2rem; margin:0.5rem; border: transparent ">
                                                                                                                <h6 style="margin: 0.5rem">
                                                                                                                    <b>TEACHER:</b>
                                                                                                                    <b style="color: #0a6aa1"><?php echo $teacherName ?></b>
                                                                                                                </h6>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr style="font-size:1rem; border-bottom: transparent;">
                                                                                                            <td colspan="4"
                                                                                                                style="border: transparent ">
                                                                                                                <div style="border-bottom: 1px solid darkgrey;margin: 5px">
                                                                                                                </div>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr style="font-size:1rem; border-bottom: 1px solid black;">
                                                                                                            <td colspan="2"
                                                                                                                align="left"
                                                                                                                style="height: 2rem; border: transparent">
                                                                                                                <h6 style="margin: 0.5rem;">
                                                                                                                    <?php echo $teacherComments ?>
                                                                                                                </h6>
                                                                                                            </td>
                                                                                                        </tr>

                                                                                                        <tr style="font-size:1rem; border: transparent; border-bottom: 1px solid black;">
                                                                                                            <td colspan="4"
                                                                                                                align="left"
                                                                                                                style="height: 2rem;width:2rem; ">
                                                                                                            </td>
                                                                                                        </tr>

                                                                                                        <tr style="font-size:1rem; border-bottom: transparent;">
                                                                                                            <td colspan="2"
                                                                                                                align="left"
                                                                                                                style="height: 2rem; border: transparent">
                                                                                                                <h6 style="margin: 0.5rem; color: #0a6aa1">
                                                                                                                    <b>HEAD
                                                                                                                        TEACHER
                                                                                                                        COMMENT</b>
                                                                                                                </h6>
                                                                                                            </td>
                                                                                                            <td colspan="2"
                                                                                                                align="left"
                                                                                                                style="height: 2rem; margin:0.5rem; border: transparent ">
                                                                                                                <h6 style="margin: 0.5rem">
                                                                                                                    <b>TEACHER:</b>
                                                                                                                    <b style="color: #0a6aa1"><?php echo $headTeacherName ?></b>
                                                                                                                </h6>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr style="font-size:1rem; border-bottom: transparent;">
                                                                                                            <td colspan="4"
                                                                                                                style="border: transparent ">
                                                                                                                <div style="border-bottom: 1px solid darkgrey;margin: 5px">
                                                                                                                </div>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr style="font-size:1rem; border-bottom: transparent;">
                                                                                                            <td colspan="2"
                                                                                                                align="left"
                                                                                                                style="height: 2rem; border: transparent">
                                                                                                                <h6 style="margin: 0.5rem; ">
                                                                                                                    <?php echo $headTeacherComments ?>
                                                                                                                </h6>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </div>
                                                                                                </div>
                                                                                                <hr>
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
        // window.location.href = "/threeedu/view/teacher/profile.php?id="+id;
        window.location.href = "#";

    }
</script>
<script src="../../files/rocket-loader.min.js" data-cf-settings="028b4b5e88a856df25e89945-|49" defer=""></script>
</body>

<!-- Mirrored from colorlib.com//polygon/adminty/default/dt-ext-buttons-html-5-data-export.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:48:50 GMT -->
</html>
