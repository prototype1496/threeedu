<?php
require_once '../../controller/super/SessionStart.php';
require_once '../../db_connection/dbconfig.php';
require_once '../../model/SuperModel.php';
//require_once '../../lib/grid/dbcon.php';
$class_master_id = trim(filter_input(INPUT_GET, 'id', FILTER_DEFAULT));
$tenant_id = $_SESSION['threeedu_tenantid'];
$school_id = $_SESSION['threeedu_schoolid'];
$stm = SuperModel::get_all_active_calsses($tenant_id);
$row= SuperModel::get_school_details_by_tenant_id($tenant_id);
$teacher_details_stm = SuperModel::get_teacher_details_by_tenant_id($tenant_id);
$get_grades_stm = SuperModel::get_active_grades_by_tenant_id($tenant_id);

 if(!isset($class_master_id) || empty($class_master_id) ){
     
     header("location: /threeedu/view/admin/classmaster.php");
 }
$get_maped_subjects = SuperModel::get_subjects_by_class_id($class_master_id,$school_id);
$get_class_details = SuperModel::get_class_details_by_id($class_master_id);


?>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Class Master </title>

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
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link href="../../lib/grid/grid.css" rel="stylesheet" type="text/css"/>
       
    </head>
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
                                        <div class="page-body">
<!--                                            ../../controller/super/ActionPerformed.php-->
                        <form method="POST" action="../../controller/super/ActionPerformed.php">
                            <div>
                                <button name="btn_update_class" class="btn btn-primary waves-effect waves-light add" style="float: right;" type="submit">Submit</button> <br><br><br><br>
                            </div>
                
                                              <div class="card">
                                                  
                                                   <div class="card-block">
                                                       
                                                     
<div class="page-header">
<div class="row align-items-end">
<div class="col-lg-8">
<div class="page-header-title">
<div class="d-inline">
   <h4><b><?php echo $row['SchoolName'] ; ?></b></h4>

</div>
</div>
</div>
<div class="col-lg-4">
<div class="page-header-breadcrumb">
<ul class="breadcrumb-title">

    <li class="breadcrumb-item">
        <a href="#!">
             <h5>Date: <?php echo date("Y/m/d") ?></h5>
          
        </a>
</li>
</ul>
</div>
</div>
</div>
</div>
   </div>                                           
                                                  
                                                  
        </div>     
                                           
                                            <div class="card">
            
            
                                                <div class=" row"> 
                                                    
                                                  
                                                <div class="col-md-6">
                                                    
                                                       <div class="card-block">
                                    <div class="row">  
                                        
                                        <input type="hidden" name="class_master_id" value="<?php echo $class_master_id?>"/>
                                <div class="col-md-4">        
                        <div class="form-group">
                          <div class="form-select-list">
                             
                                        <select  required="" class="form-control custom-select-value" name="grade_id">
                                            <option readonly value="<?php echo $get_class_details['GradeMasterID']; ?>"  selected="selected"><?php echo $get_class_details['Grade']; ?></option>
