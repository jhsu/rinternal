class SessionsController < ApplicationController
  def create
    omniauth = request.env["omniauth.auth"]
    uid = omniauth["uid"].to_s
    @user = User.find_or_create_by_provider_and_uid(params[:provider], uid,
      email: omniauth["email"])
    session[:user_id] = @user.id

    if @user.username
      redirect_to root_url
    else
      redirect_to set_username_path
    end
  end

  def failure
    raise request.env["omniauth.auth"].to_yaml
  end

  def set_username
    unless @user = current_user
      redirect_to root_url
    end
  end

end
