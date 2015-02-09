class LocationsController < ApplicationController
  def index
    location = Location.new
  end

  def new
    @location = Location.find(params[:id])
  end

  def show
    @location = Location.find(params[:id])
  end

  def edit
    @location = Location.find(params[:id])
  end

private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address, :zipcode)
  end


end
