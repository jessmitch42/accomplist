$(function() {

  // creating a new item on the list show page
  $("#new_item").on("submit", function() {
    event.preventDefault();
    createListItem(this);
  })




  function Item(obj, listPoints) {
    this.id = obj.id;
    this.title = obj.title;
    this.list_id = obj.list_id;
    this.points = obj.points;
    this.tags = obj.tags || [];
    this.totalListPoints = listPoints;
    this.row = () => {
      const points = this.points === 1 ? `${this.points} Point` : `${this.points} Points`;
      const row = `<tr>
        <td><a href="/lists/${this.list_id}/items/${this.id}">${this.title}</a></td>
        <td>${points}</td>
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
      console.log("table rows!")
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


  }

  function createListItem(form) {
    const url = $(form).attr('action');
    const formData = $(form).serialize();

    $.post(url, formData, function(response) {
      console.log(response)
      enableFormSubmit();

      if (response.errors) {
        displayErrors(response.errors)
      }
      else {
        $.get(`/lists/${response.list_id}/get_json`, function(res) {
          console.log(res)
          clearForm();
          let listPoints = parseInt(res.total_points) || 0;
          const newItem = new Item(response, listPoints);
          newItem.addNewTableRows();
          newItem.updateTags()
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
