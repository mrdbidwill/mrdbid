class AddForeignKeysToRolePermissions < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :role_permissions, :roles
    add_foreign_key :role_permissions, :permissions
  end
end
