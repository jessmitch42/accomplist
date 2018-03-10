
$(function() {

  function createListItem(form) {
    event.preventDefault();
    const url = $(form).attr('action');
    const formData = $(form).serialize();

    $.post(url, formData, function(response) {
      console.log(response)
      enableFormSubmit();

      if (response.errors) {
        displayErrors(response.errors)
      }
      else {
        clearForm();

        const newItem = new Item(response);
      }
    })
  }

  function enableFormSubmit() {
    $("#new_item input[type=submit]").attr("disabled", false);
  }
  function clearForm() {
    $("#item_title").val("");
    $("#item_points_1").click();
    $("input:checkbox").removeAttr("checked");
    $("#item_tags_attributes_0_name").val("");
    $("p.item_form_errors").text("");
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
