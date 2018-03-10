
$(function() {


  function createListItem(form) {
    event.preventDefault();

    const url = $(form).attr('action');
    const formData = $(form).serialize();

    $.post(url, formData, function(response) {
      console.log(response)
      clearForm();
    })
  }

  function clearForm() {
    $("#item_title").val("");
    $("#item_points_1").click();
    $("input:checkbox").removeAttr("checked");
    $("#item_tags_attributes_0_name").val("");
  }

  // creating a new item on the list show page
  $("#new_item").on("submit", function() {
    createListItem(this);
  })

})
