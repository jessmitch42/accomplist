class ItemsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)

    if @item.save
      update_total_point(@list, @item, true)

      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end

  def redirect_to_list_path
    @list = List.find(params[:list_id])
    redirect_to list_path(@list)
  end

  def show
    redirect_to_list_path
  end

  def index
    redirect_to_list_path
  end

  def destroy
    @list = List.find(params[:list_id])

    item = @list.items.find(params[:id])
    if item
      update_total_point(@list, item)
      item.delete
    end
    redirect_to list_path(@list)
  end

  private

  def update_total_point(list, item, add = false)
    if add
      list.total_points = list.total_points + item.points
    else
      list.total_points = list.total_points - item.points
    end
    list.save
  end

  def item_params
    params.require(:item).permit(:title, :points, :list_id, :tag_ids => [], tags_attributes: [:name])
  end

end
