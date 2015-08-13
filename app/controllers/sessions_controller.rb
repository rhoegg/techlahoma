class SessionsController < ApplicationController
  protect_from_forgery :except => :create
  def new
  end

  def create
    authentication = Authentication.from_omniauth(omniauth_params,current_user)
    user = authentication.user
    session[:user_id] = user.id
    redirect_to profile_path, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def omniauth_failure
  end

  def omniauth_params
    # TODO : Fix this to use strong params. This just allows the whole shooting match through.
    ActiveSupport::HashWithIndifferentAccess.new(env["omniauth.auth"])
  end
end
