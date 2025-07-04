class CreateMushroomStorageLocations < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:mushroom_storage_locations)

    create_table :mushroom_storage_locations do |t|
      t.string :name, null: false
      t.text :description
      t.text :comments
      t.integer :source, null: false
      t.timestamps
    end
  end
end
