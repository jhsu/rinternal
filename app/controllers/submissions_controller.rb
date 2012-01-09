class SubmissionsController < ApplicationController
  def new
    @submission = SubmissionDecorator.new(Submission.new)
  end

  def show
    @submission = SubmissionDecorator.new(Submission.find(params[:id]))
    render :text => @submission.title
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
