require "test_helper"

class FungusTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fungus_type = fungus_types(:one)
  end

  test "should get index" do
    get fungus_types_url
    assert_response :success
  end

  test "should get new" do
    get new_fungus_type_url
    assert_response :success
  end

  test "should create fungus_type" do
    assert_difference("FungusType.count") do
      post fungus_types_url, params: { fungus_type: { comments: @fungus_type.comments, description: @fungus_type.description, entered_by_id: @fungus_type.entered_by_id, name: @fungus_type.name, source_id: @fungus_type.source_id } }
    end

    assert_redirected_to fungus_type_url(FungusType.last)
  end

  test "should show fungus_type" do
    get fungus_type_url(@fungus_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_fungus_type_url(@fungus_type)
    assert_response :success
  end

  test "should update fungus_type" do
    patch fungus_type_url(@fungus_type), params: { fungus_type: { comments: @fungus_type.comments, description: @fungus_type.description, entered_by_id: @fungus_type.entered_by_id, name: @fungus_type.name, source_id: @fungus_type.source_id } }
    assert_redirected_to fungus_type_url(@fungus_type)
  end

  test "should destroy fungus_type" do
    assert_difference("FungusType.count", -1) do
      delete fungus_type_url(@fungus_type)
    end

    assert_redirected_to fungus_types_url
  end
end
