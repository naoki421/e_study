class Public::AchievedTasksController < ApplicationController

  def create
    @task = Task.find(params[:task_id])
    @achieved_task = AchievedTask.new
    @achieved_task.user_id = current_user.id
    @achieved_task.study_hour = @task.study_hour
    @achieved_task.subject = @task.subject.name
    @achieved_task.save
    #タスクを達成するとユーザーのポイントが貯まる
    @user = User.find(current_user.id)
    @user.point += @task.study_hour
    @user.save
    @task.destroy
    redirect_to request.referer
  end

end

