class SuppliesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @supplies = policy_scope(Supply).where(event_id: @event.id)
    authorize @supplies
  end
end
