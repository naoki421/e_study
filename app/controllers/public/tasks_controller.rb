class Public::TasksController < ApplicationController

  def new
    @task = Task.new
    @tasks = Task.where(user_id: current_user.id)
    #ユーザーの総勉強時間
    @total_study_time = AchievedTask.where(user_id: current_user.id).sum(:study_hour)
    @todays_total_study_time = AchievedTask.where(user_id: current_user.id, created_at: Time.current.all_day).sum(:study_hour)
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.save
    redirect_to request.referer
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to new_task_path
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to request.referer
  end

  private

  def task_params
    params.require(:task).permit(:content, :study_hours, :subject_id)
  end

end
