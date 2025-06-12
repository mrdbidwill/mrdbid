require "application_system_test_case"

class AnnulusPositionsTest < ApplicationSystemTestCase
  setup do
    @annulus_position = annulus_positions(:one)
  end

  test "visiting the index" do
    visit annulus_positions_url
    assert_selector "h1", text: "Annulus positions"
  end

  test "should create annulus position" do
    visit annulus_positions_url
    click_on "New annulus position"

    fill_in "Comments", with: @annulus_position.comments
    fill_in "Description", with: @annulus_position.description
    fill_in "Entered by", with: @annulus_position.entered_by_id
    fill_in "Name", with: @annulus_position.name
    fill_in "Source", with: @annulus_position.source_id
    click_on "Create Annulus position"

    assert_text "Annulus position was successfully created"
    click_on "Back"
  end

  test "should update Annulus position" do
    visit annulus_position_url(@annulus_position)
    click_on "Edit this annulus position", match: :first

    fill_in "Comments", with: @annulus_position.comments
    fill_in "Description", with: @annulus_position.description
    fill_in "Entered by", with: @annulus_position.entered_by_id
    fill_in "Name", with: @annulus_position.name
    fill_in "Source", with: @annulus_position.source_id
    click_on "Update Annulus position"

    assert_text "Annulus position was successfully updated"
    click_on "Back"
  end

  test "should destroy Annulus position" do
    visit annulus_position_url(@annulus_position)
    accept_confirm { click_on "Destroy this annulus position", match: :first }

    assert_text "Annulus position was successfully destroyed"
  end
end
