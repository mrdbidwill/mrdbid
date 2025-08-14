class CreateMushroomPlants < ActiveRecord::Migration[8.0]
  def change
    create_table :mushroom_plants do |t|
      t.references :mushroom, foreign_key: true
      t.references :plant, foreign_key: true
      t.timestamps
    end
  end
end