require "test_helper"

class StemInteriorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stem_interior = stem_interiors(:one)
  end

  test "should get index" do
    get stem_interiors_url
    assert_response :success
  end

  test "should get new" do
    get new_stem_interior_url
    assert_response :success
  end

  test "should create stem_interior" do
    assert_difference("StemInterior.count") do
      post stem_interiors_url, params: { stem_interior: { comments: @stem_interior.comments, description: @stem_interior.description, entered_by_id: @stem_interior.entered_by_id, name: @stem_interior.name, source_id: @stem_interior.source_id } }
    end

    assert_redirected_to stem_interior_url(StemInterior.last)
  end

  test "should show stem_interior" do
    get stem_interior_url(@stem_interior)
    assert_response :success
  end

  test "should get edit" do
    get edit_stem_interior_url(@stem_interior)
    assert_response :success
  end

  test "should update stem_interior" do
    patch stem_interior_url(@stem_interior), params: { stem_interior: { comments: @stem_interior.comments, description: @stem_interior.description, entered_by_id: @stem_interior.entered_by_id, name: @stem_interior.name, source_id: @stem_interior.source_id } }
    assert_redirected_to stem_interior_url(@stem_interior)
  end

  test "should destroy stem_interior" do
    assert_difference("StemInterior.count", -1) do
      delete stem_interior_url(@stem_interior)
    end

    assert_redirected_to stem_interiors_url
  end
end
