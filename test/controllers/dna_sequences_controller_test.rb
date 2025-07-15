require "test_helper"

class DnaSequencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dna_sequences_index_url
    assert_response :success
  end

  test "should get show" do
    get dna_sequences_show_url
    assert_response :success
  end

  test "should get new" do
    get dna_sequences_new_url
    assert_response :success
  end

  test "should get create" do
    get dna_sequences_create_url
    assert_response :success
  end

  test "should get edit" do
    get dna_sequences_edit_url
    assert_response :success
  end

  test "should get update" do
    get dna_sequences_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dna_sequences_destroy_url
    assert_response :success
  end
end
