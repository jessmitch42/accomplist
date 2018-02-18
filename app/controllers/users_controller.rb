class UsersController < ApplicationController
  before_action :authenticate_user!

  def most_used_tag
    current_user.user_tags_sorted

    render 'tags/tags_tally'
  end
end
