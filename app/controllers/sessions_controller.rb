class SessionsController < ApplicationController
  def create
    User.find_or_create_by_provider_and_uid
    raise request.env["omniauth.auth"].to_yaml
  end
end
