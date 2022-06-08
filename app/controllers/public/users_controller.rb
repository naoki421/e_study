class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @post_study_method = PostStudyMethod.new
    @post_study_methods = @user.post_study_methods
  end

  def index
    @total_study_ranks = AchievedTask.joins(:user).group("users.name").order("sum_study_hour DESC").sum(:study_hour)
    # 自分のランキングを調べる
    @my_rank = 0
    @total_study_ranks.each.with_index(1) do |rank, i|
      if rank.first == current_user.name
        @my_rank = i
        break
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :school_year, :profile_image)
  end

end
