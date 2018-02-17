module ApplicationHelper

  def user_lists
    current_user.lists
  end

  def find_list_by_user_and_day(lists, date)
    lists.select{|l| l.date == date}.first
  end

  def find_user_list_by_id(lists, id)
    lists.select{|l| l.id == id.to_i}.first
  end

  def table_cell_colour(list)
    if list.nil? || !list.total_points
      "colour--start"
    elsif list.total_points.between?(1, 3)
      "colour--lightest clickable"
    elsif list.total_points < 6
      "colour--light clickable"
    elsif list.total_points < 10
      "colour--med clickable"
    elsif list.total_points < 15
      "colour--dark clickable"
    else
      "colour--darkest clickable"
    end
  end

  def formatted_date(date)
    date.strftime("%A, %B %d, %Y")
  end

  def record_not_found
    redirect_to root_path
  end
end
