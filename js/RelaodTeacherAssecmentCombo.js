
function get_subjects()
{
    var school_id = document.getElementById("school_id").value;
     var class_id = document.getElementById("selected_class_id").value;
     var temp_parm = "class_id="+class_id+"&school_id="+school_id;
     
     
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../../controller/super/ReloadClasses.php?id=1&&"+temp_parm, false);
    xmlhttp.send(null);
    document.getElementById("subject_id").innerHTML = xmlhttp.responseText;
    
}

function get_assesment_types()
{
    var tenant_id = document.getElementById("tenant_id").value;
    var class_id = document.getElementById("selected_class_id").value;
     var subject_id = document.getElementById("subject_id").value;
     var temp_parm = "class_id="+class_id+"&&subject_id="+subject_id+"&tenant_id="+tenant_id;
     
     
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../../controller/super/ReloadClasses.php?id=2&&"+temp_parm, false);
    xmlhttp.send(null);
    document.getElementById("assecmenttype_id").innerHTML = xmlhttp.responseText;
    
}

function get_studentdata()
{
    var class_id = document.getElementById("selected_class_id").value;
     var assecmenttype_id = document.getElementById("assecmenttype_id").value;
  
     var temp_parm = "class_id="+class_id+"&&assecmenttype_id="+assecmenttype_id;;
     
     
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../../controller/super/ReloadClasses.php?id=3&&"+temp_parm, false);
    xmlhttp.send(null);
    document.getElementById("student_data").innerHTML = xmlhttp.responseText;
    
}



get_subjects();
get_assesment_types();



        