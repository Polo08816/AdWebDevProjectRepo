class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules, id:false do |t|
      t.column :user_id, :integer
      t.column :course_id, :integer
      t.column :semester, :string
      t.column :year, :integer
      t.column :complete, :boolean

      t.timestamps null: false
    end
    add_index(:schedules, [:user_id, :course_id, :semester, :year], unique: true)
    end
  end
