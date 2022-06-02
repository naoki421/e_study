class ChangeDataTaskToStudyHours < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :study_hours, :float
  end
end
