class CreateUserRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :user_roles do |t|
      t.references :user, null: false, foreign_key: false# Foreign key added in a separate migration
      t.references :role, null: false, foreign_key: false# Foreign key added in a separate migration

      t.timestamps
    end
  end
end
