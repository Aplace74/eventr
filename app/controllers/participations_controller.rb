class ParticipationsController < ApplicationController
  def index
    @participants = policy_scope(Participation)
    @event = Event.find(params[:event_id])
    @participation = current_user.participations.where(event_id: @event.id).first
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
