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

  def new
    @list = List.find(params[:list_id])
    @item = @list.items.build()
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    @item.update(item_params)

    update_total_point(@list, @item, true)

    redirect_to list_path(@list)
    #
    # if @item.save
    #   update_total_point(@list, @item, true)
    #
    #   redirect_to list_path(@list)
    # else
    #   render 'lists/show'
    # end
  end

  def index
    @list = find_user_list_by_id(user_lists, params[:list_id])
    @items = @list.items
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

  def item_params
    params.require(:item).permit(:title, :points, :list_id, :tag_ids => [], tags_attributes: [:name])
  end

  def redirect_to_list_path
    @list = List.find(params[:list_id])
    redirect_to list_path(@list)
  end

  #should be moved to list model i think
  def update_total_point(list, item, add = false)
    if add
      list.total_points = list.total_points + item.points
    else
      list.total_points = list.total_points - item.points
    end
    list.save
  end

end
