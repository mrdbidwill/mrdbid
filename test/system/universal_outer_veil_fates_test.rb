require "application_system_test_case"

class UniversalOuterVeilFatesTest < ApplicationSystemTestCase
  setup do
    @universal_outer_veil_fate = universal_outer_veil_fates(:one)
  end

  test "visiting the index" do
    visit universal_outer_veil_fates_url
    assert_selector "h1", text: "Universal outer veil fates"
  end

  test "should create universal outer veil fate" do
    visit universal_outer_veil_fates_url
    click_on "New universal outer veil fate"

    fill_in "Comments", with: @universal_outer_veil_fate.comments
    fill_in "Description", with: @universal_outer_veil_fate.description
    fill_in "Entered by", with: @universal_outer_veil_fate.entered_by_id
    fill_in "Name", with: @universal_outer_veil_fate.name
    fill_in "Source", with: @universal_outer_veil_fate.source_id
    click_on "Create Universal outer veil fate"

    assert_text "Universal outer veil fate was successfully created"
    click_on "Back"
  end

  test "should update Universal outer veil fate" do
    visit universal_outer_veil_fate_url(@universal_outer_veil_fate)
    click_on "Edit this universal outer veil fate", match: :first

    fill_in "Comments", with: @universal_outer_veil_fate.comments
    fill_in "Description", with: @universal_outer_veil_fate.description
    fill_in "Entered by", with: @universal_outer_veil_fate.entered_by_id
    fill_in "Name", with: @universal_outer_veil_fate.name
    fill_in "Source", with: @universal_outer_veil_fate.source_id
    click_on "Update Universal outer veil fate"

    assert_text "Universal outer veil fate was successfully updated"
    click_on "Back"
  end

  test "should destroy Universal outer veil fate" do
    visit universal_outer_veil_fate_url(@universal_outer_veil_fate)
    accept_confirm { click_on "Destroy this universal outer veil fate", match: :first }

    assert_text "Universal outer veil fate was successfully destroyed"
  end
end
