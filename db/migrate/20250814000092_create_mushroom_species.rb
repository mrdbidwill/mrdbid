class CreateMushroomSpecies < ActiveRecord::Migration[8.0]
  def change
    create_table :mushroom_species do |t|
      t.references :species, null: false, foreign_key: true
      t.references :mushroom, null: false, foreign_key: true
      t.timestamps
    end
  end
end

