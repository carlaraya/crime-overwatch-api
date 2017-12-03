class ApplicationController < ActionController::API
  #before_action :authenticate_request
  attr_reader :current_police_station
  private
  def authenticate_request
    @current_police_station = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless (@current_police_station and @police_station and @current_police_station.id == @police_station.id)
  end
  def authenticate_request_set
    @current_police_station = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless (@current_police_station and @police_stations and @current_police_station.in? @police_stations)
  end
  def auth_request_any
    @current_police_station = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_police_station
  end
end
