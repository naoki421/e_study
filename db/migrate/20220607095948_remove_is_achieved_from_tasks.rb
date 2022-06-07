class RemoveIsAchievedFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :is_achieved, :boolean
  end
end
