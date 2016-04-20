class ChangeNamesToHumanReadable < ActiveRecord::Migration
  def change
    rename_column :users, :firstName, :first_name
    rename_column :users, :lastName, :last_name
    rename_column :users, :streetAddr, :street_address
    rename_column :users, :phoneNum, :phone_number
    rename_column :users, :userType, :user_type
  end
end
