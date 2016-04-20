class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.column :user_id, :integer
      t.column :course_id, :integer
      t.column :semester, :string
      t.column :year, :integer
      t.column :complete, :boolean

      t.timestamps null: false
    end
  end
end
