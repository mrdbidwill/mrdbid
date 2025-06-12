require "application_system_test_case"

class PartialInnerVeilAnnularRingPositionsTest < ApplicationSystemTestCase
  setup do
    @partial_inner_veil_annular_ring_position = partial_inner_veil_annular_ring_positions(:one)
  end

  test "visiting the index" do
    visit partial_inner_veil_annular_ring_positions_url
    assert_selector "h1", text: "Partial inner veil annular ring positions"
  end

  test "should create partial inner veil annular ring position" do
    visit partial_inner_veil_annular_ring_positions_url
    click_on "New partial inner veil annular ring position"

    fill_in "Comments", with: @partial_inner_veil_annular_ring_position.comments
    fill_in "Description", with: @partial_inner_veil_annular_ring_position.description
    fill_in "Entered by", with: @partial_inner_veil_annular_ring_position.entered_by_id
    fill_in "Name", with: @partial_inner_veil_annular_ring_position.name
    fill_in "Source", with: @partial_inner_veil_annular_ring_position.source_id
    click_on "Create Partial inner veil annular ring position"

    assert_text "Partial inner veil annular ring position was successfully created"
    click_on "Back"
  end

  test "should update Partial inner veil annular ring position" do
    visit partial_inner_veil_annular_ring_position_url(@partial_inner_veil_annular_ring_position)
    click_on "Edit this partial inner veil annular ring position", match: :first

    fill_in "Comments", with: @partial_inner_veil_annular_ring_position.comments
    fill_in "Description", with: @partial_inner_veil_annular_ring_position.description
    fill_in "Entered by", with: @partial_inner_veil_annular_ring_position.entered_by_id
    fill_in "Name", with: @partial_inner_veil_annular_ring_position.name
    fill_in "Source", with: @partial_inner_veil_annular_ring_position.source_id
    click_on "Update Partial inner veil annular ring position"

    assert_text "Partial inner veil annular ring position was successfully updated"
    click_on "Back"
  end

  test "should destroy Partial inner veil annular ring position" do
    visit partial_inner_veil_annular_ring_position_url(@partial_inner_veil_annular_ring_position)
    accept_confirm { click_on "Destroy this partial inner veil annular ring position", match: :first }

    assert_text "Partial inner veil annular ring position was successfully destroyed"
  end
end
