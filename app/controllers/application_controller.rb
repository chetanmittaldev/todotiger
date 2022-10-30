class ApplicationController < ActionController::Base
  def create
    @task = Task.new(task_params)
    @tasks = Task.all

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: "Task was successfully created" }
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  def task_params
    params.require(:task).permit(:description)
  end
end
