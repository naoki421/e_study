class Public::TasksController < ApplicationController
  
  def new
    @task = Task.new
  end
  
  def create
    
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content, :study_hours, :subject_id)
  end
  
end
