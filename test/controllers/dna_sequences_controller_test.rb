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
      post dna_sequences_url, params: { dna_sequence: { comments: @dna_sequence.comments, description: @dna_sequence.description, entered_by_id: @dna_sequence.entered_by_id, name: @dna_sequence.name, source_id: @dna_sequence.source_id } }
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
    patch dna_sequence_url(@dna_sequence), params: { dna_sequence: { comments: @dna_sequence.comments, description: @dna_sequence.description, entered_by_id: @dna_sequence.entered_by_id, name: @dna_sequence.name, source_id: @dna_sequence.source_id } }
    assert_redirected_to dna_sequence_url(@dna_sequence)
  end

  test "should destroy dna_sequence" do
    assert_difference("DnaSequence.count", -1) do
      delete dna_sequence_url(@dna_sequence)
    end

    assert_redirected_to dna_sequences_url
  end
end
