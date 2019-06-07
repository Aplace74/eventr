class EventMailer < ApplicationMailer
    def create_confirmation
        @event = params[:event]
    
        mail(
          to:       @event.user.email,
          subject:  "Evénement #{@event.title} créé!"
        )
      end
  end