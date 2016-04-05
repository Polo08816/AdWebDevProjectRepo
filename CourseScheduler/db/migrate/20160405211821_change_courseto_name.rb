class ChangeCoursetoName < ActiveRecord::Migration
  def change
    rename_column :courses, :Course, :courseName
  end
end
