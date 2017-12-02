class CrimeTypesController < ApplicationController
  def index
    render json: CrimeType.all, only: [:id, :name]
  end
end
