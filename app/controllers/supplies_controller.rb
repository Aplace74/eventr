class SuppliesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @supplies = policy_scope(Supply).where(event_id: @event.id)
    @feed = @supplies.where(category: 'Nourriture')
    @drinks = @supplies.where(category: 'Boissons')
    @others = @supplies.where(category: 'Autres')
    authorize @supplies
  end
end
