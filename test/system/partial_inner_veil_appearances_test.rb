require "application_system_test_case"

class PartialInnerVeilAppearancesTest < ApplicationSystemTestCase
  setup do
    @partial_inner_veil_appearance = partial_inner_veil_appearances(:one)
  end

  test "visiting the index" do
    visit partial_inner_veil_appearances_url
    assert_selector "h1", text: "Partial inner veil appearances"
  end

  test "should create partial inner veil appearance" do
    visit partial_inner_veil_appearances_url
    click_on "New partial inner veil appearance"

    fill_in "Comments", with: @partial_inner_veil_appearance.comments
    fill_in "Description", with: @partial_inner_veil_appearance.description
    fill_in "Entered by", with: @partial_inner_veil_appearance.entered_by_id
    fill_in "Name", with: @partial_inner_veil_appearance.name
    fill_in "Source", with: @partial_inner_veil_appearance.source_id
    click_on "Create Partial inner veil appearance"

    assert_text "Partial inner veil appearance was successfully created"
    click_on "Back"
  end

  test "should update Partial inner veil appearance" do
    visit partial_inner_veil_appearance_url(@partial_inner_veil_appearance)
    click_on "Edit this partial inner veil appearance", match: :first

    fill_in "Comments", with: @partial_inner_veil_appearance.comments
    fill_in "Description", with: @partial_inner_veil_appearance.description
    fill_in "Entered by", with: @partial_inner_veil_appearance.entered_by_id
    fill_in "Name", with: @partial_inner_veil_appearance.name
    fill_in "Source", with: @partial_inner_veil_appearance.source_id
    click_on "Update Partial inner veil appearance"

    assert_text "Partial inner veil appearance was successfully updated"
    click_on "Back"
  end

  test "should destroy Partial inner veil appearance" do
    visit partial_inner_veil_appearance_url(@partial_inner_veil_appearance)
    accept_confirm { click_on "Destroy this partial inner veil appearance", match: :first }

    assert_text "Partial inner veil appearance was successfully destroyed"
  end
end
