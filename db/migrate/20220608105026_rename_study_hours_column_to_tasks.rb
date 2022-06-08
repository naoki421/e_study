class RenameStudyHoursColumnToTasks < ActiveRecord::Migration[6.1]
  def change
    rename_column :tasks, :study_hours, :study_hour
  end
end
