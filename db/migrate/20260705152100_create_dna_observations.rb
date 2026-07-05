# frozen_string_literal: true

class CreateDnaObservations < ActiveRecord::Migration[8.0]
  def change
    create_table :dna_observations do |t|
      t.references :observation_list, null: false, foreign_key: { to_table: :dna_observation_lists }
      t.integer :inat_observation_id, null: false
      t.string :taxon_name
      t.string :species_guess
      t.string :scientific_name
      t.string :common_name
      t.string :observation_taxon_name
      t.string :community_taxon_name
      t.string :user_name
      t.datetime :observed_at
      t.string :inat_url, null: false
      t.text :dna_field_value
      t.text :barcode_inferred_species_or_name
      t.text :raw_payload

      t.timestamps
    end

    add_index :dna_observations, [:observation_list_id, :inat_observation_id],
              unique: true,
              name: "idx_dna_observations_list_inat_unique"
    add_index :dna_observations, :inat_observation_id
  end
end
