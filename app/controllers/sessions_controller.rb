class SessionsController < ApplicationController
  def create
    uid = request.env["omniauth.auth"]["uid"]
    @user = User.find_or_create_by_provider_and_uid(params[:provider], uid)
  end
end
