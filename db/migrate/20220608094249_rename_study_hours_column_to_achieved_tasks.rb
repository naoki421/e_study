class RenameStudyHoursColumnToAchievedTasks < ActiveRecord::Migration[6.1]
  def change
    rename_column :achieved_tasks, :study_hours, :study_hour
  end
end
