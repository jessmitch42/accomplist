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
