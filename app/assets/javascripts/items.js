
$(function() {

// ******* AJAX CALLS *******

  $("#new_item").on("submit", function() {
    event.preventDefault();
    console.log("here prevent")
    createListItem(this);
  })


// ******* END OF AJAX CALLS *******


  // ******* create item HELPERS *******

  function createListItem(form) {
    const url = $(form).attr('action');
    const formData = $(form).serialize();

    $.post(url, formData, function(response) {
      enableFormSubmit();
      console.log(response)
      if (response.errors) {
        displayErrors(response.errors)
      }
      else {
        $.get(`/lists/${response.list_id}/get_list`, function(res) {
          console.log(res)
          const listPoints = parseInt(res.total_points) || 0;
          const newItem = new Item(response, listPoints);

          clearForm();
          newItem.addNewTableRows();
          newItem.updateTags();
        })

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

  // ******* END OF create item HELPERS *******


})
