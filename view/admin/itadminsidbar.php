<nav class="pcoded-navbar">
    <div class="pcoded-inner-navbar main-menu">
        <div class="pcoded-navigatio-lavel"> 
            <?php
            if ($_SESSION['threeedu_user_id'] == 1) {
                echo 'Head Teacher Account';
            } else if ($_SESSION['threeedu_user_id'] == 4) {
                echo 'IT Admin Account';
            }
            ?>
        </div>
        
        
        
        <ul class="pcoded-item pcoded-left-item">
            <li class="pcoded-hasmenu ">
                <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="feather icon-inbox"></i></span>
                    <span class="pcoded-mtext">Inbox</span>
                </a>
                <ul class="pcoded-submenu">


                    <!--    <li class="">
                            <a href="dashboard-crm.html">
                                <span class="pcoded-mtext">Teacher Registration</span>
                            </a>
                        </li>
                         <li class="">
                            <a href="dashboard-crm.html">
                                <span class="pcoded-mtext">Student Registration</span>
                            </a>
                        </li>-->


                </ul>
            </li>

            
            <li class="pcoded-hasmenu ">
                <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="feather icon-home"></i></span>
                    <span class="pcoded-mtext">School Management</span>
                </a>

                
                <ul class="pcoded-submenu">

                    <li class="">
                        <a href="viwetimetable.php">

                            <span class="pcoded-mtext">Time Table</span>
                        </a>

                    </li>



                </ul>
            </li>
            
            <li class="pcoded-hasmenu ">
                <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="feather icon-users"></i></span>
                    <span class="pcoded-mtext">Teacher Affairs</span>
                </a>
                <ul class="pcoded-submenu">

                    <li class="">
                        <a href="teacherregistration.php">

                            <span class="pcoded-mtext">Teacher Registration</span>
                        </a>

                    </li>


                
                </ul>
            </li>
            <li class="pcoded-hasmenu ">
                <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="feather icon-users"></i></span>
                    <span class="pcoded-mtext">Student Affairs</span>
                </a>
                <ul class="pcoded-submenu">

                    <li class="">
                        <a href="studentregistration.php">

                            <span class="pcoded-mtext">Student Registration</span>
                        </a>

                    </li>


                    <li class="">
                        <a href="viwestudent.php">

                            <span class="pcoded-mtext">Student Profile</span>
                        </a>

                    </li>
                </ul>
            </li>


            <li class="pcoded-hasmenu ">
                <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="feather icon-box"></i></span>
                    <span class="pcoded-mtext">Masters</span>
                </a>
                <ul class="pcoded-submenu">




                        <li class="">
                            <a href="#">
                                <span class="pcoded-mtext">Assessment Type master</span>
                            </a>
                        </li>
                        
                         <li class="">
                             <a href="grademmaster.php">
                                <span class="pcoded-mtext">Grade Master</span>
                            </a>
                        </li>
                         <li class="">
                             <a href="classroommaster.php">
                                <span class="pcoded-mtext">Class Room Master</span>
                            </a>
                        </li>
                        
                        <li class="">
                            <a href="classmaster.php">
                                <span class="pcoded-mtext">Class Master</span>
                            </a>
                        </li>
                        
                        
                        <li class="">
                            <a href="#">
                                <span class="pcoded-mtext">Subject Master</span>
                            </a>
                        </li>



                </ul>
            </li>
        </ul>
    </div>
</nav>