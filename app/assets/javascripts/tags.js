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
      const tagStr = res
        .sort((a, b) => {
          // console.log(a)
          if (a.name.toUpperCase() < b.name.toUpperCase()) {
            return -1;
          }
          else if (a.name.toUpperCase() > b.name.toUpperCase()) {
            return 1;
          }
          else{
            return 0;
          }
        })
        .reduce((str, tag) => {
          return str += ` ${tag.name} |`;
        }, "")
        .slice(0, -2);

      attachTagsToDiv(tagStr)
    })
  };

  function attachTagsToDiv(str) {
    $(".all-tags__container").empty();
    $(".all-tags__container").append(str);
  }

  // ******* END OF tags#index HELPERS *******

})
