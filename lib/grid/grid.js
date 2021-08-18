$(document).ready(function(){
      
    
    var subject,class_room;
        $.ajax({
        type: "GET",
        url: "../../lib/grid/getsubjects.php",
        dataType: "html",
        context: document.body,
        async:true,
        success: function (data) {
            
            subject= data.toString();
        }
    });
    
    
          $.ajax({
        type: "GET",
        url: "../../lib/grid/getclassrooms.php",
        dataType: "html",
        context: document.body,
        async:true,
        success: function (data) {
            
            class_room= data.toString();
        }
    });



 //$('[data-toggle="tooltip"]').tooltip();
 var actions = $("table td:last-child").html();
 // Append table with add row form on add new button click
    $(".add-new").click(function(){
  $(this).attr("disabled", "disabled");
  var index = $("#example-1 tbody tr:last-child").index();
        var row = '<tr>' +
            '<td><select class="form-control" id="subject_name" name="subject_name" >'+subject+'</select></td>' +
            '<td><select class="form-control " id="room_id" name="room_id" >'+class_room+'</select></td>' +
           
    
            '<td>  <a class="add" title="Add" data-toggle="tooltip" id="0"><i class="fa fa-user-plus"></i></a>  \n\
                    <a class="edit" title="Edit" data-toggle="tooltip" id="1"><i class="fa fa-pencil"></i></a>\n\
                      <a class="delete" title="Delete"  id="2"><i class="fa fa-trash-o"></i></a>  </td>'+
            
  
        '</tr>';
     $("#example-1").append(row);  
  $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
        $('[data-toggle="tooltip"]').tooltip();
    });
  
 // Add row on add button click
 $(document).on("click", ".add", function(){
  var empty = false;
  var input_data = $(this).parents("tr").find('select option:selected ');
  var input = $(this).parents("tr").find('select');
        input.each(function(){
   if(!$(this).val()){
    $(this).addClass("error");
    empty = true;
   } else{
                $(this).removeClass("error");
            }
  });
  var txtsubject_name = $("#subject_name").val();
  var txtdepartment = $("#txtdepartment").val();
  var txtphone = $("#txtphone").val();
 

 
  if(!empty){
        var i = 0;
   input.each(function(){
       
      // alert($(this).val());
  
    if (i==0){
        $(this).parent("td").html($(this).find('option:selected ').text()+"<br><input type='hidden' name='subject_name[]' value='"+$(this).val()+"'/>");
   
       i++;}
   
   if (i==1){
       $(this).parent("td").html($(this).find('option:selected ').text()+"<br><input type='hidden' name='class_room[]' value='"+$(this).val()+"'/>");
   
   }

});   
   $(this).parents("tr").find(".add, .edit").toggle();
   $(".add-new").removeAttr("disabled");
  } 
    });
 // Delete row on delete button click
 $(document).on("click", ".delete", function(){
    
        $(this).parents("tr").remove();
  $(".add-new").removeAttr("disabled");
 
  var id = $(this).attr("id");
  var string = id;
 
    });
 // update rec row on edit button click
 $(document).on("click", ".update", function(){
  var id = $(this).attr("id");
  var string = id;
        var txtname = $("#txtname").val();
  var txtdepartment = $("#txtdepartment").val();
  var txtphone = $("#txtphone").val();
 
    });
 // Edit row on edit button click

 $(document).on("click", ".edit", function(){  
     
   
     
        $(this).parents("tr").find("td:not(:last-child)").each(function(i){
   if (i=='0'){
    var idname = 'txtname';
   }else if (i=='1'){
    var idname = 'txtdepartment';
   }else{} 
   if(i==0){
   $(this).html('<select form-control id="subject_name" name="subject_name" ><option value="'+$(this).find('input[type="hidden"]').val()+'" selected>'+$(this).text()+'</option>'+subject+'</select>');
  
  }
  
   if(i==1){
   $(this).html('<select form-control id="room_id" name="room_id" ><option value="'+$(this).find('input[type="hidden"]').val()+'" selected>'+$(this).text()+'</option>'+class_room+'</select>');
 
  }
  
});  


  $(this).parents("tr").find(".add, .edit").toggle();
  
  if(!$(this)){
       var i = 0;
   $(this).each(function(){
       
      // alert($(this).val());
  
    if (i==0){
        $(this).parent("td").html($(this).find('option:selected ').text()+"<br><input type='hidden' name='subject_name[]' value='"+$(this).val()+"'/>");
   
       i++;}
   
   if (i==1){
       $(this).parent("td").html($(this).find('option:selected ').text()+"<br><input type='hidden' name='class_room[]' value='"+$(this).val()+"'/>");
   
   }

});   
   $(this).parents("tr").find(".add, .edit").toggle();
   $(".add-new").removeAttr("disabled");
  }
    });
});