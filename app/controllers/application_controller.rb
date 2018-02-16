class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :all_lists_for_user, :find_list_by_user_and_day, :table_cell_colour, :add_link_if_list_exists
  #
  # def find_list_by_date(date)
  #   if current_user.lists.where('date = ?', date).exists?
  #     current_user.lists.find_by('date = ?', date)
  #   end
  # end

  def all_lists_for_user
    current_user.lists
  end

  def find_list_by_user_and_day(user_lists, date)
    user_lists.select{|l| l.date == date}.first
  end

  def table_cell_colour(list)
    if list.nil? || !list.total_points
      "colour--start"
    elsif list.total_points < 3
      "colour--lightest clickable"
    elsif list.total_points < 5
      "colour--light clickable"
    elsif list.total_points < 7
      "colour--med clickable"
    elsif list.total_points < 9
      "colour--dark clickable"
    else
      "colour--darkest clickable"
    end
  end

end
