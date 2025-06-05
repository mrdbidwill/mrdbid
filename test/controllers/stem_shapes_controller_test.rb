require "test_helper"

class StemShapesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stem_shape = stem_shapes(:one)
  end

  test "should get index" do
    get stem_shapes_url
    assert_response :success
  end

  test "should get new" do
    get new_stem_shape_url
    assert_response :success
  end

  test "should create stem_shape" do
    assert_difference("StemShape.count") do
      post stem_shapes_url, params: { stem_shape: { comments: @stem_shape.comments, description: @stem_shape.description, entered_by_id: @stem_shape.entered_by_id, name: @stem_shape.name, source_id: @stem_shape.source_id } }
    end

    assert_redirected_to stem_shape_url(StemShape.last)
  end

  test "should show stem_shape" do
    get stem_shape_url(@stem_shape)
    assert_response :success
  end

  test "should get edit" do
    get edit_stem_shape_url(@stem_shape)
    assert_response :success
  end

  test "should update stem_shape" do
    patch stem_shape_url(@stem_shape), params: { stem_shape: { comments: @stem_shape.comments, description: @stem_shape.description, entered_by_id: @stem_shape.entered_by_id, name: @stem_shape.name, source_id: @stem_shape.source_id } }
    assert_redirected_to stem_shape_url(@stem_shape)
  end

  test "should destroy stem_shape" do
    assert_difference("StemShape.count", -1) do
      delete stem_shape_url(@stem_shape)
    end

    assert_redirected_to stem_shapes_url
  end
end
