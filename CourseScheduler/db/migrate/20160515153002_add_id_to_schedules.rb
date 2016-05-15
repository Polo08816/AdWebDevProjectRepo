class AddIdToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :id, :primary_key
  end
end
