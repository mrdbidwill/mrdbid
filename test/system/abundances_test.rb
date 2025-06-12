require "application_system_test_case"

class AbundancesTest < ApplicationSystemTestCase
  setup do
    @abundance = abundances(:one)
  end

  test "visiting the index" do
    visit abundances_url
    assert_selector "h1", text: "Abundances"
  end

  test "should create abundance" do
    visit abundances_url
    click_on "New abundance"

    fill_in "Comments", with: @abundance.comments
    fill_in "Description", with: @abundance.description
    fill_in "Entered by", with: @abundance.entered_by_id
    fill_in "Name", with: @abundance.name
    fill_in "Source", with: @abundance.source_id
    click_on "Create Abundance"

    assert_text "Abundance was successfully created"
    click_on "Back"
  end

  test "should update Abundance" do
    visit abundance_url(@abundance)
    click_on "Edit this abundance", match: :first

    fill_in "Comments", with: @abundance.comments
    fill_in "Description", with: @abundance.description
    fill_in "Entered by", with: @abundance.entered_by_id
    fill_in "Name", with: @abundance.name
    fill_in "Source", with: @abundance.source_id
    click_on "Update Abundance"

    assert_text "Abundance was successfully updated"
    click_on "Back"
  end

  test "should destroy Abundance" do
    visit abundance_url(@abundance)
    accept_confirm { click_on "Destroy this abundance", match: :first }

    assert_text "Abundance was successfully destroyed"
  end
end
