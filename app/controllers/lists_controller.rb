class ListsController < ApplicationController
  helper_method :todays_list

  def index
    @lists = current_user
  end

  def show

  end

  # def todays_list_exists?
  #   List.where("date = ?", Date.today).exists?
  # end
  #
  # def todays_list
  #   List.where("date = ?", Date.today).first
  # end

  def todays_list
    @list = List.find_or_create_by(date: Date.today)
  end

end
