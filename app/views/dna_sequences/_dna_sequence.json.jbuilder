json.extract! dna_sequence, :id, :mushroom_id, :notes, :dna_barcode_its, :genbank_number_url, :genbank_accession_number, :herbarium_catalog_number, :mycomap_blast_results, :provisional_species_name, :sequencing_technology, :trace_files_raw_dna_data, :voucher_number, :created_at, :updated_at
json.url dna_sequence_url(dna_sequence, format: :json)
