class ListsController < ApplicationController
  helper_method :todays_list, :formatted_date

  def index
    @lists = current_user.lists
  end

  def show
    @list = todays_list
  end

  def todays_list
    @list = current_user.todays_list
  end

  def formatted_date(date)
    date.strftime("%A, %B, %Y")
  end

end
