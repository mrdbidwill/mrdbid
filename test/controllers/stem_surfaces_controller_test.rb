require "test_helper"

class StemSurfacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stem_surface = stem_surfaces(:one)
  end

  test "should get index" do
    get stem_surfaces_url
    assert_response :success
  end

  test "should get new" do
    get new_stem_surface_url
    assert_response :success
  end

  test "should create stem_surface" do
    assert_difference("StemSurface.count") do
      post stem_surfaces_url, params: { stem_surface: { comments: @stem_surface.comments, description: @stem_surface.description, entered_by_id: @stem_surface.entered_by_id, name: @stem_surface.name, source_id: @stem_surface.source_id } }
    end

    assert_redirected_to stem_surface_url(StemSurface.last)
  end

  test "should show stem_surface" do
    get stem_surface_url(@stem_surface)
    assert_response :success
  end

  test "should get edit" do
    get edit_stem_surface_url(@stem_surface)
    assert_response :success
  end

  test "should update stem_surface" do
    patch stem_surface_url(@stem_surface), params: { stem_surface: { comments: @stem_surface.comments, description: @stem_surface.description, entered_by_id: @stem_surface.entered_by_id, name: @stem_surface.name, source_id: @stem_surface.source_id } }
    assert_redirected_to stem_surface_url(@stem_surface)
  end

  test "should destroy stem_surface" do
    assert_difference("StemSurface.count", -1) do
      delete stem_surface_url(@stem_surface)
    end

    assert_redirected_to stem_surfaces_url
  end
end
