require "test_helper"

class CapMarginShapesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cap_margin_shape = cap_margin_shapes(:one)
  end

  test "should get index" do
    get cap_margin_shapes_url
    assert_response :success
  end

  test "should get new" do
    get new_cap_margin_shape_url
    assert_response :success
  end

  test "should create cap_margin_shape" do
    assert_difference("CapMarginShape.count") do
      post cap_margin_shapes_url, params: { cap_margin_shape: { comments: @cap_margin_shape.comments, description: @cap_margin_shape.description, entered_by_id: @cap_margin_shape.entered_by_id, name: @cap_margin_shape.name, source_id: @cap_margin_shape.source_id } }
    end

    assert_redirected_to cap_margin_shape_url(CapMarginShape.last)
  end

  test "should show cap_margin_shape" do
    get cap_margin_shape_url(@cap_margin_shape)
    assert_response :success
  end

  test "should get edit" do
    get edit_cap_margin_shape_url(@cap_margin_shape)
    assert_response :success
  end

  test "should update cap_margin_shape" do
    patch cap_margin_shape_url(@cap_margin_shape), params: { cap_margin_shape: { comments: @cap_margin_shape.comments, description: @cap_margin_shape.description, entered_by_id: @cap_margin_shape.entered_by_id, name: @cap_margin_shape.name, source_id: @cap_margin_shape.source_id } }
    assert_redirected_to cap_margin_shape_url(@cap_margin_shape)
  end

  test "should destroy cap_margin_shape" do
    assert_difference("CapMarginShape.count", -1) do
      delete cap_margin_shape_url(@cap_margin_shape)
    end

    assert_redirected_to cap_margin_shapes_url
  end
end
