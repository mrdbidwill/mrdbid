require "application_system_test_case"

class SoilTypesTest < ApplicationSystemTestCase
  setup do
    @soil_type = soil_types(:one)
  end

  test "visiting the index" do
    visit soil_types_url
    assert_selector "h1", text: "Soil types"
  end

  test "should create soil type" do
    visit soil_types_url
    click_on "New soil type"

    fill_in "Comments", with: @soil_type.comments
    fill_in "Description", with: @soil_type.description
    fill_in "Entered by", with: @soil_type.entered_by_id
    fill_in "Name", with: @soil_type.name
    fill_in "Source", with: @soil_type.source_id
    click_on "Create Soil type"

    assert_text "Soil type was successfully created"
    click_on "Back"
  end

  test "should update Soil type" do
    visit soil_type_url(@soil_type)
    click_on "Edit this soil type", match: :first

    fill_in "Comments", with: @soil_type.comments
    fill_in "Description", with: @soil_type.description
    fill_in "Entered by", with: @soil_type.entered_by_id
    fill_in "Name", with: @soil_type.name
    fill_in "Source", with: @soil_type.source_id
    click_on "Update Soil type"

    assert_text "Soil type was successfully updated"
    click_on "Back"
  end

  test "should destroy Soil type" do
    visit soil_type_url(@soil_type)
    accept_confirm { click_on "Destroy this soil type", match: :first }

    assert_text "Soil type was successfully destroyed"
  end
end
