module ApplicationHelper
  def username
    current_user.email.split("@")[0]
  end

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
    if list.nil? || !list.total_points || list.total_points == 0
      "colour--start"
    elsif list.total_points < 3
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


  def most_used_tag
    # get all tags
    tags = []
    current_user.lists.each do |list|
      list.items.each do |item|
        item.tags.each { |tag| tags << tag }
      end
    end

    # count tags
    counter = {}
    tags.each do |t|
      if counter[t.name]
        counter[t.name] = counter[t.name] + 1
      else
        counter[t.name] = 1
      end
    end

    # sort tags
    @tags = counter.sort_by {|_key, value| value}.reverse
    render 'tags/most_used_tag'
  end

end
