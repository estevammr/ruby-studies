class HoursController < ApplicationController

  def index # aqui
    @task = Task.all
    @hours = Hour.all
  end

  def new
    @task = Task.find(params[:task_id])
    @hour = @task.hours.build
  end

  def edit # aqui
    @hour = Hour.find(params[:id])
  end

  def create
    @task = Task.find(params[:task_id])
    @hour = @task.hours.new(hour_params)

    if @hour.save
      redirect_to tasks_path
    else 
      render 'new'
    end
  end

  def update
    @task = Task.find(params[:task_id])
    @hour = @task.hours.update_attributes(hour_params)

    if @hour.update(hour_params)
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @hour = Hour.find(params[:id])
    @hour.destroy

    redirect_to hours_path
  end

  private
    def hour_params
      params.require(:hour).permit(:quantity, :task_id)
    end

end
