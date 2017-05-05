class EventsController < ApplicationController

  def index
    @task = Task.all
    @events = Event.where(task_id: params[:task_id])
  end

  def new
    @task = Task.find(params[:task_id])
    @event = @task.events.build
  end

  def edit
    @task = Task.find(params[:task_id])
    @event = Event.find(params[:id])
  end

  def create
    @task = Task.find(params[:task_id])
    @event = @task.events.new(event_params)

    if @event.save
      redirect_to tasks_path
    else 
      render 'new'
    end
  end

  def update
    @task = Task.find(params[:task_id])
    @event = @task.events

    if @event.update(event_params)
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  private
    def event_params
      params.require(:event).permit(:quantity, :task_id)
    end
end
