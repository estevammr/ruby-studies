class TasksController < ApplicationController
  def index 
    @tasks = current_user.tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = current_user.tasks.new
    @task[:start_time] = Time.now
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to @task
    else 
      render 'new'
    end
  end

  def update
    @task = current_user.tasks

    if @task.update(task_params)
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  def finish_task
    @task = Task.find(params[:id])
    @task[:finished_at] = Time.current
    @task.save

    redirect_to tasks_path
  end

  def tasks_finished 
    @tasks = current_user.tasks
  end

  private
    def task_params
      params.require(:task).permit(:subject, :start_time, :end_time, :finished_at)
    end
end
