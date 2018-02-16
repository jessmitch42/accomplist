class ListsController < ApplicationController
  helper_method :todays_list, :formatted_date

  def index
    @lists = user_lists
  end

  def show
    @list = List.find(params[:id])
    @item = @list.items.build #prebuild an item for form to wrap around
  end

  def todays_list
    @list = current_user.todays_list
  end

end
