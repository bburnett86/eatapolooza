class EventsController < ApplicationController
  def index
    @events = Event.all.order(:id).reverse
  end

  def show
    @event = Event.find(params[:id])
    if @event == Event.last
      redirect_to root_url
    end
  end

  def create
    @event = Event.create(event_params)
    redirect_to people_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :tagline)
  end
end
