class FeaturedCrimesController < ApplicationController
  before_action :set_featured_crime_police_station, only: [:update, :destroy]
  before_action :authenticate_request, only: [:update, :destroy]
  before_action :auth_request_any, only: [:create]

  # GET /featured_crimes
  def index
    render json: FeaturedCrime.includes(:police_station).all, include: {
      police_station: {only: [:name]}
    }
  end

  # GET /featured_crimes/1
  def show
    render json: FeaturedCrime.includes(:police_station).find(params[:id]), include: {
      police_station: {only: [:name]}
    }
  end

  # POST /featured_crimes
  def create
    @featured_crime = FeaturedCrime.new(featured_crime_params)
    @featured_crime.police_station = @current_police_station

    if @featured_crime.save
      render json: @featured_crime, status: :created, location: @featured_crime
    else
      render json: @featured_crime.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /featured_crimes/1
  def update
    if @featured_crime.update(featured_crime_params)
      render json: @featured_crime
    else
      render json: @featured_crime.errors, status: :unprocessable_entity
    end
  end

  # DELETE /featured_crimes/1
  def destroy
    @featured_crime.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_featured_crime_police_station
      @featured_crime = FeaturedCrime.find(params[:id])
      @police_station = @featured_crime.police_station
    end

    # Only allow a trusted parameter "white list" through.
    def featured_crime_params
      params.permit(:title, :crime_type_id, :content)
    end
end
