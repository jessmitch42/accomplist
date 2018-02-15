class ListsController < ApplicationController

  def index
    @lists = current_user
  end

  def show

  end

  def new
    if !todays_list_exists?
      @list = List.create(user_id: current_user.id, date: Date.today)
    else
      @list = todays_list
    end

    redirect_to user_list_path(current_user, @list)
  end

  def todays_list_exists?
    List.where("date = ?", Date.today).exists?
  end

  def todays_list
    List.where("date = ?", Date.today).first
  end

end
