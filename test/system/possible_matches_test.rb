require "application_system_test_case"

class PossibleMatchesTest < ApplicationSystemTestCase
  setup do
    @possible_match = possible_matches(:one)
  end

  test "visiting the index" do
    visit possible_matches_url
    assert_selector "h1", text: "Possible matches"
  end

  test "should create possible match" do
    visit possible_matches_url
    click_on "New possible match"

    fill_in "Comments", with: @possible_match.comments
    fill_in "Description", with: @possible_match.description
    fill_in "Entered by", with: @possible_match.entered_by_id
    fill_in "Name", with: @possible_match.name
    fill_in "Source", with: @possible_match.source_id
    click_on "Create Possible match"

    assert_text "Possible match was successfully created"
    click_on "Back"
  end

  test "should update Possible match" do
    visit possible_match_url(@possible_match)
    click_on "Edit this possible match", match: :first

    fill_in "Comments", with: @possible_match.comments
    fill_in "Description", with: @possible_match.description
    fill_in "Entered by", with: @possible_match.entered_by_id
    fill_in "Name", with: @possible_match.name
    fill_in "Source", with: @possible_match.source_id
    click_on "Update Possible match"

    assert_text "Possible match was successfully updated"
    click_on "Back"
  end

  test "should destroy Possible match" do
    visit possible_match_url(@possible_match)
    accept_confirm { click_on "Destroy this possible match", match: :first }

    assert_text "Possible match was successfully destroyed"
  end
end
