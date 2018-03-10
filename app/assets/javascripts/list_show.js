
$(function() {

  function createListItem() {

  }

  $("#new_item").on("submit", function() {
    event.preventDefault();
    
    const url = $(this).attr('action');
    const formData = $(this).serialize();
    console.log(formData)
    console.log(url)
    $.post(url, formData, function(response) {
      console.log(response)
    })

  })

})
