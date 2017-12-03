class PoliceStationsController < ApplicationController
  before_action :set_police_station, only: [:update]
  before_action :authenticate_request, only: [:update]

  # GET /police_stations
  def index
    @police_stations = PoliceStation.all

    render json: @police_stations, except: [:password_digest]
  end

  # GET /police_stations/1
  def show
    render json: PoliceStation.includes(:featured_crimes, :most_wanteds).find(params[:id]), except: [:password_digest], include: [:featured_crimes, :most_wanteds]
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

    # Only allow a trusted parameter "white list" through.
    def police_station_params
      params.permit(:username, :password_digest, :name, :address, :lat, :lng, :email, :contact_info)
    end
end
