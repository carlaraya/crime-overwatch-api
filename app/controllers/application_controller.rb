class ApplicationController < ActionController::API
  #before_action :authenticate_request
  attr_reader :current_police_station
  private
  def authenticate_request
    @current_police_station = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_police_station
  end
end
