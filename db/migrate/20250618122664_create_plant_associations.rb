class CreatePlantAssociations < ActiveRecord::Migration[8.0]
  def change
    create_table :plant_associations do |t|
      t.references :mushroom, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