<!--                                                 <?php 
//                                                 while($grades =$get_grades_stm->fetch(PDO::FETCH_ASSOC) ){ ?> 
                                                  <option value="<?php // echo $grades['GradeMasterID']; ?>">
                                                      <?php // echo $grades['Grade']; ?>
                                                  </option>-->
                                                <?php // } ?>
                                                
                                       </select>
                                    </div>
                        </div>
                           </div>
                          
                                        <div class="col-md-4">  
                            <div class="form-group">
                        
                                <input required="" value="<?php echo $get_class_details['ClassName']; ?>" name="class_name" placeholder="Class Name" type="text" class="form-control">
                        </div>  
                                            </div>
                                        
                                        <div class="col-md-4">  
                                        <div class="form-group">
                         
                                            <input required="" value="<?php echo $get_class_details['ClassCode']; ?>" maxlength="3" name="class_code" placeholder="Class Code" type="text" class="form-control">
                        </div> 
                                          </div>
                                        
                                              
                           </div>                           
                                   <div class="form-group">
                          <div class="form-select-list">
                             
                                        <select class="js-example-data-array col-sm-4" required="" class="form-control custom-select-value" name="class_teacher_id">
                                            <option value="<?php echo $get_class_details['TeaherMasterPublicID']; ?>" selected="selected"><?php echo $get_class_details['Teacher']; ?></option>
                                              
                                                <?php 
                                                while($teachers =$teacher_details_stm->fetch(PDO::FETCH_ASSOC) ){ 
                                                    ?> 
                                                  <option value="<?php echo $teachers['TeaherMasterPublicID']; ?>">
                                                      <?php echo $teachers['Teacher']; ?>
                                                  </option>
                                                <?php } ?>
                                                
                                       </select>
                                    </div>
                        </div>                 
                                        <div class="form-group">
                          <label class="bmd-label-floating">Description</label>
                          <textarea  type="date"  name="description" class="form-control"  rows="3" ><?php echo $get_class_details['Description']; ?></textarea>
                        </div>            
                                                    
                                                      </div> 
                                                </div>
                                                
                                                     
                                                
                                                
                                                
                                                
                                                <div class="col-md-6">
                                                <div class="card-block">
                                                    <div class="table-responsive">
                                                        <table class="table table-striped table-bordered" id="edu_example-3">
                                                                <thead>
                                                                    <tr>
                                                                           
                                                                        <th>Subject</th>
                                                                        <th>Room</th>

                                                                        <th>Actions</th>
                                                                    </tr>
                                                                </thead>
                                                            <tbody>
                                                               <?php 
                                                 while($data =$get_maped_subjects->fetch(PDO::FETCH_ASSOC) ){ ?> 
                                                            <tr>
                                                                  <input value="<?php echo $data['ClassDetailsPublicID'] ?>" type="hidden" name="ides[]" />  
                                                                <td>
                                                                    <?php echo $data['Subject'] ?>
                                                                    <input value="<?php echo $data['SujectCode'] ?>" type="hidden" name="subject_name[]" />     
                                                                </td>
                                                                <td>
                                                                    <?php echo $data['ClassRoomName'] ?>
                                                                 <input value="<?php echo $data['ClassRoomPublicID'] ?>" type="hidden" name="class_room[]" /> 
                                                                </td>
                                                                <td>  <input type="checkbox"  name="chk_subject" value="1" checked>&nbsp;&nbsp;
                                                                        <a class="edit" title="Edit" data-toggle="tooltip" id="1"><i class="fa fa-pencil"></i></a>
                                                                            
                                                                </td>
                                                                
                                                            </tr>
                                                <?php } ?> 
                                                               
                                                               
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                   
                                                    <button type="button" class="btn btn-primary waves-effect waves-light add-new"><i class="fa fa-plus"></i> Add New</button>
                                                </div>
                                                    
                                                    </div>
                                                     </div> 
                </form>
                                            </div>




                                            
                                            
                                            
                                            <div class="row">
<div class="col-sm-12">

<div class="card">
    <div class="card-header ">
        <h4>Available Classes </h4>      
      
    </div>
<div class="card-block">
    
<div class="dt-responsive table-responsive">
<table id="excel-bg" class="table table-striped table-bordered nowrap">
<thead>
<tr>
    <th>#</th>
<th>Class Name</th>


<th>Class Teacher</th>
<th>Created On</th>
<th>Created By</th>

<th></th>
</tr>
</thead>
<tbody>
    
      <?php 
      $num = 0;
      while($row = $stm->fetch(PDO::FETCH_ASSOC))
                           
                    {
                          $public_id = $row['ClassMasterPublicID'];
                            ?>
<tr>
         <td><?php echo $num = $num+1; ?></td>
         <td><?php echo $row['Class'];?></td>
        
        
        <td ><?php echo $row['TeacherName'];?></td>
          <td ><?php echo $row['AddOn'];?></td>
            <td ><?php echo $row['UpdatedBy'];?></td>
        
              
       

<td>
    <button onclick="redirectWithID('<?php echo $public_id;?>')" style="padding: 1px 5px; font-size: 12px; line-height: 1.5; border-radius: 3px;" class="btn btn-info"><i class="feather icon-edit-1"></i></button>
  </td>
</tr>

     <?php } ?>





