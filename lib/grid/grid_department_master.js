$(document).ready(function () {








    //$('[data-toggle="tooltip"]').tooltip();
    var actions = $("table td:last-child").html();
    // Append table with add row form on add new button click
    $(".add-new").click(function () {
        $(this).attr("disabled", "disabled");
        var index = $("#edu_example-3 tbody tr:last-child").index();
        var row = '<tr>' +
                '<td><input class="form-control" id="classroom_name" name="grade_name[]" type="text"  placeholder="Enter Department Name">\n\
               <input class="form-control" type="hidden" name="grade_public_id[]" ></td>' +
                '<td>  <a class="add" title="Add" data-toggle="tooltip" id="0"><i class="fa fa-user-plus"></i></a>  \n\
                    <a class="edit" title="Edit" data-toggle="tooltip" id="1"><i class="fa fa-pencil"></i></a>\n\
                      <a class="delete" title="Delete"  id="2"><i class="fa fa-trash-o"></i></a>  </td>' +
                '</tr>';
        $("#edu_example-3").append(row);
        $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
        $('[data-toggle="tooltip"]').tooltip();
    });

    // Add row on add button click
    $(document).on("click", ".add", function () {

        var rows = $("tr").find("#txt_data_name");



        var empty = false;
        var input_data = $(this).parents("tr").find('td:not(:last-child)');
        var input = $(this).parents("tr").find('input[type="text"]');
        input.each(function () {
            if (!$(this).val()) {
                $(this).addClass("error");
                empty = true;
            } else {
                $(this).removeClass("error");
            }
        });
        var txtsubject_name = $("#subject_name").val();
        var txtdepartment = $("#txtdepartment").val();
        var txtphone = $("#txtphone").val();


        var isDuplicate = false;
        if (!empty) {
            var i = 0;
            input_data.each(function () {

                // alert($(this).val());

                var inputed_data_element = $(this);
                var inputed_data = $(this).find('input[name="grade_name[]').val();
                var row_data = "";

                rows.each(function () {

                    row_data = $(this).val();
                    if (inputed_data === row_data) {
                        inputed_data_element.find('input[name="grade_name[]').val('');
                        isDuplicate = true;
                        showWarningToast('You Can Not Enter Duplicate Class Room Name');

                    }

                }


                );


                if (!isDuplicate) {
                    input.parent("td").html($(this).find('input[name="grade_name[]').val() + "<input id='txt_data_name' type='hidden' name='grade_name[]' value='" + $(this).find('input[name="grade_name[]"]').val() + "'/><input class='form-control' type='hidden' name='grade_public_id[]' value='" + $(this).find('input[name="grade_public_id[]"]').val() + "'/>");

                }




            });
            if (!isDuplicate) {
                $(this).parents("tr").find(".add, .edit").toggle();
                $(".add-new").removeAttr("disabled");
            }
        }
    });
    // Delete row on delete button click
    $(document).on("click", ".delete", function () {

        $(this).parents("tr").remove();
        $(".add-new").removeAttr("disabled");

        var id = $(this).attr("id");
        var string = id;

    });
    // update rec row on edit button click
    $(document).on("click", ".update", function () {
        var id = $(this).attr("id");
        var string = id;
        var txtname = $("#txtname").val();
        var txtdepartment = $("#txtdepartment").val();
        var txtphone = $("#txtphone").val();

    });
    // Edit row on edit button click

    $(document).on("click", ".edit", function () {



        $(this).parents("tr").find("td:not(:last-child)").each(function (i) {
            if (i == '0') {
                var idname = 'txtname';
            } else if (i == '1') {
                var idname = 'txtdepartment';
            } else {
            }


            $(this).html("<input class='form-control' type='text' name='grade_name[]' value='" + $(this).find('input[name="grade_name[]"]').val() + "'/><input class='form-control' type='hidden' name='grade_public_id[]' value='" + $(this).find('input[name="grade_public_id[]"]').val() + "'/>");


        });


        $(this).parents("tr").find(".add, .edit").toggle();

        if (!$(this)) {
            var i = 0;
            $(this).each(function () {

                // alert($(this).val());
                var public_id_data = $(this).find('input[name="grade_public_id[]"]').val();
                var public_id = "";
                if (public_id_data === undefined)
                {
                    public_id = "";
                } else
                {

                    public_id = $(this).find('input[name="grade_public_id[]"]').val();
                }
                $(this).parent("td").html($(this).val() + "<input type='hidden' name='grade_name[]' value='" + $(this).val() + "'/><input class='form-control' type='hidden' name='grade_public_id[]' value='" + public_id + "'/>");




            });
            $(this).parents("tr").find(".add, .edit").toggle();
            $(".add-new").removeAttr("disabled");
        }
    });
});