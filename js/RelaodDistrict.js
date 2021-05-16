
function get_districts()
{
   
     var provnce_id = document.getElementById("selected_province_id").value;
     var temp_parm = "province_id="+provnce_id;
     
     
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../../controller/super/ReloadDistricts.php?"+temp_parm, false);
    xmlhttp.send(null);
    document.getElementById("districts_by_provincId").innerHTML = xmlhttp.responseText;
    
}

get_districts();




        