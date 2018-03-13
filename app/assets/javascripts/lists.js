$(function() {

  // ******* AJAX CALLS *******

    $(".view-list__button").on("click", function() {
      event.preventDefault();
      const id = $(this).data("id");
      const url = $(this).attr("href");

      getList(id, url);
    })

  // ******* END OF AJAX CALLS *******



  // ******* lists#show_js HELPERS *******

    function getList(id, url) {
      $.get(url, function(res) {
        console.log(res)
        if (res.items && res.items.length) {
          const items = res.items.map(item => new Item(item));
          console.log(items)
          updateListTitle(res.list_date);
          updateListUl(items);
        }
        else {
          const msg = "Oops, you don't have any lists yet."
          updateListTitle(msg);
        }
      })
    }

    function updateListTitle(date) {
      console.log("herreeee" + date)
      $(".last_list--title").text(date);
    }

    function updateListUl(arr) {
      $(".last-list-items-ul").empty();
      const str = arr.reduce((acc, item) => {
        // console.log(item.createItemLi)
        return acc += item.createItemLi();
      }, "")
      console.log(str)
      $(".last-list-items-ul").append(str);
    }
    // ******* lists#show_js HELPERS *******

})
