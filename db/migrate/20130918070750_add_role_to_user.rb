class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :contestant, :boolean, :default => false
  end
end
