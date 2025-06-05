require "application_system_test_case"

class StemLocationsTest < ApplicationSystemTestCase
  setup do
    @stem_location = stem_locations(:one)
  end

  test "visiting the index" do
    visit stem_locations_url
    assert_selector "h1", text: "Stem locations"
  end

  test "should create stem location" do
    visit stem_locations_url
    click_on "New stem location"

    fill_in "Comments", with: @stem_location.comments
    fill_in "Description", with: @stem_location.description
    fill_in "Entered by", with: @stem_location.entered_by_id
    fill_in "Name", with: @stem_location.name
    fill_in "Source", with: @stem_location.source_id
    click_on "Create Stem location"

    assert_text "Stem location was successfully created"
    click_on "Back"
  end

  test "should update Stem location" do
    visit stem_location_url(@stem_location)
    click_on "Edit this stem location", match: :first

    fill_in "Comments", with: @stem_location.comments
    fill_in "Description", with: @stem_location.description
    fill_in "Entered by", with: @stem_location.entered_by_id
    fill_in "Name", with: @stem_location.name
    fill_in "Source", with: @stem_location.source_id
    click_on "Update Stem location"

    assert_text "Stem location was successfully updated"
    click_on "Back"
  end

  test "should destroy Stem location" do
    visit stem_location_url(@stem_location)
    accept_confirm { click_on "Destroy this stem location", match: :first }

    assert_text "Stem location was successfully destroyed"
  end
end
