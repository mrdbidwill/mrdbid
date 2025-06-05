require "application_system_test_case"

class UniversalOuterVeilAppearancesTest < ApplicationSystemTestCase
  setup do
    @universal_outer_veil_appearance = universal_outer_veil_appearances(:one)
  end

  test "visiting the index" do
    visit universal_outer_veil_appearances_url
    assert_selector "h1", text: "Universal outer veil appearances"
  end

  test "should create universal outer veil appearance" do
    visit universal_outer_veil_appearances_url
    click_on "New universal outer veil appearance"

    fill_in "Comments", with: @universal_outer_veil_appearance.comments
    fill_in "Description", with: @universal_outer_veil_appearance.description
    fill_in "Entered by", with: @universal_outer_veil_appearance.entered_by_id
    fill_in "Name", with: @universal_outer_veil_appearance.name
    fill_in "Source", with: @universal_outer_veil_appearance.source_id
    click_on "Create Universal outer veil appearance"

    assert_text "Universal outer veil appearance was successfully created"
    click_on "Back"
  end

  test "should update Universal outer veil appearance" do
    visit universal_outer_veil_appearance_url(@universal_outer_veil_appearance)
    click_on "Edit this universal outer veil appearance", match: :first

    fill_in "Comments", with: @universal_outer_veil_appearance.comments
    fill_in "Description", with: @universal_outer_veil_appearance.description
    fill_in "Entered by", with: @universal_outer_veil_appearance.entered_by_id
    fill_in "Name", with: @universal_outer_veil_appearance.name
    fill_in "Source", with: @universal_outer_veil_appearance.source_id
    click_on "Update Universal outer veil appearance"

    assert_text "Universal outer veil appearance was successfully updated"
    click_on "Back"
  end

  test "should destroy Universal outer veil appearance" do
    visit universal_outer_veil_appearance_url(@universal_outer_veil_appearance)
    accept_confirm { click_on "Destroy this universal outer veil appearance", match: :first }

    assert_text "Universal outer veil appearance was successfully destroyed"
  end
end
