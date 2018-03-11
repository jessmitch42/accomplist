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
    this.row = () => {
      const points = this.points === 1 ? "Point" : "Points";
      const row = `<tr class="total-points-row">
        <td><a href="/lists/${this.list_id}/items/${this.id}">trying</a></td>
        <td>${this.points} ${points}</td>
        <td><a confirm="Are you sure?" rel="nofollow" data-method="delete" href="/lists/${this.list_id}/items/${this.id}">X</a></td>
      </tr>`;
      return row;
    }
    this.totalPointRows = () => {
      $.get(`/lists/${this.list_id}/get_json`, function(response) {
        console.log(response)
        const row = `<tr class="total-points-row"><td></td>
          <td>Total: ${response.total_points + this.points}</td>
          <td></td></tr>`;
      })

    }
    this.updateTableRows = () => {
      $(".total_points_row").remove();
      $(".user_list_table").append(this.row);
      $(".user_list_table").append(this.totalPointRows);
    };


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


})
