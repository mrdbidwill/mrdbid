require "test_helper"

class BulbTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bulb_type = bulb_types(:one)
  end

  test "should get index" do
    get bulb_types_url
    assert_response :success
  end

  test "should get new" do
    get new_bulb_type_url
    assert_response :success
  end

  test "should create bulb_type" do
    assert_difference("BulbType.count") do
      post bulb_types_url, params: { bulb_type: { comments: @bulb_type.comments, description: @bulb_type.description, entered_by_id: @bulb_type.entered_by_id, name: @bulb_type.name, source_id: @bulb_type.source_id } }
    end

    assert_redirected_to bulb_type_url(BulbType.last)
  end

  test "should show bulb_type" do
    get bulb_type_url(@bulb_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_bulb_type_url(@bulb_type)
    assert_response :success
  end

  test "should update bulb_type" do
    patch bulb_type_url(@bulb_type), params: { bulb_type: { comments: @bulb_type.comments, description: @bulb_type.description, entered_by_id: @bulb_type.entered_by_id, name: @bulb_type.name, source_id: @bulb_type.source_id } }
    assert_redirected_to bulb_type_url(@bulb_type)
  end

  test "should destroy bulb_type" do
    assert_difference("BulbType.count", -1) do
      delete bulb_type_url(@bulb_type)
    end

    assert_redirected_to bulb_types_url
  end
end
