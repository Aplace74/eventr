class SuppliesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @categories = Category.all
    @participation = Participation.where(user_id: current_user.id).where(event_id: @event.id).first
    @contributions = @participation.contributions
    @contribution = Contribution.new
    @supplies = policy_scope(Supply).where(event_id: @event.id)
    authorize @supplies
  end
end
