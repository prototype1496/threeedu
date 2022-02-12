<script src="../../lib/cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="../../lib/Toast/jquery.toast.min.css" rel="stylesheet" type="text/css"/>
<script src="../../lib/Toast/alerts.js" type="text/javascript"></script>
<script src="../../lib/Toast/jquery.toast.min.js" type="text/javascript"></script>
﻿<?php
require_once '../../db_connection/dbconfig.php';
require_once '../../model/SuperModel.php';

if (isset($_POST['publicId'])) {
    $publicId = $_POST['publicId'];
    $assessmentId = $_POST['accesmenttype_id'];
    $date = $_POST['date'];
    $assessmentName = $_POST['assessmentName'];
    getStudentReportDetailsBy($publicId, $assessmentId,$assessmentName,$date);
}


function getStudentReportDetailsBy($publicId, $assessmentId,$assessmentName, $date) {
    $comments = SuperModel::getStudentCommentsByPublicId($publicId, $assessmentId, $date);
    if (empty($comments)) {
        header('location:/threeedu/view/headteacher/finalReportFilter.php?error=record not found');
    } else {
        header('location:/threeedu/view/headteacher/finalReport.php?public_id='.$publicId.'&assesment_id='.$assessmentId.'&assessmentName='.$assessmentName.'&date='.$date);
    }
}


