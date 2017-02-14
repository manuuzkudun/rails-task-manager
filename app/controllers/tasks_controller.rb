class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
  end

  def create
    @task = Task.new(name: params[:name], done: false)
    @task.save
    redirect_to task_index_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(tasks_params)
    redirect_to task_index_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to task_index_path
  end

  def tasks_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:name, :done)
  end

end
