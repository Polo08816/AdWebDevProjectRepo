class AddDetailsToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :courseNumber, :integer
    add_column :courses, :department, :string
  end
end
