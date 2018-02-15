class ListsController < ApplicationController

  def index
    @lists = current_user
  end

  def show
  end

end
