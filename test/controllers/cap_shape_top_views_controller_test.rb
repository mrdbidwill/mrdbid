require "test_helper"

class CapShapeTopViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cap_shape_top_view = cap_shape_top_views(:one)
  end

  test "should get index" do
    get cap_shape_top_views_url
    assert_response :success
  end

  test "should get new" do
    get new_cap_shape_top_view_url
    assert_response :success
  end

  test "should create cap_shape_top_view" do
    assert_difference("CapShapeTopView.count") do
      post cap_shape_top_views_url, params: { cap_shape_top_view: { comments: @cap_shape_top_view.comments, description: @cap_shape_top_view.description, entered_by_id: @cap_shape_top_view.entered_by_id, name: @cap_shape_top_view.name, source_id: @cap_shape_top_view.source_id } }
    end

    assert_redirected_to cap_shape_top_view_url(CapShapeTopView.last)
  end

  test "should show cap_shape_top_view" do
    get cap_shape_top_view_url(@cap_shape_top_view)
    assert_response :success
  end

  test "should get edit" do
    get edit_cap_shape_top_view_url(@cap_shape_top_view)
    assert_response :success
  end

  test "should update cap_shape_top_view" do
    patch cap_shape_top_view_url(@cap_shape_top_view), params: { cap_shape_top_view: { comments: @cap_shape_top_view.comments, description: @cap_shape_top_view.description, entered_by_id: @cap_shape_top_view.entered_by_id, name: @cap_shape_top_view.name, source_id: @cap_shape_top_view.source_id } }
    assert_redirected_to cap_shape_top_view_url(@cap_shape_top_view)
  end

  test "should destroy cap_shape_top_view" do
    assert_difference("CapShapeTopView.count", -1) do
      delete cap_shape_top_view_url(@cap_shape_top_view)
    end

    assert_redirected_to cap_shape_top_views_url
  end
end
