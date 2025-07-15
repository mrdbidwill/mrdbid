class AddForeignKeysToPlantAssociations < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :plant_associations, :mushrooms
    add_foreign_key :plant_associations, :lookup_items, column: :plant_id
  end
end
