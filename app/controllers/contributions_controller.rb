class ContributionsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    contribution_params = {
      part: params[:part].to_i,
      participation_id: params[:participation_id].to_i,
      supply_id: params[:supply_id].to_i
    }
    @contribution = Contribution.new(contribution_params)
    authorize @contribution
    @contribution.save
    redirect_to event_path(@event)
  end
end
