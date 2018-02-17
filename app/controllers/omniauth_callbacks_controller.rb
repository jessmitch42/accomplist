class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
     sign_in_redirect
  end

  def github
     sign_in_redirect
  end

  def sign_in_redirect
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
end
