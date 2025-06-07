require "application_system_test_case"

class DnaSequencesTest < ApplicationSystemTestCase
  setup do
    @dna_sequence = dna_sequences(:one)
  end

  test "visiting the index" do
    visit dna_sequences_url
    assert_selector "h1", text: "Dna sequences"
  end

  test "should create dna sequence" do
    visit dna_sequences_url
    click_on "New dna sequence"

    fill_in "Dna barcode its", with: @dna_sequence.dna_barcode_its
    fill_in "Entered by", with: @dna_sequence.entered_by_id
    fill_in "Genbank accession number", with: @dna_sequence.genbank_accession_number
    fill_in "Genbank number url", with: @dna_sequence.genbank_number_url
    fill_in "Herbarium catalog number", with: @dna_sequence.herbarium_catalog_number
    fill_in "Mushroom id", with: @dna_sequence.mushroom_id_id
    fill_in "Mycomap blast results", with: @dna_sequence.mycomap_blast_results
    fill_in "Notes", with: @dna_sequence.notes
    fill_in "Provisional species name", with: @dna_sequence.provisional_species_name
    fill_in "Reads in consensus ric", with: @dna_sequence.reads_in_consensus_ric
    fill_in "Sequencing technology", with: @dna_sequence.sequencing_technology
    fill_in "Trace files raw dna data", with: @dna_sequence.trace_files_raw_dna_data
    fill_in "Voucher number", with: @dna_sequence.voucher_number
    click_on "Create Dna sequence"

    assert_text "Dna sequence was successfully created"
    click_on "Back"
  end

  test "should update Dna sequence" do
    visit dna_sequence_url(@dna_sequence)
    click_on "Edit this dna sequence", match: :first

    fill_in "Dna barcode its", with: @dna_sequence.dna_barcode_its
    fill_in "Entered by", with: @dna_sequence.entered_by_id
    fill_in "Genbank accession number", with: @dna_sequence.genbank_accession_number
    fill_in "Genbank number url", with: @dna_sequence.genbank_number_url
    fill_in "Herbarium catalog number", with: @dna_sequence.herbarium_catalog_number
    fill_in "Mushroom id", with: @dna_sequence.mushroom_id_id
    fill_in "Mycomap blast results", with: @dna_sequence.mycomap_blast_results
    fill_in "Notes", with: @dna_sequence.notes
    fill_in "Provisional species name", with: @dna_sequence.provisional_species_name
    fill_in "Reads in consensus ric", with: @dna_sequence.reads_in_consensus_ric
    fill_in "Sequencing technology", with: @dna_sequence.sequencing_technology
    fill_in "Trace files raw dna data", with: @dna_sequence.trace_files_raw_dna_data
    fill_in "Voucher number", with: @dna_sequence.voucher_number
    click_on "Update Dna sequence"

    assert_text "Dna sequence was successfully updated"
    click_on "Back"
  end

  test "should destroy Dna sequence" do
    visit dna_sequence_url(@dna_sequence)
    accept_confirm { click_on "Destroy this dna sequence", match: :first }

    assert_text "Dna sequence was successfully destroyed"
  end
end
