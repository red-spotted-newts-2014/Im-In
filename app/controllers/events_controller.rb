class EventsController < ApplicationController

  def index
    @events = current_user.events

    respond_to do |format|
      format.html
      format.json { render :json => { :events => @events }
      }
    end
  end

  def attending
    @events = current_user.events.where(status: "in")

    respond_to do |format|
      format.html
      format.json { render :json => { :events => @events }
      }
    end
  end

  def created
    @events = current_user.created_events

    respond_to do |format|
      format.html
      format.json { render :json => { :events => @events }
      }
    end
  end

  def show
    @event = Event.find(params[:id])
    render json: @event

    @invitations = @event.invitations

    respond_to do |format|
      format.html
      format.json { render :json => { :event => @event,
        :invitations => @invitations }
      }
    end
  end

  def create
    @event = current_user.events.create(event_params)
    render json: @event
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
    params.require(:event).permit(:name, :description, :start_time, :end_time, :venue, :location, :notification?, :notify_time)
  end

end
