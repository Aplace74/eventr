class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @map_url = @event.map_url
    @agenda_url = @event.agenda_url
    @title = @event.title
    authorize @event
    @categories = Category.all
    @participation = Participation.find_by(user_id: current_user.id, event_id: @event.id)
    @contributions = @participation.contributions
    @contribution = Contribution.new
  end

  def index
    @events = policy_scope(Event)
    @categories = Category.all
    @user_events = @events.where(user: current_user).map { |event| event if DateTime.now.to_date < event.end_date }
    @attending = Participation.where(user: current_user, organizer: false).map { |participation| participation.event if DateTime.now.to_date <= participation.event.end_date }
    @finish = Participation.where(user: current_user).map do |participation|
      participation.event if DateTime.now.to_date > participation.event.end_date
    end
    @user_events.compact!
    @attending.compact!
    @finish.compact!
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
    @event.token = (0...10).map { (65 + rand(26)).chr }.join
    authorize @event
    if @event.save
      Participation.create!(
        confirmed: true,
        event_id: @event.id,
        user_id: @event.user.id,
        organizer: true
      )
      # mail = EventMailer.with(event: @event).create_confirmation
      # mail.deliver_now
      redirect_to events_path
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    authorize @event
    @event.destroy
    redirect_to events_path
  end

  def invitation
    @event = Event.find(params[:event_id])  
    redirect_to event_path(@event) if (@event.participations & current_user.participations).present?
    @map_url = @event.map_url
    @agenda_url = @event.agenda_url
    authorize @event
    @participation = Participation.new
    @title = "Invite tes amis"
  end

  private

  def event_params
    params.require(:event).permit!
  end

end
