class AuthenticationsController < ApplicationController

  include OauthCookieHelper

  def destroy
    authentication = current_user.authentications.find(params[:id])
    authentication.destroy
    remove_user_cookie
    redirect_to profile_path
  end
end
