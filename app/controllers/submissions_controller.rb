class SubmissionsController < ApplicationController
  def new
    @submission = SubmissionDecorator.new(Submission.new)
  end

  def show
    @submission = Submission.includes(:content).find(params[:id])
  end

  def create
    type = params[:submission].delete(:type)
    if @submission = Submission.create_type(type, params[:submission])
      redirect_to submission_path(@submission)
    else
      render :edit
    end
  end
end
