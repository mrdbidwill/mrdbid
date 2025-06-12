require "application_system_test_case"

class PartialInnerVeilFatesTest < ApplicationSystemTestCase
  setup do
    @partial_inner_veil_fate = partial_inner_veil_fates(:one)
  end

  test "visiting the index" do
    visit partial_inner_veil_fates_url
    assert_selector "h1", text: "Partial inner veil fates"
  end

  test "should create partial inner veil fate" do
    visit partial_inner_veil_fates_url
    click_on "New partial inner veil fate"

    fill_in "Comments", with: @partial_inner_veil_fate.comments
    fill_in "Description", with: @partial_inner_veil_fate.description
    fill_in "Entered by", with: @partial_inner_veil_fate.entered_by_id
    fill_in "Name", with: @partial_inner_veil_fate.name
    fill_in "Source", with: @partial_inner_veil_fate.source_id
    click_on "Create Partial inner veil fate"

    assert_text "Partial inner veil fate was successfully created"
    click_on "Back"
  end

  test "should update Partial inner veil fate" do
    visit partial_inner_veil_fate_url(@partial_inner_veil_fate)
    click_on "Edit this partial inner veil fate", match: :first

    fill_in "Comments", with: @partial_inner_veil_fate.comments
    fill_in "Description", with: @partial_inner_veil_fate.description
    fill_in "Entered by", with: @partial_inner_veil_fate.entered_by_id
    fill_in "Name", with: @partial_inner_veil_fate.name
    fill_in "Source", with: @partial_inner_veil_fate.source_id
    click_on "Update Partial inner veil fate"

    assert_text "Partial inner veil fate was successfully updated"
    click_on "Back"
  end

  test "should destroy Partial inner veil fate" do
    visit partial_inner_veil_fate_url(@partial_inner_veil_fate)
    accept_confirm { click_on "Destroy this partial inner veil fate", match: :first }

    assert_text "Partial inner veil fate was successfully destroyed"
  end
end
