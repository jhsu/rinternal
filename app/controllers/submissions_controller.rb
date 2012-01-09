class SubmissionsController < ApplicationController
  def new
    @submission = SubmissionDecorator.new(Submission.new)
  end

  def create
    type = params[:submission].delete(:type)
    @submission = Submission.create_type(type, params[:submission])
  end
end
