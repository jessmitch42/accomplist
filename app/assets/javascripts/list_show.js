
$(function() {

  function createListItem() {

  }

  $("#new_item").on("submit", function() {
    const url = $(this).attr('action');
    const formData = $(this).serialize();
    console.log(formData)
    console.log(url)
    $.post(url, formData)
      .done((response) => {
        console.log(response)
      })

  })

})
