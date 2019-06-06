class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    authorize @event
    @categories = Category.all
    @participation = Participation.where(user_id: current_user.id).where(event_id: @event.id).first
    @contributions = @participation.contributions
    @contribution = Contribution.new
  end
end
