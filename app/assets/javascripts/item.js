$(function() {

// ******* ITEM CONSTRUCTOR *******

function Item(obj, listPoints) {
  console.log(listPoints)
  this.id = obj.id;
  this.title = obj.title;
  this.list_id = obj.list_id;
  this.points = obj.points;
  this.pointsStr = this.points === 1 ? `${this.points} Point` : `${this.points} Points`;
  this.tags = obj.tags || [];
  this.totalListPoints = listPoints;
  this.row = () => {
    const row = `<tr>
      <td><a href="/lists/${this.list_id}/items/${this.id}">${this.title}</a></td>
      <td>${this.pointsStr}</td>
      <td><a confirm="Are you sure?" rel="nofollow" data-method="delete" href="/lists/${this.list_id}/items/${this.id}">X</a></td>
    </tr>`;
    return row;
  }
  this.totalPointRows = () => {
    const row = `<tr class="total-points-row"><td></td>
      <td>Total: ${listPoints}</td>
      <td></td></tr>`;
    return row;
  }
  this.addNewTableRows = () => {
    $(".total-points-row").remove();
    $(".user_list_table").append(this.row);
    $(".user_list_table").append(this.totalPointRows);
  }
  this.updateTags = () => {
    const currentTags = $(".list_show_tags div")
      .toArray()
      .map(function(tag) {
        return tag.innerText;
      })

    this.tags.forEach(tag => {
      if (!currentTags.includes(tag.name)) {
        $(".list_show_tags").append(`<div>${tag.name}</div>`);
      }
    })
  }
  this.createItemLi = () => {
    const li = `<li>${this.title}: ${this.pointsStr}</li>`;
    return li;
  }
}
// ******* END OF ITEM CONSTRUCTOR *******


// ******* AJAX CALLS *******

  $("#new_item").on("submit", function() {
    event.preventDefault();
    createListItem(this);
  })

  $(".show-list-btn").on("click", function() {
    event.preventDefault();

    getLastCreateListItems();

  })


// ******* END OF AJAX CALLS *******


// ******* items#last_day_items HELPERS *******

  function getLastCreateListItems() {
    $.get(`/last_day_items`, function(res) {
      hideListBtn();
      if (res.items.length) {
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
    $(".last_list--title").text(date);
  }

  function updateListUl(arr) {
    const str = arr.reduce((acc, item) => {
      // console.log(item.createItemLi)
      return acc += item.createItemLi();
    }, "")
    console.log(str)
    $(".last-list-items-ul").append(str);
  }

  function hideListBtn() {
    $(".show-list-btn").hide();
  }

  // ******* items#last_day_items HELPERS *******

  // ******* last_day_items HELPERS *******

  function createListItem(form) {
    const url = $(form).attr('action');
    const formData = $(form).serialize();

    $.post(url, formData, function(response) {
      enableFormSubmit();

      if (response.errors) {
        displayErrors(response.errors)
      }
      else {
        $.get(`/lists/${response.list_id}/get_list`, function(res) {
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


})
