class CreatePlantAssociations < ActiveRecord::Migration[8.0]
  def change
    create_table :plant_associations do |t|
      t.references :mushroom, null: false, foreign_key: false # Foreign key added in a separate migration
      t.references :plant, foreign_key:  { to_table: :lookup_items } # Points to lookup_items instead of plants

      t.timestamps
    end
  end
end
