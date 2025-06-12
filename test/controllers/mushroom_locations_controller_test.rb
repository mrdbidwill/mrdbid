require "test_helper"

class MushroomLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mushroom_location = mushroom_locations(:one)
  end

  test "should get index" do
    get mushroom_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_mushroom_location_url
    assert_response :success
  end

  test "should create mushroom_location" do
    assert_difference("MushroomLocation.count") do
      post mushroom_locations_url, params: { mushroom_location: { comments: @mushroom_location.comments, description: @mushroom_location.description, entered_by_id: @mushroom_location.entered_by_id, name: @mushroom_location.name, source_id: @mushroom_location.source_id } }
    end

    assert_redirected_to mushroom_location_url(MushroomLocation.last)
  end

  test "should show mushroom_location" do
    get mushroom_location_url(@mushroom_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_mushroom_location_url(@mushroom_location)
    assert_response :success
  end

  test "should update mushroom_location" do
    patch mushroom_location_url(@mushroom_location), params: { mushroom_location: { comments: @mushroom_location.comments, description: @mushroom_location.description, entered_by_id: @mushroom_location.entered_by_id, name: @mushroom_location.name, source_id: @mushroom_location.source_id } }
    assert_redirected_to mushroom_location_url(@mushroom_location)
  end

  test "should destroy mushroom_location" do
    assert_difference("MushroomLocation.count", -1) do
      delete mushroom_location_url(@mushroom_location)
    end

    assert_redirected_to mushroom_locations_url
  end
end
