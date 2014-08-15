class EventsController < ApplicationController

  def index
    @invited_events = current_user.invited_events

    respond_to do |format|
      format.html
      format.json { render :json => { :invited_events => @invited_events } }
    end
  end

  def new
    @event = current_user.created_events.new
  end

  def show
    @event = Event.find(params[:id])
    @invitations = @event.invitations

    respond_to do |format|
      format.html
      format.json { render :json => { :event => @event,
        :invitations => @invitations } }
    end
  end

  def create
    @event = current_user.created_events.create(event_params)
    redirect_to event_path(@event)
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def attending
    @attending_invitations = current_user.invitations.where(status: "in")
    @attending_events = []
    @attending_invitations.each do |invite|
      @attending_events << Event.find(invite.event_id)

     respond_to do |format|
       format.html
       format.json { render :json => { :events => @events }}
     end
   end

   def created
     @events = current_user.created_events

     respond_to do |format|
       format.html
       format.json { render :json => { :events => @events }}
     end
   end
  private

  def event_params
    params.require(:event).permit(:name, :description, :start_time, :end_time, :venue, :location, :notification?, :notify_time)
  end

end
