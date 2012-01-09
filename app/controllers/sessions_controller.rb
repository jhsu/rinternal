class SessionsController < ApplicationController
  def create
    uid = request.env["omniauth.auth"]["uid"].to_s
    @user = User.find_or_create_by_provider_and_uid(params[:provider], uid)
    session[:user_id] = @user.id

    redirect_to root_url
  end
end
