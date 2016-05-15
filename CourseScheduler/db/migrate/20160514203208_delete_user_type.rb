class DeleteUserType < ActiveRecord::Migration
  def change
    remove_column :users, :user_type
    change_column_default(:users, :roles_mask, 1)
  end
end
