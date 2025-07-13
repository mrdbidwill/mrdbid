class AddForeignKeysToUserRoles < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :user_roles, :users
    add_foreign_key :user_roles, :roles
  end
end
