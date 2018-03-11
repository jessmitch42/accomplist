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

  def get_json
    @list = List.find(params[:id])
    render json: @list
  end

end
