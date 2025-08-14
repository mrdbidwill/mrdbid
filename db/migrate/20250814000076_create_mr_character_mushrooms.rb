# frozen_string_literal: true

class CreateMrCharacterMushrooms < ActiveRecord::Migration[8.0]
  def change
  create_table :mr_character_mushrooms do |t|
      t.references :mr_character, foreign_key: true
      t.references :mushroom, foreign_key: true
      t.string :character_value
      t.timestamps
    end
  end
end
