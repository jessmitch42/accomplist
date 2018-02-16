class ItemsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    item = @list.items.build(item_params)

    if item.save
      update_total_point(@list, item, true)

      redirect_to list_path(@list)
    else
      @list = List.find(params[:list_id])
      @errors = item.errors.messages
      render 'lists/show'
    end
  end

  def destroy
    @list = List.find(params[:list_id])

    item = @list.items.find(params[:id])
    if item
      item.delete
    end
    redirect_to list_path(@list)
  end

  private

  def update_total_point(list, item, add)
    if add
      list.total_points = list.total_points + item.points
    else
      list.total_points = list.total_points - item.points
    end
    list.save
  end

  def item_params
    params.require(:item).permit(:title, :points, :list_id)
  end

end
