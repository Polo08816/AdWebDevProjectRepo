class FixForeignKeys < ActiveRecord::Migration
  def change
    remove_index(:schedules, [:user_id, :course_id, :semester, :year])
    add_index(:schedules, [:user_id, :course_id, :semester, :year], unique: true, :name => "index_schedule_name")
    rename_column :schedules, :user_id, :users_id
    rename_column :schedules, :course_id, :courses_id
  end
end
