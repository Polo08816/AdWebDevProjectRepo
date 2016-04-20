class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    add_column :users, :streetAddr, :string
    add_column :users, :phoneNum, :string
  end
end
