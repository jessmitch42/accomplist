class ListItemsController < ApplicationController

  def new
    @list_item = ListItem.new
  end

  def create
    list_item = ListItem.new(list_item_params)
    if list_item.save
      @list = list_item.list
      binding.pry
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end

  private

  def list_item_params
    params.require(:list_item).permit(:title, :points, :list_id)
  end

end
