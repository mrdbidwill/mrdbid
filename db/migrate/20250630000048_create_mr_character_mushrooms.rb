class CreateMrCharacterMushrooms < ActiveRecord::Migration[8.0]
  def change
    create_table :mr_character_mushrooms do |t|
      t.integer :mr_character
      t.integer :mushroom
      t.string :character_value
      t.timestamps
    end
  end
end
