class ParticipationsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @map_url = @event.map_url
    @agenda_url = @event.agenda_url
    @participants = policy_scope(Participation.where(event_id: @event.id))
    @participation = Participation.find_by(user_id: current_user.id, event_id: @event.id)
  end

  def create
    @event = Event.find(params[:event_id])
    @participation = Participation.create(event_id: params[:event_id], user_id: params[:user_id])
    authorize @participation
    redirect_to event_path(@event)
  end

  def update
    authorize Participation
    Participation.find(params[:id]).toggle(:confirmed).save
    redirect_to event_participations_path(params[:event_id])
  end

  def destroy
    @participation = Participation.find(params[:id])
    authorize @participation
    @participation.destroy
    redirect_to events_path
  end
end
