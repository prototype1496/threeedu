<?php
require '../../controller/super/SessionStart.php';
require_once '../../db_connection/dbconfig.php';
require_once '../../model/SuperModel.php';
require_once '../../controller/super/AccountsController.php';

$tenant_id = $_SESSION['threeedu_tenantid'];
$school_id = $_SESSION['threeedu_schoolid'];

if (isset($_GET['term_id']) || isset($_GET['year_id'])){
    
    $term_id  = $_GET['term_id'];
    $year_id  = $_GET['year_id'];
    
    $stm = SuperModel::get_all_transactional_history($term_id,$year_id,1,$tenant_id);
    
    
   
}else {

    $stm = SuperModel::get_all_transactional_history('','',2,$tenant_id);
}

$stm_term_data = SuperModel::get_active_terms($tenant_id);
?>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from colorlib.com//polygon/adminty/default/dt-ext-buttons-html-5-data-export.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:48:50 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <head>
        <title>Total Transaction History </title>


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
                      require './sidbar.php';
                        ?>
                        <!--side bar end  -->

                        <div class="pcoded-content">
                            <div class="pcoded-inner-content">

                                <div class="main-body">
                                  
                                    <form method="POST" action="bulkcharg.php" enctype="multipart/form-data"> 

                                        <div class="page-body">
                                            <div class="row">
                                                <div class="col-sm-12">

                                                    <div class="card">

                                                        <div class="card-block">
                                                            <div class="form-group row">

                                                                 
                                                                
                                                                <div class="col-md-4">
                                                                    <div class="form-group">
                                                                        <label class="bmd-label-floating">Term</label>
                                                                        <div class="form-select-list">
                                                                            <select   class="form-control custom-select-value" name="term_id">
                                                                                <option value="" disabled="disabled" selected="selected">Select Terms</option>

                                                                                <?php while ($stm_term_data_row = $stm_term_data->fetch(PDO::FETCH_ASSOC)) { ?> 
                                                                                    <option value="<?php echo $stm_term_data_row['TermMasterID']; ?>">  <?php echo $stm_term_data_row['TermName']; ?>  </option>
                                                                                <?php } ?>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                
                                                                                   <div class="col-md-4">
                                                                    <div class="form-group">
                                                                        <label class="bmd-label-floating">Year</label>
                                                                        <div class="form-select-list">
                                                                            <select   class="form-control custom-select-value" name="year_id">
                                                                                <option value="" disabled="disabled" selected="selected">Select Year</option>

                                  
                                                                                    <option value="2019">2019  </option>
                                                                                    <option value="2020">2020  </option>
                                                                                    <option value="2021">2021  </option>
                                                                                    <option value="2022">2022  </option>
                                                                                    <option value="2023">2023</option>
                                                                                     <option value="2024">2024</option>
                                                                                       <option value="2024">2025</option>
                                                                                         <option value="2024">2026</option>
                                                                                           <option value="2024">2027</option>

                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                 <div class="col-md-4">
                                                                    <div class="form-group">
                                                                        <br>
                                                                        <input name="btn_complet_trasacton_history" type="submit" value="Load" class="btn btn-grd-primary">
                                                                        
                                                                      
                                                                        
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
                                                            <h4>Transaction History</h4>  
                                                            
                                                            
                                                            <hr>     
                                                        </div>
                                                        <div class="card-block">
                                                            <div class="dt-responsive table-responsive">
<!--                                                                remved excel-bg from id becasue its not validation other recods-->
                                                                <table id="excel-bg" class="table table-striped table-bordered nowrap">
                                                                    <thead>
                                                                        <tr>
                                                                            <th></th>
                                                                            <th>Student ID</th>
                                                                            <th>Student Details</th>
                                                                            <th>Balance</th>
                                                                            <th>Billed Amount</th>

                                                                            
                                                                             
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <?php
                                                                        while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {
                                                                            
                                                                           
                                                                          $toatlabalace  = $row['TOTALBALACE'];
                                                                          
                                                                         
                                                                     
                                                                            ?>
                                                                            <tr>
                                                                                  <td></td>
                                                                                
                                                                                <td><?php echo $row['StudentMasterPublicID']; ?></td>
                                                                                <td><?php echo $row['Name']; ?></td>
                                                                                <td><?php echo $row['Balace']; ?></td>
                                                                                <td><?php echo $row['BilledAmount']; ?></td>
                                                                                

                                                                            </tr>

<?php } 


?>
                                                                                                                





                                                                    </tbody>
                                                                    <tfoot>
                                                                        <tr>
                                                                               <th></th>
                                                                        <th>Student ID</th>
                                                                            <th>Student Details</th>
                                                                            <th>Balance</th>
                                                                            <th>Billed Amount</th>
                                                                        </tr>
                                                                    </tfoot>
                                                                </table>
                                                            </div>
                                                            <?php 
                                                            
                                                              if(isset($toatlabalace)){
                                                                                   
                                                                                 $toatlabalace_t  = $toatlabalace;  
                                                                           }else {
                                                                               $toatlabalace_t = 0;
                                                                               
                                                                           }
                                                            echo '<H5><b>Total Blance: K'.$toatlabalace_t.'</b></H5>'?>
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
