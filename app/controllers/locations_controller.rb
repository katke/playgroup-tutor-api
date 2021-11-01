class LocationsController < ApplicationController
  def index
    locations = Location.all
    render json: locations
  end

  def show
    locations = Location.find_by(zipcode: params[:id])
    if locations != nil
      render json: locations
    else
      render json: { errors: "Please enter a valid zip code"}, status: :unprocessable_entity
    end
  end
end
