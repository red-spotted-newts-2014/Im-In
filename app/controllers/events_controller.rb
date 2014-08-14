class EventsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @event = Event.find(params[:id])
    @invitations = @event.invitations.where(status: "pending")
    respond_to do |format|
      format.html
      format.json { render :json => @event#,
        # :invitees => @invitees
      }
    end
    # render json: @event
  end

  def create
    @event = current_user.events.create(event_params)
    render json: @event
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    render json: @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_time, :end_time, :venue, :location, :notify_user?, :notify_hours_until_event)
  end
end
