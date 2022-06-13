class AddRewardIdToExchangedReward < ActiveRecord::Migration[6.1]
  def change
    add_column :exchanged_rewards, :reward_id, :integer, null: false
  end
end
