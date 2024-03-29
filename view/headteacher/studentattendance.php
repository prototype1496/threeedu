<?php 
require '../../controller/super/SessionStart.php'; 
require '../../db_connection/dbconfig.php'; 
require '../../model/SuperModel.php'; 

$student_no = trim(filter_input(INPUT_GET, 'id', FILTER_DEFAULT));

$row = SuperModel::get_student_details_by_student_no($student_no);

?>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from colorlib.com//polygon/adminty/default/dashboard-crm.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:45:47 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
<title>Pupil Profil </title>


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
<?php require './sidbar.php'; ?>
<!--side bar end  -->





 <div class="pcoded-content">
        <div class="pcoded-inner-content">
            <div class="main-body">
                <div class="page-wrapper">





                    <div class="page-body">



                        <div class="card">











                            <div class="card-block table-border-style">
                                <div class="table-responsive">
                                    <table class="table table-styling">
                                        <thead>
                                            <tr class="table-primary">

                                                <th>Photo</th>
                                                <th>Student ID</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>         </th>
                                                <th>Status</th>
                                                <th>Reason</th>
                                            </tr>
                                        </thead>

                                        @if (Model != null && Model.Count > 0)
                                        {
                                            int j = 0;

                                            foreach (var item in Model)
                                            {
                                                <tr>

                                                    <td>
                                                        <div>
                                                            <img src="@Url.Content(item.ImagePath)" class="img-circle" alt="Cinque Terre" width="100" height="100" />
                                                        </div>
                                                    </td>


                                                    <td>
                                                        <br />
                                                        <br />
                                                        @Html.TextBoxFor(a => a[j].StudentID, new { @class = "form-control-plaintext" })
                                                    </td>

                                                    <td>
                                                        <br />
                                                        <br />
                                                        @Html.TextBoxFor(a => a[j].StudentFirstName, new { @class = "form-control-plaintext" })

                                                    </td>

                                                    <td>
                                                        <br />
                                                        <br />
                                                        @Html.TextBoxFor(a => a[j].StudentLastName, new { @class = "form-control-plaintext" })

                                                    </td>


                                                    <td>
                                                        <br />
                                                        <br />
                                                        @Html.HiddenFor(a => a[j].DateMarked, new { @Value = @DateTime.Now.ToShortDateString() })

                                                    </td>


                                                    <td>

                                                        @{
                                                            List<SelectListItem> listItems = new List<SelectListItem>();
                                                            listItems.Add(new SelectListItem
                                                            {
                                                                Text = "Present",
                                                                Value = "Present"
                                                            });
                                                            listItems.Add(new SelectListItem
                                                            {
                                                                Text = "Absent",
                                                                Value = "Absent",
                                                                Selected = true
                                                            });
                                                            listItems.Add(new SelectListItem
                                                            {
                                                                Text = "Unmarked",
                                                                Value = "Unmarked",
                                                                Selected = true
                                                            });
                                                        }


                                                        <div>
                                                            <br />
                                                            <br />
                                                            @Html.DropDownListFor(a => a[j].Status, listItems, "--Select Gender--")

                                                        </div>



                                                    </td>
                                                    <td>
                                                        <br />
                                                        <br />
                                                        @Html.TextBoxFor(a => a[j].Reason)

                                                    </td>

                                                </tr>
                                                j++;
                                            }
                                        }

                                    </table>

                                </div>



                                <div class="form-group">
                                    <div class="col-md-offset-2 col-md-10">
                                        <input type="submit" value="Submit" class="btn btn-primary btn-round" />
                                    </div>
                                </div>



                            </div>



                        </div>

                    </div>
                </div>
            </div>
            <div id="styleSelector">
            </div>
        </div>
    </div>



}
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
