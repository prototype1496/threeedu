
function get_subjects()
{
   
     var class_id = document.getElementById("class_id").value;
     var temp_parm = "class_id="+class_id;
     
    
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../../controller/super/ReloadSubjects.php?subject=1&&"+temp_parm, false);
    xmlhttp.send(null);
    document.getElementById("subject_1").innerHTML = xmlhttp.responseText;
    
    
     xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../../controller/super/ReloadSubjects.php?subject=2&&"+temp_parm, false);
    xmlhttp.send(null);
    document.getElementById("subject_2").innerHTML = xmlhttp.responseText;
    
    
    
     xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../../controller/super/ReloadSubjects.php?subject=3&&"+temp_parm, false);
    xmlhttp.send(null);
    document.getElementById("subject_3").innerHTML = xmlhttp.responseText;
    
    
    
     xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../../controller/super/ReloadSubjects.php?subject=4&&"+temp_parm, false);
    xmlhttp.send(null);
    document.getElementById("subject_4").innerHTML = xmlhttp.responseText;
    
    
    
     xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../../controller/super/ReloadSubjects.php?subject=5&&"+temp_parm, false);
    xmlhttp.send(null);
    document.getElementById("subject_5").innerHTML = xmlhttp.responseText;
    
    
    
    
      xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../../controller/super/ReloadSubjects.php?subject=6&&"+temp_parm, false);
    xmlhttp.send(null);
    document.getElementById("subject_6").innerHTML = xmlhttp.responseText;
    
    
    
     xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../../controller/super/ReloadSubjects.php?subject=7&&"+temp_parm, false);
    xmlhttp.send(null);
    document.getElementById("subject_7").innerHTML = xmlhttp.responseText;
    
    
    
     xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../../controller/super/ReloadSubjects.php?subject=8&&"+temp_parm, false);
    xmlhttp.send(null);
    document.getElementById("subject_8").innerHTML = xmlhttp.responseText;
    
}

get_subjects();




        