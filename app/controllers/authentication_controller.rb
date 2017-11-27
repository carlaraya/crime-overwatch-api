class AuthenticationController < ApplicationController
  def authenticate
    command = AuthenticatePoliceStation.call(params[:username], params[:password])
    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
