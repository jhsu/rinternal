class SubmissionsController < ApplicationController
  before_filter :require_user
  before_filter :can_manage_submissions

  def new
    @submission = SubmissionDecorator.new(Submission.new)
  end

  def show
    @submission = Submission.includes(:content).find(params[:id])
  end

  def create
    type = params[:submission].delete(:type)
    params[:user] = current_user
    if @submission = Submission.create_type(type, params[:submission])
      redirect_to submission_path(@submission)
    else
      render :edit
    end
  end

  def destroy
    submission = Submission.of(current_user).find(params[:id])
    if submission.content.destroy
      redirect_to root_path
    else
      redirect_to submission_path(submission)
    end
  end

  protected

  def can_manage_submissions
    redirect_to root_url unless can?(:manage, Submission)
  end
end
