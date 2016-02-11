class Oauth::UsersController < ApplicationController
  before_action :doorkeeper_authorize! # Require access token for all actions
  #respond_to     :json

  # GET /me.json
  def me
    render json: current_resource_owner.as_json
  end

  private

  # Find the user that owns the access token
  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

end

