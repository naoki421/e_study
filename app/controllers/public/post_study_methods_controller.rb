class Public::PostStudyMethodsController < ApplicationController

  def new
    @post_study_method = PostStudyMethod.new
    @post_study_methods = current_user.post_study_methods
  end

  def index
    @post_study_methods = PostStudyMethod.all
  end

  def show
    @post_study_method = PostStudyMethod.find(params[:id])
    @comment = Comment.new
  end

  def create
    @post_study_method = PostStudyMethod.new(post_study_method_params)
    @post_study_method.user_id = current_user.id
    @post_study_method.save
    redirect_to request.referer
  end

  def edit
    @post_study_method = PostStudyMethod.find(params[:id])
  end

  def update
    @post_study_method = PostStudyMethod.find(params[:id])
    @post_study_method.update(post_study_method_params)
    redirect_to new_post_study_method_path
  end

  def destroy
    post_study_method = PostStudyMethod.find(params[:id])
    post_study_method.destroy
    redirect_to request.referer
  end

  private

  def post_study_method_params
    params.require(:post_study_method).permit(:title, :body)
  end

end
