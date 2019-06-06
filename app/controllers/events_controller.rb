class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
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
  end

  def new
      @event = Event.new
      @event.user = current_user
      authorize @event
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
