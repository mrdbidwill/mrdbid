class CreateMushrooms < ActiveRecord::Migration[8.0]
  def change
    create_table :mushrooms do |t|
      t.string :mushroom_name
      t.text :description
      t.references :state, foreign_key: true
      t.references :country, foreign_key: true
      t.references :fungus_type, foreign_key: true
      t.references :mushroom_storage_location, foreign_key: true

      t.timestamps
    end
  end
end
