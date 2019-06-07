class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @title = @event.title
    authorize @event
    @categories = Category.all
    @participation = Participation.where(user_id: current_user.id).where(event_id: @event.id).first
    @contributions = @participation.contributions
    @contribution = Contribution.new
  end

  def index
    @events = policy_scope(Event)
    @user_events = @events.where(user: current_user)
    @attending = Participation.where(user: current_user).map { |p| p.event }
    @title = "Mes événements"
  end

  def new
    @event = Event.new
    @event.user = current_user
    authorize @event
    @title = "Créer ton nouvel événement"
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    if @event.save
      Participation.create!(
        confirmed: true,
        event_id: @event.id,
        user_id: @event.user.id,
        organizer: true
      )
      redirect_to events_path
    else
      render :new
    end
  end

  def invitation
    @event = Event.find(params[:event_id])
    authorize @event
    @participation = Participation.new
  end

  private

  def event_params
    params.require(:event).permit!
  end
end
