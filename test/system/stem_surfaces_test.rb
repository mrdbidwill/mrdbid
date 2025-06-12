require "application_system_test_case"

class StemSurfacesTest < ApplicationSystemTestCase
  setup do
    @stem_surface = stem_surfaces(:one)
  end

  test "visiting the index" do
    visit stem_surfaces_url
    assert_selector "h1", text: "Stem surfaces"
  end

  test "should create stem surface" do
    visit stem_surfaces_url
    click_on "New stem surface"

    fill_in "Comments", with: @stem_surface.comments
    fill_in "Description", with: @stem_surface.description
    fill_in "Entered by", with: @stem_surface.entered_by_id
    fill_in "Name", with: @stem_surface.name
    fill_in "Source", with: @stem_surface.source_id
    click_on "Create Stem surface"

    assert_text "Stem surface was successfully created"
    click_on "Back"
  end

  test "should update Stem surface" do
    visit stem_surface_url(@stem_surface)
    click_on "Edit this stem surface", match: :first

    fill_in "Comments", with: @stem_surface.comments
    fill_in "Description", with: @stem_surface.description
    fill_in "Entered by", with: @stem_surface.entered_by_id
    fill_in "Name", with: @stem_surface.name
    fill_in "Source", with: @stem_surface.source_id
    click_on "Update Stem surface"

    assert_text "Stem surface was successfully updated"
    click_on "Back"
  end

  test "should destroy Stem surface" do
    visit stem_surface_url(@stem_surface)
    accept_confirm { click_on "Destroy this stem surface", match: :first }

    assert_text "Stem surface was successfully destroyed"
  end
end
