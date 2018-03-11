class TagsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tags = Tag.all
    render json: @tags
  end

end
