class ContributionsController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index
  skip_before_action :verify_authenticity_token, only: :change_state
  skip_after_action :verify_authorized, only: :change_state

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

  def update
    @participation = Participation.find(params[:participation_id])
    @supply = Supply.find(params[:supply_id])
    @event = Event.find(params[:event_id])
    @contribution = Contribution.find(params[:id])
    @contribution.part = params[:part]
    authorize @contribution
    @contribution.save
    respond_to do |format|
      format.html { redirect_to event_path(@event) }
      format.js
    end
  end

  def index
    @fee = Fee.new
    @event = Event.find(params[:event_id])
    @participation = Participation.find_by(user_id: current_user.id, event_id: @event.id)
    @map_url = @event.map_url
    @agenda_url = @event.agenda_url
    @contributions = @participation.contributions
  end

  def change_state
    contribution = Contribution.find(params[:contribution_id])
    contribution.state = !contribution.state
    contribution.save
  end

  private

  def contribution_params
    {
      part: params[:part].to_i,
      participation_id: params[:participation_id].to_i,
      supply_id: params[:supply_id].to_i
    }
  end
end
