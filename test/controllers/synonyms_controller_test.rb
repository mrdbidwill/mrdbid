require "test_helper"

class SynonymsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @synonym = synonyms(:one)
  end

  test "should get index" do
    get synonyms_url
    assert_response :success
  end

  test "should get new" do
    get new_synonym_url
    assert_response :success
  end

  test "should create synonym" do
    assert_difference("Synonym.count") do
      post synonyms_url, params: { synonym: { comments: @synonym.comments, description: @synonym.description, entered_by_id: @synonym.entered_by_id, name: @synonym.name, source_id: @synonym.source_id } }
    end

    assert_redirected_to synonym_url(Synonym.last)
  end

  test "should show synonym" do
    get synonym_url(@synonym)
    assert_response :success
  end

  test "should get edit" do
    get edit_synonym_url(@synonym)
    assert_response :success
  end

  test "should update synonym" do
    patch synonym_url(@synonym), params: { synonym: { comments: @synonym.comments, description: @synonym.description, entered_by_id: @synonym.entered_by_id, name: @synonym.name, source_id: @synonym.source_id } }
    assert_redirected_to synonym_url(@synonym)
  end

  test "should destroy synonym" do
    assert_difference("Synonym.count", -1) do
      delete synonym_url(@synonym)
    end

    assert_redirected_to synonyms_url
  end
end
