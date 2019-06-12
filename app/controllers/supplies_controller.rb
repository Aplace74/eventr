class SuppliesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @supply = Supply.create(supply_params)
    authorize @supply
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:event_id])
    @supply = Supply.find(params[:id])
    authorize @supply
    @supply.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@event) }
      format.js
    end
  end

  private

  def supply_params
    {
      title: params[:title],
      quantity: params[:quantity],
      category_id: params[:category_id],
      event_id: params[:event_id],
    }
  end
end
