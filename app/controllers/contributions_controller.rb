class ContributionsController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index

  def create
    @supply = Supply.find(params[:supply_id])
    @participation = Participation.find(params[:participation_id])
    @event = Event.find(params[:event_id])
    @contribution = Contribution.new(contribution_params)
    authorize @contribution
    @contribution.save
    respond_to do |format|
      format.html { redirect_to event_path(@event) }
      format.js
    end
  end

  private

  def contribution_params
    {
      part: params[:part].to_i,
      participation_id: params[:participation_id].to_i,
      supply_id: params[:supply_id].to_i
    }
  end

  def index
    @event = Event.find(params[:event_id])
    @contributions = @event.participations.where(user: current_user)[0].contributions
  end
end
