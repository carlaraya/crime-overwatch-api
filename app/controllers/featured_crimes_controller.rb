class FeaturedCrimesController < ApplicationController
  before_action :set_featured_crime, only: [:show, :update, :destroy]

  # GET /featured_crimes
  def index
    @featured_crimes = FeaturedCrime.all

    render json: @featured_crimes
  end

  # GET /featured_crimes/1
  def show
    render json: @featured_crime
  end

  # POST /featured_crimes
  def create
    @featured_crime = FeaturedCrime.new(featured_crime_params)

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
    def set_featured_crime
      @featured_crime = FeaturedCrime.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def featured_crime_params
      params.require(:featured_crime).permit(:title, :police_station_id, :crime_type_id, :content)
    end
end
