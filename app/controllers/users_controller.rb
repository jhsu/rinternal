class UsersController < ApplicationController
  def update
    user = User.find(params[:id])

    if !user.username && username = params[:user].delete(:username)
      user.username = username
    end

    user.attributes = params[:user]
    if user.save
      redirect_to root_url, notice: "Updated your profile."
    end

  end
end
