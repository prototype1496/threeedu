<script src="../../js/Jnotify/jquery-1.12.4.min.js" type="text/javascript"></script>
<link href="../../js/Jnotify/jnoty.min.css" rel="stylesheet" type="text/css"/>
<script src="../../js/Jnotify/jnoty.min.js" type="text/javascript"></script>

<?php

    require_once '../../db_connection/dbconfig.php';
  
     require_once '../../model/SuperModel.php';

echo "<script>               
            $(document).ready(
             
            function(){
                
               $.jnoty('Class Added Successfuly', {
            sticky: false,
            header: 'Success',
            theme: 'jnoty-success',
            close: function() {window.location.replace('/threeedu/view/admin/teacherregistration.php')},
            });   
            }); 
            </script>";
 
 