class AddCascadeDeleteToMrCharacterMushrooms < ActiveRecord::Migration[8.0]
  def change
    # Remove existing foreign key constraint
    remove_foreign_key :mr_character_mushrooms, :mushrooms

    # Add new foreign key constraint with ON DELETE CASCADE
    add_foreign_key :mr_character_mushrooms, :mushrooms, on_delete: :cascade
  end
end

