require "application_system_test_case"

class GillThicknessesTest < ApplicationSystemTestCase
  setup do
    @gill_thickness = gill_thicknesses(:one)
  end

  test "visiting the index" do
    visit gill_thicknesses_url
    assert_selector "h1", text: "Gill thicknesses"
  end

  test "should create gill thickness" do
    visit gill_thicknesses_url
    click_on "New gill thickness"

    fill_in "Comments", with: @gill_thickness.comments
    fill_in "Description", with: @gill_thickness.description
    fill_in "Entered by", with: @gill_thickness.entered_by_id
    fill_in "Name", with: @gill_thickness.name
    fill_in "Source", with: @gill_thickness.source_id
    click_on "Create Gill thickness"

    assert_text "Gill thickness was successfully created"
    click_on "Back"
  end

  test "should update Gill thickness" do
    visit gill_thickness_url(@gill_thickness)
    click_on "Edit this gill thickness", match: :first

    fill_in "Comments", with: @gill_thickness.comments
    fill_in "Description", with: @gill_thickness.description
    fill_in "Entered by", with: @gill_thickness.entered_by_id
    fill_in "Name", with: @gill_thickness.name
    fill_in "Source", with: @gill_thickness.source_id
    click_on "Update Gill thickness"

    assert_text "Gill thickness was successfully updated"
    click_on "Back"
  end

  test "should destroy Gill thickness" do
    visit gill_thickness_url(@gill_thickness)
    accept_confirm { click_on "Destroy this gill thickness", match: :first }

    assert_text "Gill thickness was successfully destroyed"
  end
end
