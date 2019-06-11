class FeesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @fee = Fee.new
    authorize @fee
    @fee.cost = params[:cost]
    @fee.participation_id = params[:participation_id]
    @fee.save
    redirect_to event_contributions_path(@event)
  end

  def index
    authorize policy_scope(Fee)
    @event = Event.find(params[:event_id])
    @fees = @event.fees
    @participation = Participation.find_by user_id: current_user.id
  end

  def destroy
    @event = Event.find(params[:event_id])
    @fee = Fee.find(params[:id])
    authorize @fee
    @fee.destroy
    redirect_to event_contributions_path(@event)
  end
end
