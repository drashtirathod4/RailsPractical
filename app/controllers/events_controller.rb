class EventsController < ApplicationController
  def index
    @events = Event.search(params[:search]).order("event_date desc")
  end

  def show
    @event = Event.find(params[:id])
    @comments = @event.comments
    @current_user = current_user
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.create(event_params)
    if event.valid?
      redirect_to welcome_path
    else 
      flash[:errors] = event.errors.full_messages
      redirect_to new_event_path
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update 
    @event = Event.find(params[:id])
    @event.update(event_params)
    if @event.valid?
      redirect_to welcome_path
    else 
      flash[:errors] = @event.errors.full_messages
      redirect_to edit_event_path(@event)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to welcome_path
  end

  private 
  def event_params
    params.require(:event).permit(:name, :description, :event_date, :user_id, :category_id)
  end
end
