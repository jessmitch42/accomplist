class ListItemsController < ApplicationController

  def new
    @list_item = ListItem.new
  end

  def create
    list_id = params[:list_item][:list_id]
    @list = find_user_list_by_id(user_lists, list_id)
    @list.list_items.build(list_item_params)

    if @list.save

      redirect_to user_list_path(@list)
    else
      render 'list_items/new'
    end
  end

  private

  def list_item_params
    params.require(:list_item).permit(:title, :points, :list_id)
  end

end
