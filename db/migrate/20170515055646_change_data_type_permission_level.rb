class ChangeDataTypePermissionLevel < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :permission_level
    add_column :users, :permission_level, :integer
  end
end
