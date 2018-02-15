class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user #move to helper

  
end
