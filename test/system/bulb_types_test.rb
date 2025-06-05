require "application_system_test_case"

class BulbTypesTest < ApplicationSystemTestCase
  setup do
    @bulb_type = bulb_types(:one)
  end

  test "visiting the index" do
    visit bulb_types_url
    assert_selector "h1", text: "Bulb types"
  end

  test "should create bulb type" do
    visit bulb_types_url
    click_on "New bulb type"

    fill_in "Comments", with: @bulb_type.comments
    fill_in "Description", with: @bulb_type.description
    fill_in "Entered by", with: @bulb_type.entered_by_id
    fill_in "Name", with: @bulb_type.name
    fill_in "Source", with: @bulb_type.source_id
    click_on "Create Bulb type"

    assert_text "Bulb type was successfully created"
    click_on "Back"
  end

  test "should update Bulb type" do
    visit bulb_type_url(@bulb_type)
    click_on "Edit this bulb type", match: :first

    fill_in "Comments", with: @bulb_type.comments
    fill_in "Description", with: @bulb_type.description
    fill_in "Entered by", with: @bulb_type.entered_by_id
    fill_in "Name", with: @bulb_type.name
    fill_in "Source", with: @bulb_type.source_id
    click_on "Update Bulb type"

    assert_text "Bulb type was successfully updated"
    click_on "Back"
  end

  test "should destroy Bulb type" do
    visit bulb_type_url(@bulb_type)
    accept_confirm { click_on "Destroy this bulb type", match: :first }

    assert_text "Bulb type was successfully destroyed"
  end
end
