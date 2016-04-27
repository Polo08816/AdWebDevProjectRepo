class ChangeCoursesPrimaryKey < ActiveRecord::Migration
  def change
    rename_column :courses, :courseName, :course_name
    rename_column :courses, :courseNumber, :course_number
    add_index(:courses, [:course_number, :department], unique: true)
    change_column :schedules, :complete, :string
  end
end
