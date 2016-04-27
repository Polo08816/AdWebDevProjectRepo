class AddPreRequesiteColumnToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :prerequisite_course_number, :integer
  end
end
