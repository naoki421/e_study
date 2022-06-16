class Public::SubjectsController < ApplicationController
  before_action :authenticate_user!

  def new
    @subject = Subject.new
    @subjects = current_user.subjects
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.user_id = current_user.id
    @subject.save
    redirect_to request.referer
  end

  def edit
    @subject = Subject.find(params[:id])
    if @subject.user != current_user
      redirect_to new_subject_path
    end
  end

  def update
    @subject = Subject.find(params[:id])
    @subject.update(subject_params)
    redirect_to new_subject_path
  end

  def destroy
    subject = Subject.find(params[:id])
    subject.destroy
    redirect_to request.referer
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end

end

