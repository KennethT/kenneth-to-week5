class EventsController < ApplicationController

  def index
    @event = Event.all
  end

  def new
    @location = Location.find(params[:location_id])
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])
  end

  def edit
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])
  end

  def destroy
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])
    @event.destroy
    redirect_to location_path(@location)
  end

  def create
  @event = Event.new(event_params)
  @event.location_id = params[:location_id]
    if @event.save
      redirect_to locations_path, notice: 'Event was successfully created.'
    else
      render:new
    end
  end

  def update
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])
    @event.update_attributes(event_params)
    redirect_to location_event_path(@location, @event), notice: "Event was sucessfully updated"
  end

private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:description, :date, :requires_id)
  end

end
