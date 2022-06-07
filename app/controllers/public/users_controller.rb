class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @post_study_method = PostStudyMethod.new
    @post_study_methods = @user.post_study_methods
  end

  def index

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
