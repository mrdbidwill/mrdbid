class CreateRolePermissions < ActiveRecord::Migration[8.0]
  def change
    create_table :role_permissions do |t|
      t.references :role, null: false, foreign_key: false# Foreign key added in a separate migration
      t.references :permission, null: false, foreign_key: false# Foreign key added in a separate migration

      t.timestamps
    end
  end
end
