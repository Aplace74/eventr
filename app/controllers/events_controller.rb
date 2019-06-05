class EventsController < ApplicationController
    def new
        @event = Event.new
        @event.user = current_user
        authorize @event
    end

    def create

    end
end
