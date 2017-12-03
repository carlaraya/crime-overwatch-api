class CrimeRecordsController < ApplicationController
  before_action :set_crime_record_police_station, only: [:show, :update, :destroy]
  before_action :authenticate_request, only: [:update, :destroy]
  before_action :auth_request_any, only: [:create]

  # GET /crime_records
  def index
    @crime_records = CrimeRecord.all

    render json: @crime_records, except: [:created_at, :updated_at]
  end

  # GET /crime_records/1
  def show
    render json: @crime_record
  end

  # POST /crime_records
  def create
    @crime_record = CrimeRecord.new(crime_record_params)
    @crime_record.police_station = @current_police_station

    if @crime_record.save
      render json: @crime_record, status: :created, location: @crime_record
    else
      render json: @crime_record.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /crime_records/1
  def update
    if @crime_record.update(crime_record_params)
      render json: @crime_record
    else
      render json: @crime_record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /crime_records/1
  def destroy
    @crime_record.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crime_record_police_station
      @crime_record = CrimeRecord.find(params[:id])
      @police_station = @crime_record.police_station
    end

    # Only allow a trusted parameter "white list" through.
    def crime_record_params
      params.permit(:crime_type_id, :new, :solved, :is_hidden)
    end
end
