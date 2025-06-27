FactoryBot.define do
  factory :dna_sequence do
    mushroom_id { "MyString" }
    notes { "MyText" }
    dna_barcode_its { "MyText" }
    genbank_number_url { "MyString" }
    genbank_accession_number { "MyString" }
    herbarium_catalog_number { "MyString" }
    mycomap_blast_results { "MyString" }
    provisional_species_name { "MyString" }
    sequencing_technology { "MyString" }
    trace_files_raw_dna_data { "MyString" }
    voucher_number { "MyString" }
  end
end
