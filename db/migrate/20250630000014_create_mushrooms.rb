class CreateMushrooms < ActiveRecord::Migration[8.0]
  def change
    create_table :mushrooms do |t|
      t.string :mushroom_name
      t.text :description
      t.integer :state
      t.integer :country
      t.integer :fungus_type
      t.integer :mushroom_storage_location

      t.timestamps
    end
  end
end
