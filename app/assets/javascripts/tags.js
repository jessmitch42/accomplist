$(function() {
  // ******* AJAX CALLS *******

    $(".show-all-tags").on("click", function() {
      event.preventDefault();
      const url = $(this).attr("href");

      getAllTags(url);
    })

  // ******* END OF AJAX CALLS *******


  // ******* tags#index HELPERS *******

  function getAllTags(url) {
    $.get(url, function(res) {
      console.log(res)
      res.map
    })
  };

  // ******* END OF tags#index HELPERS *******

})
