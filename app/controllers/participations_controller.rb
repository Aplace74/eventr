class ParticipationsController < ApplicationController
    def index
        @participants = policy_scope(Participation)
        @event = Event.find(params[:event_id])
    end

    
end
