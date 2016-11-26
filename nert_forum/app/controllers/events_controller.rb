class EventsController < ApplicationController
  before_action :get_event, only: [:show, :edit, :update, :destroy]
  before_action :verify_admin, only: [:create, :edit, :update, :destroy]

  def index
    @events = Event.all.reverse_order
    @new_event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      flash[:success] = "Event added."
      redirect_to posts_path
    else
      flash[:error] = "Event has not been added."
      render posts_path
    end
  end

  def show
    @new_comment = Comment.new
  end

  def edit
  end

  def update
    @event.update_attributes(event_params)

    if @event.save
      flash[:success] = "Event updated successfully."
      redirect_to @event
    else
      flash[:error] = "Event has not been updated."
      render :edit
    end
  end

  def destroy

    if @event.destroy
      flash[:success] = "Event deleted successfully."
      redirect_to posts_path
    else
      flash[:error] = "Event has not been deleted."
      redirect_to @event
    end
  end

  private

  def get_event
    @event = Event.find(params[:id])
  end

  def verify_logged_in
    unless user_signed_in?
      flash[:error] = 'You must be logged in.'
      redirect_to new_user_session_path
    end
  end

  def verify_admin
    unless current_user && current_user.admin
      flash[:error] = 'You must be an adminstrator to perform this action.'
      redirect_to root_path
    end
  end

  def event_params
    params.require(:event).permit(:name,:location,:image,:description,:user_id)
  end

end
