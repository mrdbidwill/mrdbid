class CreateDnaSequences < ActiveRecord::Migration[8.0]
  def change
    create_table :dna_sequences do |t|
      t.references :mushroom, null: false, foreign_key: true
      t.string :notes
      t.text :dna_barcode_its
      t.string :genbank_number_url
      t.integer :genbank_accession_number
      t.string :herbarium_catalog_number
      t.string :mycomap_blast_results
      t.string :provisional_species_name
      t.integer :reads_in_consensus_ric
      t.string :sequencing_technology
      t.string :trace_files_raw_dna_data
      t.string :voucher_number
      t.references :entered_by, null: false, foreign_key: { to_table: :users }


      t.timestamps
    end
  end
end
