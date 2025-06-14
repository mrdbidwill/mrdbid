# test/system/annulus_positions_test.rb
require "application_system_test_case"

class AnnulusPositionsTest < ApplicationSystemTestCase
  setup do
    @annulus_position = annulus_positions(:one)
  end

  test "visiting the index" do
    visit annulus_positions_url
    assert_selector "h1", text: "Annulus positions"
  end

  test "creating a new annulus position" do
    visit annulus_positions_url
    click_on "New annulus position"

    fill_in "Name", with: "Test Position"
    fill_in "Description", with: "A new description"
    fill_in "Comments", with: "Some comments"
    fill_in "Source", with: @annulus_position.source_id
    fill_in "Entered by", with: @annulus_position.entered_by_id
    click_on "Create Annulus position"

    assert_text "Annulus position was successfully created"
  end

  test "updating an annulus position" do
    visit annulus_position_url(@annulus_position)
    click_on "Edit this annulus position"

    fill_in "Name", with: "Edited Name"
    click_on "Update Annulus position"

    assert_text "Annulus position was successfully updated"
  end

  test "destroying an annulus position" do
    visit annulus_position_url(@annulus_position)
    accept_confirm { click_on "Destroy this annulus position" }

    assert_text "Annulus position was successfully destroyed"
  end
end