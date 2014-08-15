class InvitationsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @invitation = @event.invitations.create(invitation_params)
    redirect_to event_path(@event)
  end

  private

  def invitation_params
    @user = User.find_by(username: params[:invitation][:username])
    params[:invitation][:user_id] = @user.id
    params[:invitation][:status] = "pending"
    params.require(:invitation).permit(:user_id, :status)
  end
end
