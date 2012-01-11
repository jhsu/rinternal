class UsersController < ApplicationController
  before_filter :require_user

  def edit
    @user = User.find(params[:id])
    can_manage_user?(@user)
  end

  def update
    user = User.find(params[:id])
    can_manage_user?(user)

    if !user.username && username = params[:user].delete(:username)
      user.username = username
    end

    user.attributes = params[:user]
    if user.save
      redirect_to root_url, notice: "Updated your profile."
    end

  end

  def settings
    @user = current_user
    can_manage_user?(@user)
    render :edit
  end

  protected

  def can_manage_user?(user)
    redirect_to root_url unless can?(:manage, user)
  end
end
