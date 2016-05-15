class SetDefaultUserType < ActiveRecord::Migration
  def change
    change_column_default(:users, :user_type, "Student")
  end
end
