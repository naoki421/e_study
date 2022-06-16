class Public::RewardsController < ApplicationController
  before_action :authenticate_user!

  def new
    @reward = Reward.new
    @rewards = Reward.where(user_id: current_user.id)
    @exchanged_reward = ExchangedReward.where(user_id: current_user.id)
  end

  def create
    @reward = Reward.new(reward_params)
    @reward.user_id = current_user.id
    @reward.save
    redirect_to request.referer
  end

  def edit
    @reward = Reward.find(params[:id])
    if @reward.user != current_user
      redirect_to new_reward_path
    end
  end

  def update
    @reward = Reward.find(params[:id])
    @reward.update(reward_params)
    redirect_to new_reward_path
  end

  def destroy
    reward = Reward.find(params[:id])
    reward.destroy
    redirect_to request.referer
  end

  private

  def reward_params
    params.require(:reward).permit(:content, :point)
  end

end
