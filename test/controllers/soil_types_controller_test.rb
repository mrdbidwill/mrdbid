require "test_helper"

class SoilTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @soil_type = soil_types(:one)
  end

  test "should get index" do
    get soil_types_url
    assert_response :success
  end

  test "should get new" do
    get new_soil_type_url
    assert_response :success
  end

  test "should create soil_type" do
    assert_difference("SoilType.count") do
      post soil_types_url, params: { soil_type: { comments: @soil_type.comments, description: @soil_type.description, entered_by_id: @soil_type.entered_by_id, name: @soil_type.name, source_id: @soil_type.source_id } }
    end

    assert_redirected_to soil_type_url(SoilType.last)
  end

  test "should show soil_type" do
    get soil_type_url(@soil_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_soil_type_url(@soil_type)
    assert_response :success
  end

  test "should update soil_type" do
    patch soil_type_url(@soil_type), params: { soil_type: { comments: @soil_type.comments, description: @soil_type.description, entered_by_id: @soil_type.entered_by_id, name: @soil_type.name, source_id: @soil_type.source_id } }
    assert_redirected_to soil_type_url(@soil_type)
  end

  test "should destroy soil_type" do
    assert_difference("SoilType.count", -1) do
      delete soil_type_url(@soil_type)
    end

    assert_redirected_to soil_types_url
  end
end
