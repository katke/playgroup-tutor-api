class LocationsController < ApplicationController
  def index
    locations = Location.all
    render json: locations
  end
  def show
    locations = Location.find_by(id: params[:id])
    render json: locations
  end
end
