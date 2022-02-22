<script src="../../lib/cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="../../lib/Toast/jquery.toast.min.css" rel="stylesheet" type="text/css"/>
<script src="../../lib/Toast/alerts.js" type="text/javascript"></script>
<script src="../../lib/Toast/jquery.toast.min.js" type="text/javascript"></script>
﻿<?php
require_once '../../db_connection/dbconfig.php';
require_once '../../model/SuperModel.php';

if (isset($_POST['publicId'])) {
    $publicId = $_POST['publicId'];
    $term = $_POST['term_id'];
    $date = $_POST['date'];
    getStudentReportDetailsBy($publicId, $term,$date);
}

function getStudentReportDetailsBy($publicId, $term, $date) {
    $comments = SuperModel::getStudentCommentsByPublicId($publicId, $term, $date);
    if (empty($comments)) {
        header('location:/threeedu/view/headteacher/finalReportFilter.php?error=record not found');
    } else {
        header('location:/threeedu/view/headteacher/finalReport.php?public_id='.$publicId.'&term='.$term.'&date='.$date);
    }
}


