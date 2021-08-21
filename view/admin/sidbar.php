<nav class="pcoded-navbar">
<div class="pcoded-inner-navbar main-menu">
<div class="pcoded-navigatio-lavel"> 
   <?php
            if ($_SESSION['threeedu_user_id'] == 1)
                {
                 echo 'Head Teacher Account';
                } 
            else if ($_SESSION['threeedu_user_id'] == 4) 
                {
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

    
    <li class="">
        <a href="teacherregistration.php">
            <span class="pcoded-mtext">Teacher Registration</span>
        </a>
    </li>
     <li class="">
        <a href="dashboard-crm.html">
            <span class="pcoded-mtext">Student Registration</span>
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
        <a href="sequncemaster.php">
            <span class="pcoded-mtext">Sequence Master</span>
        </a>
    </li>
     
    
    


</ul>
</li>
</ul>
</div>
</nav>