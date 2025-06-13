require "application_system_test_case"

class MushroomsTest < ApplicationSystemTestCase
  setup do
    @mushroom = mushrooms(:one)
  end

  test "visiting the index" do
    visit mushrooms_url
    assert_selector "h1", text: "Mushrooms"
  end

  test "should create mushroom" do
    visit mushrooms_url
    click_on "New mushroom"

    fill_in "Comment", with: @mushroom.comment
    fill_in "Common name", with: @mushroom.common_name
    fill_in "Country id", with: @mushroom.country_id
    fill_in "Date found", with: @mushroom.date_found
    fill_in "Description", with: @mushroom.description
    fill_in "Entered by", with: @mushroom.entered_by_id
    fill_in "Fungus type", with: @mushroom.fungus_type_id
    fill_in "Location found city", with: @mushroom.location_found_city
    fill_in "Location found county", with: @mushroom.location_found_county
    check "Location public" if @mushroom.location_public
    fill_in "Mushroom location", with: @mushroom.mushroom_location_id
    fill_in "Mushroom name", with: @mushroom.mushroom_name
    check "Share data" if @mushroom.share_data
    fill_in "State id", with: @mushroom.state_id
    click_on "Create Mushroom"

    assert_text "Mushroom was successfully created"
    click_on "Back"
  end

  test "should update Mushroom" do
    visit mushroom_url(@mushroom)
    click_on "Edit this mushroom", match: :first

    fill_in "Comment", with: @mushroom.comment
    fill_in "Common name", with: @mushroom.common_name
    fill_in "Country id", with: @mushroom.country_id
    fill_in "Date found", with: @mushroom.date_found
    fill_in "Description", with: @mushroom.description
    fill_in "Entered by", with: @mushroom.entered_by_id
    fill_in "Fungus type", with: @mushroom.fungus_type_id
    fill_in "Location found city", with: @mushroom.location_found_city
    fill_in "Location found county", with: @mushroom.location_found_county
    check "Location public" if @mushroom.location_public
    fill_in "Mushroom location", with: @mushroom.mushroom_location_id
    fill_in "Mushroom name", with: @mushroom.mushroom_name
    check "Share data" if @mushroom.share_data
    fill_in "State id", with: @mushroom.state_id
    click_on "Update Mushroom"

    assert_text "Mushroom was successfully updated"
    click_on "Back"
  end

  test "should destroy Mushroom" do
    visit mushroom_url(@mushroom)
    accept_confirm { click_on "Destroy this mushroom", match: :first }

    assert_text "Mushroom was successfully destroyed"
  end
end
