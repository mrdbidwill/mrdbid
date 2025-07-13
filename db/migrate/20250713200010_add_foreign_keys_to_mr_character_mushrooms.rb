class AddForeignKeysToMrCharacterMushrooms < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :mr_character_mushrooms, :mr_characters
    add_foreign_key :mr_character_mushrooms, :mushrooms
  end
end
