require "application_system_test_case"

class GillSpacingsTest < ApplicationSystemTestCase
  setup do
    @gill_spacing = gill_spacings(:one)
  end

  test "visiting the index" do
    visit gill_spacings_url
    assert_selector "h1", text: "Gill spacings"
  end

  test "should create gill spacing" do
    visit gill_spacings_url
    click_on "New gill spacing"

    fill_in "Comments", with: @gill_spacing.comments
    fill_in "Description", with: @gill_spacing.description
    fill_in "Entered by", with: @gill_spacing.entered_by_id
    fill_in "Name", with: @gill_spacing.name
    fill_in "Source", with: @gill_spacing.source_id
    click_on "Create Gill spacing"

    assert_text "Gill spacing was successfully created"
    click_on "Back"
  end

  test "should update Gill spacing" do
    visit gill_spacing_url(@gill_spacing)
    click_on "Edit this gill spacing", match: :first

    fill_in "Comments", with: @gill_spacing.comments
    fill_in "Description", with: @gill_spacing.description
    fill_in "Entered by", with: @gill_spacing.entered_by_id
    fill_in "Name", with: @gill_spacing.name
    fill_in "Source", with: @gill_spacing.source_id
    click_on "Update Gill spacing"

    assert_text "Gill spacing was successfully updated"
    click_on "Back"
  end

  test "should destroy Gill spacing" do
    visit gill_spacing_url(@gill_spacing)
    accept_confirm { click_on "Destroy this gill spacing", match: :first }

    assert_text "Gill spacing was successfully destroyed"
  end
end
