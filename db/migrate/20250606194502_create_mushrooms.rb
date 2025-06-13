class CreateMushrooms < ActiveRecord::Migration[8.0]
  def change
    create_table :mushrooms do |t|
      t.string :mushroom_name
      t.string :common_name
      t.text :description
      t.text :comment
      t.references :mushroom_location, null: false, foreign_key: true
      t.string :location_found_city
      t.string :location_found_county
      t.references :state, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true
      t.boolean :location_public
      t.boolean :share_data
      t.date :date_found
      t.references :fungus_type, null: false, foreign_key: true
      t.references :entered_by, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
