function createListItem() {
  const newItem = {
    "item": {
      "title:",
      "points",
      "list_id",
      "tag_ids": [], 
      "tags_attributes":
    }
  };

  $.post("/list/:id", newItem)
    .done((response) => {
      console.log(response)
    })
}
