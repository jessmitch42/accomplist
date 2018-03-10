
$(function() {

  function Item(obj) {
    this.id = obj.id;
    this.title = obj.title;
    this.list_id = obj.list_id;
    this.points = obj.points;
    this.tags = obj.tags || [];
  }

  function createListItem(form) {
    event.preventDefault();

    const url = $(form).attr('action');
    const formData = $(form).serialize();

    $.post(url, formData, function(response) {
      console.log(response)
      if (response.errors) {
        displayErrors(response.errors)
      }
      else {
        clearForm();
        // show new item in list
      }
    })
  }

  function clearForm() {
    $("#item_title").val("");
    $("#item_points_1").click();
    $("input:checkbox").removeAttr("checked");
    $("#item_tags_attributes_0_name").val("");
  }

  function displayErrors(err) {
    const msgs = err.reduce((acc, item) => {
      return acc += `${item.error}. `
    })

    $("p.item_form_errors").text(msgs);
  }
  // creating a new item on the list show page
  $("#new_item").on("submit", function() {
    createListItem(this);
  })

})
