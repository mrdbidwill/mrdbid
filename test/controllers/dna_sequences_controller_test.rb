require "test_helper"

class DnaSequencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dna_sequence = dna_sequences(:one)
  end

  test "should get index" do
    get dna_sequences_url
    assert_response :success
  end

  test "should get new" do
    get new_dna_sequence_url
    assert_response :success
  end

  test "should create dna_sequence" do
    assert_difference("DnaSequence.count") do
      post dna_sequences_url, params: { dna_sequence: { dna_barcode_its: @dna_sequence.dna_barcode_its, entered_by_id: @dna_sequence.entered_by_id, genbank_accession_number: @dna_sequence.genbank_accession_number, genbank_number_url: @dna_sequence.genbank_number_url, herbarium_catalog_number: @dna_sequence.herbarium_catalog_number, mushroom_id_id: @dna_sequence.mushroom_id_id, mycomap_blast_results: @dna_sequence.mycomap_blast_results, notes: @dna_sequence.notes, provisional_species_name: @dna_sequence.provisional_species_name, reads_in_consensus_ric: @dna_sequence.reads_in_consensus_ric, sequencing_technology: @dna_sequence.sequencing_technology, trace_files_raw_dna_data: @dna_sequence.trace_files_raw_dna_data, voucher_number: @dna_sequence.voucher_number } }
    end

    assert_redirected_to dna_sequence_url(DnaSequence.last)
  end

  test "should show dna_sequence" do
    get dna_sequence_url(@dna_sequence)
    assert_response :success
  end

  test "should get edit" do
    get edit_dna_sequence_url(@dna_sequence)
    assert_response :success
  end

  test "should update dna_sequence" do
    patch dna_sequence_url(@dna_sequence), params: { dna_sequence: { dna_barcode_its: @dna_sequence.dna_barcode_its, entered_by_id: @dna_sequence.entered_by_id, genbank_accession_number: @dna_sequence.genbank_accession_number, genbank_number_url: @dna_sequence.genbank_number_url, herbarium_catalog_number: @dna_sequence.herbarium_catalog_number, mushroom_id_id: @dna_sequence.mushroom_id_id, mycomap_blast_results: @dna_sequence.mycomap_blast_results, notes: @dna_sequence.notes, provisional_species_name: @dna_sequence.provisional_species_name, reads_in_consensus_ric: @dna_sequence.reads_in_consensus_ric, sequencing_technology: @dna_sequence.sequencing_technology, trace_files_raw_dna_data: @dna_sequence.trace_files_raw_dna_data, voucher_number: @dna_sequence.voucher_number } }
    assert_redirected_to dna_sequence_url(@dna_sequence)
  end

  test "should destroy dna_sequence" do
    assert_difference("DnaSequence.count", -1) do
      delete dna_sequence_url(@dna_sequence)
    end

    assert_redirected_to dna_sequences_url
  end
end
