function get_subjects() {
    console.log("get_subjects")
    const school_id = document.getElementById("school_id");
    const subject_id = document.getElementById("subject_id");
    const class_id = document.getElementById("selected_class_id");

    if (typeof (class_id) != 'undefined' &&  typeof(school_id) != 'undefined' && school_id != null) {
        let temp_parm = "class_id=" + class_id.value + "&school_id=" + school_id.value;
        xmlhttp = new XMLHttpRequest();
        xmlhttp.open("GET", "../../controller/super/ReloadClasses.php?id=1&&" + temp_parm, false);
        xmlhttp.send(null);
        if ( typeof(subject_id) != 'undefined' && subject_id != null){
            subject_id.innerHTML = xmlhttp.responseText;
        }
    }
}

function get_assesment_types() {
    console.log("get_assesment_types")
    let tenant_id = document.getElementById("tenant_id");
    let class_id = document.getElementById("selected_class_id");
    let subject_id = document.getElementById("subject_id") != null ? document.getElementById("subject_id").value : "";
    let assecmenttype_id = document.getElementById("assecmenttype_id") != null ? document.getElementById("assecmenttype_id").value : "";

    if(typeof(class_id) != 'undefined' && class_id != null){
        if(typeof(tenant_id) != 'undefined' && tenant_id != null){
            let temp_parm = "class_id=" + class_id.value + "&&subject_id=" + subject_id + "&tenant_id=" + tenant_id.value;
            xmlhttp = new XMLHttpRequest();
            xmlhttp.open("GET", "../../controller/super/ReloadClasses.php?id=2&&" + temp_parm, false);
            console.log("url", "../../controller/super/ReloadClasses.php?id=2&&" + temp_parm)
            xmlhttp.send(null);
            if (typeof(assecmenttype_id) != 'undefined' && assecmenttype_id != null)
            {
                assecmenttype_id.innerHTML = xmlhttp.responseText;
                console.log(assecmenttype_id.name)
            }

            if (typeof(subject_id) != 'undefined' && subject_id != null)
            {
                subject_id.innerHTML = xmlhttp.responseText;
                console.log(subject_id.name)
            }
        }
    }
}

function get_terms() {
    let term_id = document.getElementById("term_id");
    if (!term_id) return

    let tenant_id = document.getElementById("tenant_id");
    if (!tenant_id) return

    let temp_parm = "&tenant_id=" + tenant_id.value;
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../../controller/super/ReloadClasses.php?id=6" + temp_parm, false);
    console.log("url", "../../controller/super/ReloadClasses.php?id=6" + temp_parm)
    xmlhttp.send(null);
    console.log("response ::",xmlhttp.responseText)
    term_id.innerHTML = xmlhttp.responseText;
}

function get_assessments() {
    console.log("get_assessments")
    get_terms()
    get_subjects()
    get_assesment_types()
    get_all_student_details()
    console.log("assessments loaded")
}


function get_studentdata() {
    console.log("get_studentdata")
    const class_id = document.getElementById("selected_class_id").value;
    const temp_parm = "class_id=" + class_id ;
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../../controller/super/ReloadClasses.php?id=3&&" + temp_parm, false);
    xmlhttp.send(null);
    console.log("url", "../../controller/super/ReloadClasses.php?id=3&&" + temp_parm)
    console.log(xmlhttp.responseText)
    document.getElementById("student_data").innerHTML = xmlhttp.responseText;
}

function get_all_student_details() {
    console.log('get_all_student_details')
    let student_data = document.getElementById("student_data");
    if (!student_data) return

    let class_id = document.getElementById("class_id");
    if (!class_id) return

    const temp_parm = "class_id=" + class_id.value;

    console.log('classId',class_id.value)
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../../controller/super/ReloadClasses.php?id=5&&" + temp_parm, false);
    xmlhttp.send(null);
    console.log("url", "../../controller/super/ReloadClasses.php?id=5&&" + temp_parm)
    console.log(xmlhttp.responseText)
    student_data.innerHTML = xmlhttp.responseText;
}


get_assessments()



        