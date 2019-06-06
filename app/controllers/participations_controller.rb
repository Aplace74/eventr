class ParticipationsController < ApplicationController
    def index
        @participants = policy_scope(Participation)
        @event = Event.find(params[:event_id])
        @participation = current_user.participations.where(event_id: @event.id).first
    end
    
    def update
        authorize Participation  
        Participation.find(params[:id]).toggle(:confirmed).save
        redirect_to event_participations_path(params[:event_id])
    end
end
