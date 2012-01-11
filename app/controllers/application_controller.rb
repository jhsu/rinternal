class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= if session[:user_id]
        User.find(session[:user_id])
      else
        nil
      end
  end

  private

  def require_user
    unless current_user
      redirect_to root_url
    end
  end

end
