class Public::CommentsController < ApplicationController

  def create
    post_study_method = PostStudyMethod.find(params[:post_study_method_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.post_study_method_id = post_study_method.id
    comment.save
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
