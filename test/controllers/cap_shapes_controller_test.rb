require "test_helper"

class CapShapesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cap_shape = cap_shapes(:one)
  end

  test "should get index" do
    get cap_shapes_url
    assert_response :success
  end

  test "should get new" do
    get new_cap_shape_url
    assert_response :success
  end

  test "should create cap_shape" do
    assert_difference("CapShape.count") do
      post cap_shapes_url, params: { cap_shape: { comments: @cap_shape.comments, description: @cap_shape.description, entered_by_id: @cap_shape.entered_by_id, name: @cap_shape.name, source_id: @cap_shape.source_id } }
    end

    assert_redirected_to cap_shape_url(CapShape.last)
  end

  test "should show cap_shape" do
    get cap_shape_url(@cap_shape)
    assert_response :success
  end

  test "should get edit" do
    get edit_cap_shape_url(@cap_shape)
    assert_response :success
  end

  test "should update cap_shape" do
    patch cap_shape_url(@cap_shape), params: { cap_shape: { comments: @cap_shape.comments, description: @cap_shape.description, entered_by_id: @cap_shape.entered_by_id, name: @cap_shape.name, source_id: @cap_shape.source_id } }
    assert_redirected_to cap_shape_url(@cap_shape)
  end

  test "should destroy cap_shape" do
    assert_difference("CapShape.count", -1) do
      delete cap_shape_url(@cap_shape)
    end

    assert_redirected_to cap_shapes_url
  end
end
