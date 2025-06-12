require "application_system_test_case"

class StemInteriorsTest < ApplicationSystemTestCase
  setup do
    @stem_interior = stem_interiors(:one)
  end

  test "visiting the index" do
    visit stem_interiors_url
    assert_selector "h1", text: "Stem interiors"
  end

  test "should create stem interior" do
    visit stem_interiors_url
    click_on "New stem interior"

    fill_in "Comments", with: @stem_interior.comments
    fill_in "Description", with: @stem_interior.description
    fill_in "Entered by", with: @stem_interior.entered_by_id
    fill_in "Name", with: @stem_interior.name
    fill_in "Source", with: @stem_interior.source_id
    click_on "Create Stem interior"

    assert_text "Stem interior was successfully created"
    click_on "Back"
  end

  test "should update Stem interior" do
    visit stem_interior_url(@stem_interior)
    click_on "Edit this stem interior", match: :first

    fill_in "Comments", with: @stem_interior.comments
    fill_in "Description", with: @stem_interior.description
    fill_in "Entered by", with: @stem_interior.entered_by_id
    fill_in "Name", with: @stem_interior.name
    fill_in "Source", with: @stem_interior.source_id
    click_on "Update Stem interior"

    assert_text "Stem interior was successfully updated"
    click_on "Back"
  end

  test "should destroy Stem interior" do
    visit stem_interior_url(@stem_interior)
    accept_confirm { click_on "Destroy this stem interior", match: :first }

    assert_text "Stem interior was successfully destroyed"
  end
end
