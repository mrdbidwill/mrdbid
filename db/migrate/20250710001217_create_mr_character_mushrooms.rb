# frozen_string_literal: true

class CreateMrCharacterMushrooms < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:mr_character_mushrooms)

    create_table :mr_character_mushrooms do |t|
      t.references :mr_character, foreign_key: false# Foreign key added in a separate migration
      t.references :mushroom, foreign_key: false# Foreign key added in a separate migration
      t.string :character_value

      t.timestamps
    end
  end
end
