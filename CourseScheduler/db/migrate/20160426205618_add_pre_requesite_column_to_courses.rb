class AddPreRequesiteColumnToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :prerequisiteCourseNumber, :integer
  end
end
