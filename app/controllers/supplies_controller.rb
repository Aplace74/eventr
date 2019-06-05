class SuppliesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @supplies = policy_scope(Supply).where(event_id: @event.id)
    authorize @supplies
    @feed = @supplies.where(category_id: 2)
    @drinks = @supplies.where(category_id: 1)
    @others = @supplies.where(category_id: 3)
  end
end
