class TasksController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def toggle
    @task = Task.find(params[:id])
    @task.update(completed: params[:completed])
    render json: { message: "Success" }
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url, notice: "Task was successfully updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice: "Task was successfully deleted."
  end
end
