class CreatePlantAssociations < ActiveRecord::Migration[8.0]
  def change
    create_table :plant_associations do |t|
      t.references :mushroom, null: false, foreign_key: false # Foreign key added in a separate migration
      t.references :plant, null: false, foreign_key: false # Foreign key added in a separate migration

      t.timestamps
    end
  end
end