</tbody>
<tfoot>
<tr>
      <th>#</th>
<th>Class Name</th>
<th>Class Teacher</th>
<th>Created On</th>
<th>Created By</th>
<th></th>
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


      
       <script src="../../lib/grid/jquery-3.5.1.min.js" type="text/javascript"></script>
        <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/bower_components/jquery-ui/js/jquery-ui.min.js"></script>
        <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/bower_components/popper.js/js/popper.min.js"></script>
        <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/bower_components/bootstrap/js/bootstrap.min.js"></script>
        <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/bower_components/jquery-slimscroll/js/jquery.slimscroll.js"></script>
        <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/bower_components/modernizr/js/modernizr.js"></script>
        <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/bower_components/modernizr/js/css-scrollbars.js"></script>
        <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/bower_components/i18next/js/i18next.min.js"></script>
        <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/bower_components/i18next-xhr-backend/js/i18nextXHRBackend.min.js"></script>
        <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/bower_components/i18next-browser-languagedetector/js/i18nextBrowserLanguageDetector.min.js"></script>
        <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/bower_components/jquery-i18next/js/jquery-i18next.min.js"></script>
        
<!--          script fro grid-->
         <script src="../../lib/grid/grid.js" type="text/javascript"></script>
         <!--          script fro grid end -->
    <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/bower_components/select2/js/select2.full.min.js"></script>
    <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/bower_components/bootstrap-multiselect/js/bootstrap-multiselect.js">
    </script>
    
        <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/bower_components/multiselect/js/jquery.multi-select.js"></script>
    <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/assets/js/jquery.quicksearch.js"></script>
       
    
    <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/assets/pages/edit-table/jquery.tabledit.js"></script>
        
        
      
        
    
        <!--        This is to add the columns -->
        <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/assets/pages/edit-table/editable.js"></script>
            <!--       This is to add the columns end -->


        
        <script src="../../files/assets/js/pcoded.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
        <script src="../../files/assets/js/vartical-layout.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
        <script src="../../files/assets/js/jquery.mCustomScrollbar.concat.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script> 
        <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/assets/js/script.js"></script>
        
      
        
        
        <script src="../../files/bower_components/datatables.net/js/jquery.dataTables.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-buttons/js/dataTables.buttons.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
<script src="../../files/assets/pages/data-table/js/jszip.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
<script src="../../files/assets/pages/data-table/js/pdfmake.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
<script src="../../files/assets/pages/data-table/js/vfs_fonts.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
<script src="../../files/assets/pages/data-table/extensions/buttons/js/dataTables.buttons.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
<script src="../../files/assets/pages/data-table/extensions/buttons/js/buttons.flash.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
<script src="../../files/assets/pages/data-table/extensions/buttons/js/jszip.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
<script src="../../files/assets/pages/data-table/extensions/buttons/js/vfs_fonts.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
<script src="../../files/assets/pages/data-table/extensions/buttons/js/buttons.colVis.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-buttons/js/buttons.print.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-buttons/js/buttons.html5.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-bs4/js/dataTables.bootstrap4.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-responsive/js/dataTables.responsive.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
<script src="../../files/bower_components/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>

  
    <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/assets/pages/advance-elements/select2-custom.js"></script>

   
        
        <script src="../../files/assets/pages/data-table/extensions/buttons/js/extension-btns-custom.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
        <script src="../../files/assets/js/pcoded.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
      
        <script src="../../files/assets/js/jquery.mCustomScrollbar.concat.min.js" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>
        <script type="f2f98c3a4b756bca2389ac2a-text/javascript" src="../../files/assets/js/script.js"></script>


        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13" type="f2f98c3a4b756bca2389ac2a-text/javascript"></script>



        <script src="../../files/rocket-loader.min.js" data-cf-settings="f2f98c3a4b756bca2389ac2a-|49" defer=""></script></body>

<script>
 function redirectWithID(id){
         window.location.href = "/threeedu/view/admin/editclassmaster.php?id="+id;
        
    }
    
</script>
</html>
