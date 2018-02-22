class UsersController < ApplicationController
  before_action :authenticate_user!
  helper_method :users_high_points_lists

  def most_used_tags
    current_user.user_tags_sorted

    render 'tags/tags_tally'
  end

  def users_high_points_lists
    List.high_points.where("user_id = ?", current_user.id)
  end

end
