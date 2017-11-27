class PoliceStationsController < ApplicationController
  before_action :set_police_station, only: [:show, :update]
  before_action :authenticate_request, only: [:update]
  before_action :auth_current, only: [:update]

  # GET /police_stations
  def index
    @police_stations = PoliceStation.all

    render json: @police_stations, except: [:password_digest]
  end

  # GET /police_stations/1
  def show
    render json: @police_station
  end

  # PATCH/PUT /police_stations/1
  def update
    if @police_station.update(police_station_params)
      render json: @police_station
    else
      render json: @police_station.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_police_station
      @police_station = PoliceStation.find(params[:id])
    end

    def auth_current
      render json: { error: 'Not Authorized' }, status: 401 unless @current_police_station.id == @police_station.id
    end

    # Only allow a trusted parameter "white list" through.
    def police_station_params
      params.require(:police_station).permit(:username, :password_digest, :name, :address, :lat, :lng, :email, :contact_info)
    end
end
