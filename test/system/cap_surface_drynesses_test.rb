require "application_system_test_case"

class CapSurfaceDrynessesTest < ApplicationSystemTestCase
  setup do
    @cap_surface_dryness = cap_surface_drynesses(:one)
  end

  test "visiting the index" do
    visit cap_surface_drynesses_url
    assert_selector "h1", text: "Cap surface drynesses"
  end

  test "should create cap surface dryness" do
    visit cap_surface_drynesses_url
    click_on "New cap surface dryness"

    fill_in "Comments", with: @cap_surface_dryness.comments
    fill_in "Description", with: @cap_surface_dryness.description
    fill_in "Entered by", with: @cap_surface_dryness.entered_by_id
    fill_in "Name", with: @cap_surface_dryness.name
    fill_in "Source", with: @cap_surface_dryness.source_id
    click_on "Create Cap surface dryness"

    assert_text "Cap surface dryness was successfully created"
    click_on "Back"
  end

  test "should update Cap surface dryness" do
    visit cap_surface_dryness_url(@cap_surface_dryness)
    click_on "Edit this cap surface dryness", match: :first

    fill_in "Comments", with: @cap_surface_dryness.comments
    fill_in "Description", with: @cap_surface_dryness.description
    fill_in "Entered by", with: @cap_surface_dryness.entered_by_id
    fill_in "Name", with: @cap_surface_dryness.name
    fill_in "Source", with: @cap_surface_dryness.source_id
    click_on "Update Cap surface dryness"

    assert_text "Cap surface dryness was successfully updated"
    click_on "Back"
  end

  test "should destroy Cap surface dryness" do
    visit cap_surface_dryness_url(@cap_surface_dryness)
    accept_confirm { click_on "Destroy this cap surface dryness", match: :first }

    assert_text "Cap surface dryness was successfully destroyed"
  end
end
