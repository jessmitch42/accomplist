class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # general redirect for tomfoolery
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  include ApplicationHelper

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end
end
