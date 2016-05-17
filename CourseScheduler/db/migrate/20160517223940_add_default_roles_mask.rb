class AddDefaultRolesMask < ActiveRecord::Migration
  def change
    change_column_default(:users, :roles_mask, 1)
  end
end
