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
        .reduce((str, tag) => {
          return str += `<span class="tag-name__span"> ${tag.name} | </span>`;
        }, "")
        .slice(0,-2);

      attachTagsToDiv(tagStr)
    })
  };

  function attachTagsToDiv(str) {
    $(".all-tags__container").empty();
    $(".all-tags__container").append(str);
  }

  // ******* END OF tags#index HELPERS *******

})
