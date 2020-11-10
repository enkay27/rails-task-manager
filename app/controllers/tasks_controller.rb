class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
    @bin = "<i class=fas fa-trash-alt></i>"
    #redirect_to
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    #redirect
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
