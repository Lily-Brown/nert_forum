class EventsUsersController < ApplicationController
  before_action :verify_logged_in

  def create
    @attendee = EventsUser.new(events_users_params)
    @attendee.user_id = current_user.id
    if @attendee.save
      flash[:success] = "Event joined."
    else
      flash[:error] = "You are already attending this event."
    end
    redirect_to event_path(@attendee.event)
  end

  private

  def events_users_params
    params.require(:events_user).permit(:user_id,:event_id)
  end

  def verify_logged_in
    unless user_signed_in?
      flash[:error] = 'You must be logged in.'
      redirect_to new_user_session_path
    end
  end

end
