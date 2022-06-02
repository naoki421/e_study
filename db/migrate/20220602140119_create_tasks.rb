class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :user_id, null: false
      t.string :content, null: false
      t.boolean :is_achieved, default: false, null: false
      t.integer :study_hours, null: false
      t.integer :subject_id, null: false
      t.timestamps
    end
  end
end
