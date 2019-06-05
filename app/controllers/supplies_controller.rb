class SuppliesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @categories = Category.all
    @contribution = Contribution.new
    @supplies = policy_scope(Supply).where(event_id: @event.id)
    authorize @supplies
  end
end
