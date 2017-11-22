class MostWantedsController < ApplicationController
  before_action :set_most_wanted, only: [:show, :update, :destroy]

  # GET /most_wanteds
  def index
    @most_wanteds = MostWanted.all

    render json: @most_wanteds
  end

  # GET /most_wanteds/1
  def show
    render json: @most_wanted
  end

  # POST /most_wanteds
  def create
    @most_wanted = MostWanted.new(most_wanted_params)

    if @most_wanted.save
      render json: @most_wanted, status: :created, location: @most_wanted
    else
      render json: @most_wanted.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /most_wanteds/1
  def update
    if @most_wanted.update(most_wanted_params)
      render json: @most_wanted
    else
      render json: @most_wanted.errors, status: :unprocessable_entity
    end
  end

  # DELETE /most_wanteds/1
  def destroy
    @most_wanted.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_most_wanted
      @most_wanted = MostWanted.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def most_wanted_params
      params.require(:most_wanted).permit(:name, :crime_type_id, :exact_crime, :reward, :additional_info)
    end
end
