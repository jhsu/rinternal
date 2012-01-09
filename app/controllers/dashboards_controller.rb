class DashboardsController < ApplicationController
  def frontpage
    @submissions = Submission.order('created_at DESC').limit(25).all
  end
end
