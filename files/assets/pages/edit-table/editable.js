  'use strict';
$(document).ready(function() {  
$('#example-1').Tabledit({

    editButton: false,
    deleteButton: false,
    hideIdentifier: true,
    columns: {
        identifier: [0, 'id'],
        editable: [[1, 'First Name'], [2, 'Last Name']]
    }
});

});
function add_row()
{
    var table = document.getElementById("example-1");
    var t1=(table.rows.length);
    var row = table.insertRow(t1);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
 

cell1.className='abc';
cell2.className='abc';

   $('<span class="tabledit-span" >Select Subject</span>\n\
        <select class="tabledit-input form-control input-sm" name="subjectcode_id[]"  disabled="" >\n\
        <option value="MATH">Mathematics</option>\n\
        <option value="ENG">English</option>\n\
        <option value="HIST">History</option>\n\
        </select>').appendTo(cell1);
    
    $('<span class="tabledit-span" >Select Room</span>\n\
        <select class="tabledit-input form-control input-sm " name="class_room_id[]"  disabled="" >\n\
        <option value="CLRM0000000001">Room 1</option>\n\
        <option value="CLRM0000000002">Room 2</option>\n\
        <option value="CLRM0000000003">Room 3</option>\n\
        </select>').appendTo(cell2);

    
};

