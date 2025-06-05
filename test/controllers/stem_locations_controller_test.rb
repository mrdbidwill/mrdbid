require "test_helper"

class StemLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stem_location = stem_locations(:one)
  end

  test "should get index" do
    get stem_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_stem_location_url
    assert_response :success
  end

  test "should create stem_location" do
    assert_difference("StemLocation.count") do
      post stem_locations_url, params: { stem_location: { comments: @stem_location.comments, description: @stem_location.description, entered_by_id: @stem_location.entered_by_id, name: @stem_location.name, source_id: @stem_location.source_id } }
    end

    assert_redirected_to stem_location_url(StemLocation.last)
  end

  test "should show stem_location" do
    get stem_location_url(@stem_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_stem_location_url(@stem_location)
    assert_response :success
  end

  test "should update stem_location" do
    patch stem_location_url(@stem_location), params: { stem_location: { comments: @stem_location.comments, description: @stem_location.description, entered_by_id: @stem_location.entered_by_id, name: @stem_location.name, source_id: @stem_location.source_id } }
    assert_redirected_to stem_location_url(@stem_location)
  end

  test "should destroy stem_location" do
    assert_difference("StemLocation.count", -1) do
      delete stem_location_url(@stem_location)
    end

    assert_redirected_to stem_locations_url
  end
end
