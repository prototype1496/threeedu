<?php
require '../../controller/super/SessionStart.php';
require_once '../../db_connection/dbconfig.php';
require_once '../../model/SuperModel.php';
require_once '../../controller/super/MaterController.php';


$school_id = $_SESSION['threeedu_schoolid'];
$stm = SuperModel::get_all_subjets_by_id($school_id);

$stm_deartment_data = SuperModel::get_departments_school_id($school_id);
?>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from colorlib.com//polygon/adminty/default/dt-ext-buttons-html-5-data-export.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:48:50 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <head>
        <title>Subject Master </title>


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
                                  
                                    <form method="POST" action="subjectmaster.php"> 

                                        <div class="page-body">
                                            <div class="row">
                                                <div class="col-sm-12">

                                                    <div class="card">

                                                        <div class="card-block">
                                                            <div class="form-group row">

                                                                  
                                                                <div class="col-md-4">
                                                                    <div class="form-group">
                                                                        <label class="bmd-label-floating">Subject Name</label>
                                                                        <input required=""   name="subject_name" type="text" class="form-control">
                                                                    </div>
                                                                </div>   



                                                                <div class="col-md-4">
                                                                    <div class="form-group">
                                                                        <label class="bmd-label-floating">Subject Code</label>
                                                                        <input required=""  maxlength="4" name="subject_code" type="text" class="form-control">
                                                                    </div>
                                                                </div> 
                                                                
                                                                <div class="col-md-4">
                                                                    <div class="form-group">
                                                                        <label class="bmd-label-floating">Department</label>
                                                                        <div class="form-select-list">
                                                                            <select  required="" class="form-control custom-select-value" name="department_id">
                                                                                <option value="" disabled="disabled" selected="selected">Select Department</option>

                                                                                <?php while ($stm_depatment_data_row = $stm_deartment_data->fetch(PDO::FETCH_ASSOC)) { ?> 
                                                                                    <option value="<?php echo $stm_depatment_data_row['DepartmentID']; ?>">  <?php echo $stm_depatment_data_row['Department']; ?>  </option>
                                                                                <?php } ?>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12">
                                                                <div class="form-group">
                                                                  <label class="bmd-label-floating">Description</label>
                                                                  <textarea type="text"  name="discrtption" class="form-control"  rows="3" ></textarea>
                                                                </div>
                                                              </div>

                                                                <div class="col-md-3">
                                                                    <div class="form-group">
                                                                        <br>
                                                                        <input name="btn_submit_subject_master" type="submit" class="btn btn-grd-primary">
                                                                    </div>
                                                                </div> 

                                                            </div>                            
                                                            </form>                  
                                                            <div class="page-header">
                                                                <div class="row align-items-end">
                                                                    <div class="col-lg-8">
                                                                        <div class="page-header-title">
                                                                            <div class="d-inline">


                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>                                           


                                                    </div>



                                                    <div class="card">
                                                        <div class="card-header ">
                                                            <h4>Existing Subjects</h4>      
                                                            <hr>     
                                                        </div>
                                                        <div class="card-block">
                                                            <div class="dt-responsive table-responsive">
                                                                <table id="excel-bg" class="table table-striped table-bordered nowrap">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Subject Name</th>
                                                                            <th>Department</th>

                                                                            <th>Active</th>

                                                                            <th>Action</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <?php
                                                                        while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {
                                                                            $subject_master_id = $row['SubjectMaterID']
                                                                            ?>
                                                                            <tr>

                                                                                <td><?php echo $row['Subject']; ?></td>

                                                                                <td ><?php echo $row['Department']; ?></td>
                                                                          
                                                                                <td ><?php echo $row['Active']; ?></td>


                                                                                <td>
                                                                                    <button onclick="redirectWithID('<?php echo $subject_master_id; ?>')" style="padding: 1px 5px; font-size: 12px; line-height: 1.5; border-radius: 3px;" class="btn btn-info"><i class="feather icon-power"></i></button>
                                                                                     <button onclick="redirectEditWithID('<?php echo $subject_master_id; ?>')" style="padding: 1px 5px; font-size: 12px; line-height: 1.5; border-radius: 3px;" class="btn btn-info"><i class="feather icon-edit-2"></i></button>


                                                                                </td>
                                                                            </tr>

<?php } ?>





                                                                    </tbody>
                                                                    <tfoot>
                                                                        <tr>
                                                                       <th>Subject Name</th>
                                                                            <th>Department</th>

                                                                            <th>Active</th>

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


    <script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/jquery/js/jquery.min.js"></script>
    <script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/jquery-ui/js/jquery-ui.min.js"></script>
    <script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/popper.js/js/popper.min.js"></script>
    <script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/bootstrap/js/bootstrap.min.js"></script>

    <script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/jquery-slimscroll/js/jquery.slimscroll.js"></script>

    <script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/modernizr/js/modernizr.js"></script>
    <script type="028b4b5e88a856df25e89945-text/javascript" src="../../files/bower_components/modernizr/js/css-scrollbars.js"></script>

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
            function redirectWithID(subject_master_id ) {
                window.location.href = "/threeedu/view/admin/subjectmaster.php?subject_master_id=" + subject_master_id;

            }
            
             function redirectEditWithID(id, time_table_master_id) {
                window.location.href = "/threeedu/view/admin/subjectmaster.php?classid=" + id + "&timetablemaster=" + time_table_master_id;

            }
    </script>
    <script src="../../files/rocket-loader.min.js" data-cf-settings="028b4b5e88a856df25e89945-|49" defer=""></script></body>

<!-- Mirrored from colorlib.com//polygon/adminty/default/dt-ext-buttons-html-5-data-export.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:48:50 GMT -->
</html>
