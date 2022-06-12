class Public::RewardsController < ApplicationController

  def new
    @reward = Reward.new
    @rewards = Reward.where(user_id: current_user.id)
  end

  def create
    @reward = Reward.new(reward_params)
    @reward.user_id = current_user.id
    @reward.save
    redirect_to request.referer
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def reward_params
    params.require(:reward).permit(:content, :point)
  end

end
