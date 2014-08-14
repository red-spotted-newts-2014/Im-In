class EventsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @event = Event.find(params[:id])
   render :json @event
  end

  def create
    @event = current_user.events.create(event_params)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    render :json @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

  private
    def event_params
      params.require(:event).permit(:name, :description, :start_time, :end_time, :venue, :location, :notification?, :notify_time)
    end
end
