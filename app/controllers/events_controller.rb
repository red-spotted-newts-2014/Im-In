class EventsController < ApplicationController

  def index
    # all events in feed
    @events = current_user.invited_events
    # all events user is "in"
    @attending_invitations = current_user.invitations.where(status: "in")
    @attending_events = []
    @attending_invitations.each do |invite|
      @attending_events << Event.find(invite.event_id)
    end
    # @attending_events = @attending_invitations.events
    # all events user created
    # @created_events = current_user.created_events

    respond_to do |format|
      format.html
      format.json { render :json => { :events => @events }
      }
    end
  end

  def show
    @event = Event.find(params[:id])
    @invitations = @event.invitations

    respond_to do |format|
      format.html
      format.json { render :json => { :event => @event,
        :invitations => @invitations }
      }
    end
  end

  # I DONT THINK WE NEED THIS... WE CAN PROB QUERY THIS IN SWIFT THROUGH USERS EVENTS WHERE STATUS == "in"

  # def attending
  #   @events = current_user.events.where(status: "in")

  #   respond_to do |format|
  #     format.html
  #     format.json { render :json => { :events => @events }
  #     }
  #   end
  # end

  # def created
  #   @events = current_user.created_events

  #   respond_to do |format|
  #     format.html
  #     format.json { render :json => { :events => @events }
  #     }
  #   end
  # end

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
