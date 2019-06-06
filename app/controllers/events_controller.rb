class EventsController < ApplicationController
  def index
    @events = policy_scope(Event)
  end

  def new
    @event = Event.new
    @event.user = current_user
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    if @event.save
      # Create participant organiser
      Participation.create!(
        confirmed: true,
        event_id: @event.id,
        user_id: @event.user.id,
        organizer: true
      )
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit!
  end
end
