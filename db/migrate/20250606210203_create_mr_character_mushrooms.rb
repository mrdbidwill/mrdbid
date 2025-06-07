class CreateMrCharacterMushrooms < ActiveRecord::Migration[8.0]
  def change
    create_table :mr_character_mushrooms do |t|
      t.references :mr_character, null: false, foreign_key: true
      t.references :mushroom, null: false, foreign_key: true
      t.string :character_value
      t.references :entered_by, null: false, foreign_key: { to_table: :users }


      t.timestamps
    end
  end
end
