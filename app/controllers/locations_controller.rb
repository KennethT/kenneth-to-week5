class LocationsController < ApplicationController
  def index
    @location = Location.all
  end

  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
    
  end

  def edit
    @location = Location.find(params[:id])
  end

  def create
  @location = Location.new(location_params)
    if @location.save
      redirect_to @location, notice: 'Location was successfully created.'
    else
      render:new
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_path
  end

private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address, :zipcode)
  end


end
