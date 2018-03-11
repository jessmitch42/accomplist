class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    lists = user_lists
    @lists = user_lists.order("date DESC")
  end

  def show
    @list = List.find(params[:id])
    @item = @list.items.build #prebuild an item for form to wrap around
  end

  def get_list
    @list = List.find(params[:id])
    render json: @list
  end

  def show_js
    list = List.find(params[:id])
    @date = formatted_date(list.date)
    @items = list.items
    render :json => {:list_date => @date,
                     :items => @items }
  end

end
