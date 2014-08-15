class InvitationsController < ApplicationController
  def create
    @event = Event.find(params[:id])
    @invitation = @event.invitations.create(invitation_params)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:user_id, :status)
  end
end
