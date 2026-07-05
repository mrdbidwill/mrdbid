# frozen_string_literal: true

class CreateDnaObservationLists < ActiveRecord::Migration[8.0]
  def change
    create_table :dna_observation_lists do |t|
      t.string :title, null: false
      t.text :description
      t.string :product_type, null: false, default: "county"
      t.string :export_mode, null: false, default: "full"
      t.string :state_code, limit: 2
      t.string :county_name
      t.integer :inat_place_id
      t.string :place_query
      t.string :inat_project_id
      t.boolean :public_download, null: false, default: true
      t.datetime :last_sync_at

      t.timestamps
    end

    add_index :dna_observation_lists, :product_type
    add_index :dna_observation_lists, :export_mode
    add_index :dna_observation_lists, :public_download
    add_index :dna_observation_lists, :inat_place_id
    add_index :dna_observation_lists, :inat_project_id
  end
end
