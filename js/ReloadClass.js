
function get_class()
{
   
     var grade_id = document.getElementById("grade_id").value;
     var temp_parm = "grade_id="+grade_id;
     
     
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../../controller/super/ReloadClass.php?"+temp_parm, false);
    xmlhttp.send(null);
    document.getElementById("class_name").innerHTML = xmlhttp.responseText;
    
}


get_class();





        