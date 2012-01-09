class DashboardsController < ApplicationController
  def frontpage
    redirect_to '/auth/github' unless current_user
  end
end
