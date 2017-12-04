class AuthenticationController < ApplicationController
  def authenticate
    command = AuthenticatePoliceStation.call(params[:username], params[:password])
    if command.success?
      render json: { auth_token: command.result, id: PoliceStation.find_by_username(params[:username]).id }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
