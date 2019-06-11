class FeeContributionsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @fee_contribution = FeeContribution.new(participation_id: params[:participation_id], fee_id: params[:fee_id])
    authorize @fee_contribution
    @fee_contribution.save
    redirect_to event_fees_path(@event)
  end

  def destroy
    @event = Event.find(params[:event_id])
    @fee_contribution = FeeContribution.find(params[:id])
    authorize @fee_contribution
    @fee_contribution.destroy
    redirect_to event_fees_path(@event)
  end
end
