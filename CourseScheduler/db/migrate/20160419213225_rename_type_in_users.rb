class RenameTypeInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :type, :userType
  end
end
