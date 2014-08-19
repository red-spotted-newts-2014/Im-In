class InvitationsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create
    @event = Event.find(params[:event_id])
    @invitation = @event.invitations.create(invitation_params)
    redirect_to event_path(@event)
  end

  def update
    p params[:id]
    @invitation = Invitation.find(params[:id])
    p @invitation
    @invitation.update(status: params[:status])
    redirect_to events_path
  end

  private

  def invitation_params
    @user = User.find_by(username: params[:invitation][:username])
    params[:invitation][:user_id] = @user.id
    params[:invitation][:status] = "pending"
    params.require(:invitation).permit(:user_id, :status)
  end
end
