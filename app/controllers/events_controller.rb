class EventsController < ApplicationController
    def show
        @event = Event.find(params[:id])
    end

    def new
    @event = Event.new
    end

    def create
    @event = current_user.events.build(event_params)

     if @event.save
      redirect_to @event, notice: "L'événement a été créé avec succès."
     else
      render :new
    end
     end

  private

     def event_params
    params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location)
     end
end