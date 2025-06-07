require "application_system_test_case"

class MushroomLocationsTest < ApplicationSystemTestCase
  setup do
    @mushroom_location = mushroom_locations(:one)
  end

  test "visiting the index" do
    visit mushroom_locations_url
    assert_selector "h1", text: "Mushroom locations"
  end

  test "should create mushroom location" do
    visit mushroom_locations_url
    click_on "New mushroom location"

    fill_in "Comments", with: @mushroom_location.comments
    fill_in "Description", with: @mushroom_location.description
    fill_in "Entered by", with: @mushroom_location.entered_by_id
    fill_in "Name", with: @mushroom_location.name
    fill_in "Source", with: @mushroom_location.source_id
    click_on "Create Mushroom location"

    assert_text "Mushroom location was successfully created"
    click_on "Back"
  end

  test "should update Mushroom location" do
    visit mushroom_location_url(@mushroom_location)
    click_on "Edit this mushroom location", match: :first

    fill_in "Comments", with: @mushroom_location.comments
    fill_in "Description", with: @mushroom_location.description
    fill_in "Entered by", with: @mushroom_location.entered_by_id
    fill_in "Name", with: @mushroom_location.name
    fill_in "Source", with: @mushroom_location.source_id
    click_on "Update Mushroom location"

    assert_text "Mushroom location was successfully updated"
    click_on "Back"
  end

  test "should destroy Mushroom location" do
    visit mushroom_location_url(@mushroom_location)
    accept_confirm { click_on "Destroy this mushroom location", match: :first }

    assert_text "Mushroom location was successfully destroyed"
  end
end
